import 'package:flutter/material.dart';
import 'dart:ui';
import 'game_model.dart';
import 'cat_lady.dart';

void main() {
  runApp(const MyApp());
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
      title: 'Score Tracker',
      scrollBehavior: AppScrollBehavior(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
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
                      print('Clicked ${displayedGames[index].name}');
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
      ],
    ),
  );
  }
}
  





    

