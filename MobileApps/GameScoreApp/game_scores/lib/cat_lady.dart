import 'package:flutter/material.dart';


class CatLadyPlayer{
  String name; 
  int catScore = 0;
  int catnipScore = 0;
  int costumeScore = 0;
  int penaltyScore = 0;

  Map<String, int> toyCount = {
    'Mouse': 0,
    'Cat Yarn': 0,
    'Cat Tower': 0,
    'Laser Pointer': 0,
    'Feather Wand': 0,
  };

  CatLadyPlayer({required this.name});
  
  int get toyScore {
    const points = {
      0: 0,
      1: 1,
      2: 3,
      3: 5,
      4: 7,
      5: 12,
    };
    List<int> count = toyCount.values.toList();
    int totalToyScore = 0;

    while(count.any((c) => c > 0)){
      int uniqueToys = 0;

      for (int i = 0; i < count.length; i++){
        if (count[i] > 0){
          uniqueToys++;
          count[i]--;
        }
      }
      totalToyScore += points[uniqueToys] ?? 0;
    }
    return totalToyScore;
  }

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

  void _toysDialog(CatLadyPlayer player){
    showDialog(
     context: context, 
     builder: (context) {
      return StatefulBuilder(
        builder : (context, setDialogState){
          return AlertDialog(
            title: Column(
              children: [
                const Text('TOYS'),
                Text(
                  '+${player.toyScore} points',
                  style: const TextStyle(color: Colors.deepPurple, fontSize: 24, fontWeight: FontWeight.bold)
                ),
              ]
            ),
            content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: player.toyCount.keys.map((toyName) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(toyName, style: const TextStyle(fontSize: 16)),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle, color: Colors.redAccent),
                                onPressed: () {
                                  if (player.toyCount[toyName]! > 0) {
     
                                    setDialogState(() => player.toyCount[toyName] = player.toyCount[toyName]! - 1);

                                    setState(() {});
                                  }
                                },
                              ),
                              SizedBox(
                                width: 24,
                                child: Text('${player.toyCount[toyName]}', textAlign: TextAlign.center, style: const TextStyle(fontSize: 18)),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_circle, color: Colors.green),
                                onPressed: () {
                                  setDialogState(() => player.toyCount[toyName] = player.toyCount[toyName]! + 1);
                                  setState(() {});
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Done'),
                ),
              ],
            );
          }
        );
      }
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

                const SizedBox(height: 20),
                _buildScoreRow('Fed Cats  (+${currentPlayer.catScore} pts)', currentPlayer.catScore, (change) {
                  setState(() => currentPlayer.catScore += change);
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Toys (+${currentPlayer.toyScore} pts)', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                      ElevatedButton.icon(
                        onPressed: () => _toysDialog(currentPlayer),
                        icon: const Icon(Icons.edit, size: 18),
                        label: const Text('Add Toys'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 223, 224, 207),
                          elevation: 0,
                        ),
                      )
                    ],
                  ),
                ),
                _buildScoreRow('Catnip  (+${currentPlayer.catnipScore} pts)', currentPlayer.catnipScore, (change) {
                  setState(() => currentPlayer.catnipScore += change);
                }),
                _buildScoreRow('Costumes  (+${currentPlayer.costumeScore} pts)', currentPlayer.costumeScore, (change) {
                  setState(() => currentPlayer.costumeScore += change);
                }),
                const Divider(), 
                _buildScoreRow('Penalties  (-${currentPlayer.penaltyScore} pts)', currentPlayer.penaltyScore, (change) {
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