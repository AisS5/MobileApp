import 'package:flutter/material.dart';

class CatLadyPlayer{
  String name; 
  int catScore = 0;
  int toyScore = 0;
  int catnipScore = 0;
  int costumeScore = 0;
  int penaltyScore = 0;

  CatLadyPlayer({required this.name});

  int get totalScore => catScore + toyScore + catnipScore + costumeScore - penaltyScore;

}

class CatLadyScreen extends StatefulWidget {
  const CatLadyScreen({super.key});

  @override
  State<CatLadyScreen> createState() => _CatLadyScreenState();
}

class _CatLadyScreenState extends State<CatLadyScreen> {
  
  List<CatLadyPlayer> players = [CatLadyPlayer(name: 'Player 1')];

  final PageController _pageController = PageController();
  final TextEditingController _nameController = TextEditingController();
 

  void _addPlayer(){
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: const Text('Add Player'),
          content: TextField(
            controller: _nameController,
            decoration: const InputDecoration(hintText: 'Player Name'),
            textCapitalization: TextCapitalization.words,
          ),
          actions: [
            TextButton(
              onPressed: (){
                if (_nameController.text.trim().isNotEmpty){
                  setState((){
                    players.add(CatLadyPlayer(name: _nameController.text.trim()));
                    _nameController.clear();
                  });

                  Navigator.pop(context);

                  Future.delayed(const Duration(milliseconds: 100), (){
                    _pageController.animateToPage(
                      players.length - 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  });
                }
              },
              child: const Text('Add'),
            ),
          ],
        ),
        
      );
  }

  Widget _buildScoreRow(String title, int currentValue, Function(int) onChanged){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18)),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle, color: Colors.redAccent),
                onPressed: () => onChanged(-1),
              ),
              SizedBox(
                width: 40,
                child: Text(
                  '$currentValue',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle, color: Colors.greenAccent),
                onPressed: () => onChanged(1),
              ),
            ],
          ),
        ],
      ),
      );
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Lady Score'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: _addPlayer,
            tooltip: 'Add Player',
          )
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: players.length,
        itemBuilder: (context, index) {
          CatLadyPlayer currentPlayer = players[index];

          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),

                Text(
                  currentPlayer.name,
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),

                Text(
                  'Player ${index + 1} of ${players.length} (Swipe ↔)', 
                  style: const TextStyle(color: Colors.grey)
                ),

                const SizedBox(height: 20),
                _buildScoreRow('Fed Cats', currentPlayer.catScore, (change) {
                  setState(() => currentPlayer.catScore += change);
                }),
                _buildScoreRow('Toys', currentPlayer.toyScore, (change) {
                  setState(() => currentPlayer.toyScore += change);
                }),
                _buildScoreRow('Catnip', currentPlayer.catnipScore, (change) {
                  setState(() => currentPlayer.catnipScore += change);
                }),
                _buildScoreRow('Costumes', currentPlayer.costumeScore, (change) {
                  setState(() => currentPlayer.costumeScore += change);
                }),
                const Divider(), 
                _buildScoreRow('Penalties', currentPlayer.penaltyScore, (change) {
                  if (currentPlayer.penaltyScore + change >= 0) {
                    setState(() => currentPlayer.penaltyScore += change);
                  }
                }),
                const SizedBox(height: 40,),
                const Text('Total Score', style: TextStyle(fontSize: 24, color: Colors.grey)),
                Text(
                  '${currentPlayer.totalScore}',
                  style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
              ],
            ),
          );
        },  
     ),
     floatingActionButton: FloatingActionButton.extended(
        onPressed: _addPlayer,
        icon: const Icon(Icons.add),
        label: const Text('Player'),
        backgroundColor: Colors.orange.shade300,
      ),
    );
  }

}