import 'package:flutter/material.dart';
import 'dart:ui';
import 'game_model.dart';
import 'cat_lady.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'http://10.0.2.2:54321',
    //url: 'https://wbvdhxzjcmzlsohsderr.supabase.co',
    publishableKey: 'sb_publishable_IOh-t-a87B1t2r6ROoLrgw_fJ34xVVD',
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

void checkConnection() async {
  try{
    await supabase.from('profiles').select().limit(1);
    debugPrint('Supabase connection successful');
  } catch(e){
    debugPrint('Supabase connection failed: $e');
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}

const List<Game> games = [
      Game(id: 'cat_lady', name: 'Cat Lady'), 
      Game(id: 'scrabble', name: 'Scrabble'), 
      Game(id: 'ticket_to_ride', name: 'Ticket to Ride'), 
      
    ];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Board Game Tracker',
      scrollBehavior: AppScrollBehavior(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        useMaterial3: true,
      ),
      home: StreamBuilder<AuthState>(
        stream: supabase.auth.onAuthStateChange,
        builder: (context, asyncSnapshot) {
          final session = supabase.auth.currentSession;
          if(session != null){
            return const HomeScreen();
          }else{
            return const AuthScreen();
          }
        }
        
      ),
      
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  List<Game> displayedGames = [];
  @override
  void initState(){
    super.initState();
    displayedGames = games;
  }
  void _searchFilter(String query){
    List<Game> filteredGames = [];
    if(query.isEmpty){
      filteredGames = games;
    }else {
      filteredGames = games.where((game)=> game.name.toLowerCase().contains(query.toLowerCase())).toList();
    }
    setState((){
      displayedGames = filteredGames;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('GAMES'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value)=> _searchFilter(value),
              decoration: InputDecoration(
                hintText: 'Search Games...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0)
                ), 
              ),
             
            ),
          ),
          Expanded(
            child: displayedGames.isEmpty ? const Center(
              child: Text('No games found', style: TextStyle(fontSize:18, fontWeight: FontWeight.bold))
            )
            :GridView.builder(
              padding: const EdgeInsets.symmetric( horizontal: 16, vertical: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, 
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 3/2
              ),
              itemCount: displayedGames.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: InkWell(
                    onTap: (){

                      if(displayedGames[index].id == 'cat_lady'){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const CatLadyScreen()));
                      }
                    },
                    child: Center(
                      child: Text(
                        displayedGames[index].name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,                        
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                   
                );
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sign Out',
            onPressed: () async {
              await supabase.auth.signOut();
            },
          ),
      ],
    ),
  );
  }
}
  

class AuthScreen extends StatefulWidget { 
  const AuthScreen({super.key});

  @override 
  State<AuthScreen> createState() => _AuthScreenState();

}
class _AuthScreenState extends State<AuthScreen>{
  bool _isSignUp = false;
  bool _isLoading = false; 

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  Future<void> _authenticate() async {
    setState(() => _isLoading = true);
    try{ 
      if(_isSignUp){ 
        if(_nameController.text.trim().isEmpty){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Enter a Username')));
          setState(() => _isLoading = false);
          return;
        }
        await supabase.auth.signUp(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          data: {'username': _nameController.text.trim()},
        );
      }else {
        await supabase.auth.signInWithPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      }
    } catch(e) {
      if(!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      if(mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(_isSignUp ? 'Sign Up' : 'Sign In'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(_isSignUp)
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              _isLoading 
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _authenticate,
                    child: Text(_isSignUp ? 'Sign Up' : 'Sign In'),
                  ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isSignUp = !_isSignUp;
                  });
                },
                child: Text(_isSignUp ? 'Already have an account? Sign In' : 'Don\'t have an account? Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





    

