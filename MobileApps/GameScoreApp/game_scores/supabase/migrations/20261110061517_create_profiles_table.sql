
create table public.profiles (
  id uuid references auth.users on delete cascade primary key,
  username text unique,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

create or replace function public.handle_new_user()
returns trigger
security definer set search_path = ''
as $$
begin
  insert into public.profiles (id, username)
  values (new.id, new.email);
  return new;
end;
$$ language plpgsql;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

alter table public.profiles enable row level security;
create policy "Public profiles are viewable by everyone."
  on public.profiles for select
  using ( true );
  
create policy "Users can insert their own profile."
    on public.profiles for insert
    with check ( (select auth.uid()) = id );

create policy "Users can update their own profile."
  on public.profiles for update
  using ( (select auth.uid()) = id );