import 'package:flutter/material.dart';



class CatLadyScreen extends StatefulWidget {
  const CatLadyScreen({super.key});

  @override
  State<CatLadyScreen> createState() => _CatLadyScreenState();
}

class _CatLadyScreenState extends State<CatLadyScreen> {

  int catScore = 0;
  int toyScore = 0;
  int catnipScore = 0;
  int costumeScore = 0;
  int penaltyScore = 0;

  int get totalScore => catScore + toyScore + catnipScore + costumeScore - penaltyScore;


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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildScoreRow('Fed Cats', catScore, (change) {
              setState(() => catScore += change);
            }),
            _buildScoreRow('Toys', toyScore, (change) {
              setState(() => toyScore += change);
            }),
            _buildScoreRow('Catnip', catnipScore, (change) {
              setState(() => catnipScore += change);
            }),
            _buildScoreRow('Costumes', costumeScore, (change) {
              setState(() => costumeScore += change);
            }),
            const Divider(), 
            _buildScoreRow('Penalties', penaltyScore, (change) {
              if (penaltyScore + change >= 0) {
                setState(() => penaltyScore += change);
              }
            }),
          const Divider(),
          const SizedBox(height: 40,),
          const Text('Total Score', style: TextStyle(fontSize: 24, color: Colors.grey)),
            Text(
              '$totalScore',
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
          ],
        ),
     ),
    );
  }

}