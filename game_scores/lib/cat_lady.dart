import 'package:flutter/material.dart';

enum CatColour { orange, black, white}
enum FoodType { chicken, tuna, milk}

class CatCard{
  final String id;
  final String name;  
  final int basePoint;
  final List<CatColour> colour;
  List<FoodType> foodType; 
  final String? specialAbility;
  final bool requiresInput;
  int customInput; 
  FoodType? truffleFoodType;
  Map<FoodType, int> customFood;

  CatCard({
    required this.id,
    required this.name,
    this.basePoint = 0,
    this.colour = const [],
    this.specialAbility,
    this.requiresInput = false,
    this.customInput = 0,
    this.foodType = const [],
    this.truffleFoodType,
    Map<FoodType, int>? customFood,
  }) : customFood = customFood ?? {};

  CatCard copy() {
    return CatCard(
      id: id,
      name: name,
      basePoint: basePoint,
      colour: List<CatColour>.from(colour),
      specialAbility: specialAbility,
      requiresInput: requiresInput,
      customInput: customInput,
      foodType: List<FoodType>.from(foodType),
      truffleFoodType: truffleFoodType,
      customFood: Map<FoodType, int>.from(customFood),
    );
  }

  int get totalFoodCubes => customFood.values.fold(0, (sum, count) => sum + count);
}

final List<CatCard> catCards = [
  CatCard(id: 'sweetheart', name: 'Sweetheart', basePoint: 5, foodType: [FoodType.tuna, FoodType.chicken],  colour: [CatColour.white, CatColour.black, CatColour.orange]),
  CatCard(id: 'moonbeam', name: 'Moonbeam', basePoint: 3, foodType: [FoodType.tuna, FoodType.chicken],  colour: [CatColour.white]),
  CatCard(id: 'gershon', name: 'Gershon', basePoint: 1, foodType: [FoodType.chicken], colour: [CatColour.white]),
  CatCard(id: 'sox', name: 'Sox', basePoint: 6, foodType: [FoodType.tuna, FoodType.milk], colour: [CatColour.white]),
  CatCard(id: 'sircuddleface', name: 'Sir Cuddleface', basePoint: 4, foodType: [FoodType.milk], colour: [CatColour.white]),
  CatCard(id: 'sparkle', name: 'Sparkle', basePoint: 3, foodType: [FoodType.tuna],  colour: [CatColour.white]),
  CatCard(id: 'chairmanmeow', name: 'Chairman Meow', basePoint: 6, foodType: [FoodType.chicken], colour: [CatColour.orange]),
  CatCard(id: 'snowflake', name: 'Snowflake', basePoint: 2, foodType: [FoodType.milk],  colour: [CatColour.white]),
  CatCard(id: 'pumpkin', name: 'Pumpkin', basePoint: 6, foodType: [FoodType.milk, FoodType.chicken],  colour: [CatColour.orange]),
  CatCard(id: 'lily', name: 'Lily', basePoint: 2, foodType: [FoodType.milk],  colour: [CatColour.black]),
  CatCard(id: 'chester', name: 'Chester', basePoint: 1, foodType: [FoodType.tuna],  colour: [CatColour.orange]),
  CatCard(id: 'cooper', name: 'Cooper', basePoint: 1, foodType: [FoodType.chicken],  colour: [CatColour.white]),
  CatCard(id: 'henriette', name: 'Henriette Van Weelde', basePoint: 5, foodType: [FoodType.milk, FoodType.chicken, FoodType.tuna],  colour: [CatColour.white, CatColour.black, CatColour.orange]),
  CatCard(id: 'blackberry', name: 'Blackberry', basePoint: 3, foodType: [FoodType.chicken],  colour: [CatColour.black]),
  CatCard(id: 'zeus', name: 'Zeus', basePoint: 3, foodType: [FoodType.chicken],  colour: [CatColour.orange]),
  CatCard(id: 'bronte', name: 'Bronte', basePoint: 3, foodType: [FoodType.tuna],  colour: [CatColour.orange]),
  CatCard(id: 'keaton', name: 'Keaton', basePoint: 4, foodType: [FoodType.milk],  colour: [CatColour.black]),
  CatCard(id: 'bell', name: 'Bell', basePoint: 1, foodType: [FoodType.chicken],  colour: [CatColour.orange]),
  CatCard(id: 'pablopicatso', name: 'Pablo Picatso', basePoint: 6, foodType: [FoodType.tuna],  colour: [CatColour.black]),
  CatCard(id: 'jagg', name: 'Jagg', basePoint: 1, foodType: [FoodType.tuna],  colour: [CatColour.black]),

  CatCard(id: 'luna', name: 'Luna', foodType: [FoodType.tuna, FoodType.chicken], colour: [CatColour.white, CatColour.black]),
  CatCard(id: 'dinah', name: 'Dinah', foodType: [FoodType.milk, FoodType.chicken],  colour: [CatColour.orange, CatColour.white]),
  CatCard(id: 'alvin', name: 'Alvin', foodType: [FoodType.milk, FoodType.tuna],  colour: [CatColour.orange, CatColour.black]),
  CatCard(id: 'macak', name: 'Macak', basePoint: 2, foodType: [FoodType.milk],  colour: [CatColour.orange]),
  CatCard(id: 'levarpurrton', name: 'Levar Purrton', foodType: [FoodType.tuna, FoodType.chicken],  colour: [CatColour.white]),
  CatCard(id: 'penny', name: 'Penny', foodType: [FoodType.milk], colour: [CatColour.orange]),
  CatCard(id: 'zoroaster', name: 'Zoroaster', foodType: [FoodType.chicken], colour: [CatColour.black]),
  CatCard(id: 'eliot', name: 'Eliot', foodType: [FoodType.tuna, FoodType.chicken],  colour: [CatColour.black]),
  CatCard(id: 'antoinette', name: 'Antoinette', foodType: [FoodType.milk, FoodType.tuna],  colour: [CatColour.white]),
  CatCard(id: 'florence', name: 'Florence', foodType: [FoodType.milk, FoodType.chicken],  colour: [CatColour.orange]),
  CatCard(id: 'hemingway', name: 'Hemingway', foodType: [FoodType.milk],  colour: [CatColour.black]),

  CatCard(id: 'cow', name: 'Cow', colour: [CatColour.white], requiresInput: true),
  CatCard(id: 'waffle', name: 'Waffle', colour: [CatColour.orange], requiresInput: true),
  CatCard(id: 'truffle', name: 'Truffle', colour: [CatColour.black], requiresInput: true),


];


class CatLadyPlayer{
  String name; 
  List<CatCard> fedCats = [];

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

  int calculateCostumeScore(List<CatLadyPlayer> allPlayers){
    if(costumeScore == 0) return -2; 

    int maxCostume = allPlayers.map((p) => p.costumeScore).fold(0, (a, b) => a > b ? a : b);
    bool hasMost = costumeScore == maxCostume && costumeScore > 0;

    return hasMost ? 6: 0;
  }


  bool get hasMacak => fedCats.any((cat) => cat.id == 'macak');
  int get effectiveCatnipCount => catnipScore + (hasMacak ? 1 : 0);

  int get totalCatnipScore {
    int totalCatnip = effectiveCatnipCount;
    int fedcats = fedCats.length;

    if(totalCatnip == 0){
      return 0;
    } else if (totalCatnip == 1){
      return -2;
    } else if (totalCatnip >= 2 && totalCatnip <= 3){
      return fedcats * 1;
    }else{
      return fedcats * 2;
    }

  }

  int get totalToyCount => toyCount.values.fold(0, (sum, count) => sum + count);
  int calculateFedCat(List<CatLadyPlayer> allPlayers) {
    int score = 0; 
    int orangeCats = 0;
    int blackCats = 0;
    int whiteCats = 0;

    for (var cat in fedCats){
      if (cat.colour.contains(CatColour.orange)) orangeCats++;
      if (cat.colour.contains(CatColour.black)) blackCats++;
      if (cat.colour.contains(CatColour.white)) whiteCats++;
    }

    for (var cat in fedCats){
      score += cat.basePoint;

      switch(cat.id){
        case 'florence':
          score += orangeCats * 2;
          break;
        case 'alvin':
          score += orangeCats * 1;
          break;
        case 'antoinette':
          score += whiteCats * 2;
          break;
        case 'dinah':
          score += whiteCats * 1;
          break;
        case 'eliot':
          score += blackCats * 2;
          break;
        case 'luna':
          score += blackCats * 1;
          break;
        case 'waffle':
          score += (cat.totalFoodCubes.clamp(0, 4)) * 3;
          break;
        case 'levarpurrton': 
          int colourSets = [orangeCats, blackCats, whiteCats].reduce((a, b) => a < b ? a : b);
          score += colourSets * 4;
          break;
        case 'zoroaster': 
          score += costumeScore * 2;
          break;
        case 'penny': 
          score += totalToyCount;
          break;
        case 'cow': 
            score += cat.totalFoodCubes * 2;
            break;       
        case 'hemingway': 
            int maxCatFed = allPlayers.map((p) => p.fedCats.length).fold(0, (a, b) => a > b ? a : b);
            bool isMost = fedCats.length == maxCatFed && fedCats.isNotEmpty;
            score += isMost ? 7 : 3;
            break;
        case 'truffle':
          if(cat.truffleFoodType != null){
            int matchingCats = fedCats.where((otherCat){
              return otherCat != cat && otherCat.foodType.contains(cat.truffleFoodType);
            }).length;
            score += matchingCats * 2;
          }
          break;
      }
    }
    return score;
  }

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

  int calculateTotalScore(List<CatLadyPlayer> allPlayers){
    return calculateFedCat(allPlayers) + toyScore + totalCatnipScore + calculateCostumeScore(allPlayers) - penaltyScore;
  }

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

  String _getCatChipLabel(CatCard cat) {
    if (cat.id == 'truffle') {
      return '${cat.name} (${cat.truffleFoodType?.name.toUpperCase() ?? 'NONE'})';
    } else if (cat.id == 'waffle' || cat.id == 'cow') {
      if (cat.customFood.isEmpty) return cat.name;
      final details = cat.customFood.entries
          .where((e) => e.value > 0)
          .map((e) => '${e.value} ${e.key.name[0].toUpperCase()}')
          .join(', ');
      return details.isNotEmpty ? '${cat.name} ($details)' : cat.name;
    }
    return cat.name;
  }
 

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

  void _showAddCatDialog(CatLadyPlayer player){
    String searchQuery = '';
    showDialog(
      context: context, 
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState){
            final filteredCats = catCards.where((cat){
              return cat.name.toLowerCase().contains(searchQuery.toLowerCase());
            }).toList();

            return AlertDialog(
              title: const Text('Add Fed Cat'),
              content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Search cat name',
                        prefixIcon: Icon(Icons.search),
                      ),
                      onChanged: (value){
                        setDialogState(() => searchQuery = value);
                      },
                    ),
                    const SizedBox(height: 10),
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: filteredCats.length,
                        itemBuilder: (context, index){
                          final cat = filteredCats[index];
                          return ListTile(
                            title: Text(cat.name),  
                            trailing: const Icon(Icons.add_circle_outline, color: Colors.green), 
                            onTap: (){
                              final newCat = cat.copy();
                              if (newCat.requiresInput){
                                _promptInput(newCat, player);
                              }else{
                                setState(() => player.fedCats.add(newCat));
                                Navigator.pop(context);
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );
      }
    );  
  }

  

  void _promptInput(CatCard cat, CatLadyPlayer player){
    if(cat.id == 'truffle'){
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: const Text("Select Food Type"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: FoodType.values.map((type){
              String label = type.name[0].toUpperCase() + type.name.substring(1);
              return ListTile(
                title: Text(label),
                onTap: () {
                  cat.truffleFoodType = type;
                  setState(() {
                    player.fedCats.add(cat);
                  });
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        ),
      );
    } else if (cat.id == 'waffle'){

      FoodType selectedFoodType = FoodType.values.first;
      int cubeCount = 1;

      showDialog(
        context: context, 
        builder: (context) => StatefulBuilder(
          builder: (context, setDialogState) => AlertDialog(
              title: const Text("Food Fed"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButton<FoodType>(
                    value: selectedFoodType,
                    isExpanded: true,
                    items: FoodType.values.map((type) {
                      String label = type.name[0].toUpperCase() + type.name.substring(1);
                      return DropdownMenuItem<FoodType>(
                        value: type,
                        child: Text(label),
                      );
                    }).toList(),
                    onChanged: (val) {
                      if (val != null) {
                        setDialogState(() => selectedFoodType = val);
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle, color: Colors.red),
                        onPressed: () {
                          if (cubeCount > 1) setDialogState(() => cubeCount--);
                        },
                      ),
                      Text('$cubeCount Cubes', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: const Icon(Icons.add_circle, color: Colors.green),
                        onPressed: () {
                          if (cubeCount < 4) setDialogState(() => cubeCount++);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    cat.customFood = {selectedFoodType: cubeCount};
                    cat.foodType = [selectedFoodType];
                    cat.customInput = cubeCount;

                    setState(() {
                      player.fedCats.add(cat);
                    });
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                )
              ],
            ),
          ),
        );
      } else if (cat.id == 'cow'){
        Map<FoodType, int> tempInputs = {
          FoodType.chicken: 0,
          FoodType.tuna: 0,
          FoodType.milk: 0,
        };

        showDialog(
          context: context, 
          builder: (context) => StatefulBuilder(
            builder: (context, setDialogState) => AlertDialog(
              title: const Text("Food Fed to Cow"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: FoodType.values.map((type){
                  String label = type.name[0].toUpperCase() + type.name.substring(1);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(label),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle, color: Colors.red),
                            onPressed: () {
                              if(tempInputs[type]! > 0) setDialogState(() => tempInputs[type] = tempInputs[type]! - 1);
                            },
                          ),
                          SizedBox(
                            width: 24,
                            child: Text('${tempInputs[type]}', textAlign: TextAlign.center, style: const TextStyle(fontSize: 18)),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_circle, color: Colors.green),
                            onPressed: () {
                              setDialogState(() => tempInputs[type] = tempInputs[type]! + 1);
                            },
                          ),
                        ],
                      )
                    ],
                  );
                }).toList(),
              ),
              actions: [
                TextButton(
                  onPressed: (){
                    cat.customFood = Map.from(tempInputs);
                    cat.foodType = tempInputs.entries.where((entry) => entry.value > 0).map((entry) => entry.key).toList();
                    cat.customInput = tempInputs.values.fold(0, (sum, count) => sum + count);

                    setState(() {
                      player.fedCats.add(cat);
                    });
                    Navigator.pop(context); 
                    Navigator.pop(context); 
                  },
                  child: const Text('Save'),
                )
              ],
            ),
          ),
        );

      } else {
    int foodCount = 0;
    showDialog(
      context: context, 
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text('Food Fed to ${cat.name}'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle, color: Colors.red),
                onPressed: () {
                  if(foodCount > 0) setDialogState(() => foodCount--);
                },
              ),
              Text('$foodCount Cubes', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              IconButton(
                icon: const Icon(Icons.add_circle, color: Colors.green),
                onPressed: () {
                  if(cat.id == 'waffle'){
                    if(foodCount < 4) setDialogState(() => foodCount++);
                  }else{
                    setDialogState(() => foodCount++);
                  }
                }
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: (){
                cat.customInput = foodCount;
                setState(() {
                    player.fedCats.add(cat);
                });
                Navigator.pop(context); 
                Navigator.pop(context); 
              },
              child: const Text('Save'),
            )
          ],
        ),
      ),
    );
    }
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

  void _editPlayerName(CatLadyPlayer player){
    _nameController.text = player.name;
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text('Edit Player Name'),
        content: TextField(
          controller: _nameController..text = player.name,
          decoration: const InputDecoration(hintText: 'Player Name'),
          textCapitalization: TextCapitalization.words,
        ),
        actions: [
          TextButton(
            onPressed: (){
              if (_nameController.text.trim().isNotEmpty){
                setState(() => player.name = _nameController.text.trim());
                _nameController.clear();
                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
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
        title: const Text('Cat Lady Score Sheet'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => _editPlayerName(currentPlayer),
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              currentPlayer.name,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                            ),
                            const SizedBox(width: 6),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Fed Cats (+${currentPlayer.calculateFedCat(players)} pts)',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          ElevatedButton.icon(
                            onPressed: () => _showAddCatDialog(currentPlayer),
                            icon: const Icon(Icons.add, size: 18),
                            label: const Text('Add Cat'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange.shade100,
                              elevation: 0,
                            ),
                          ),
                        ],
                      ),
                      if (currentPlayer.fedCats.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Wrap(
                            spacing: 6.0,
                            runSpacing: 4.0,
                            children: currentPlayer.fedCats.map((cat) {
                              return Chip(
                                label: Text(
                                  _getCatChipLabel(cat),
                                  style: const TextStyle(fontSize: 12),
                                ),
                                onDeleted: () {
                                  setState(() {
                                    currentPlayer.fedCats.remove(cat);
                                  });
                                },
                              );
                            }).toList(),
                          ),
                        ),
                    ],
                  ),
                ),

                // Toys Row
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Toys (+${currentPlayer.toyScore} pts)', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                      ElevatedButton.icon(
                        onPressed: () => _toysDialog(currentPlayer),
                        icon: const Icon(Icons.edit, size: 18),
                        label: const Text('Edit Toys'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange.shade100,
                          elevation: 0,
                        ),
                      )
                    ],
                  ),
                ),

                

                // Standard Rows
                _buildScoreRow('Catnip Cards (${currentPlayer.totalCatnipScore >= 0 ? '+' : ''}${currentPlayer.totalCatnipScore} pts)', 
                  currentPlayer.catnipScore, (change) {
                  if (currentPlayer.catnipScore + change >= 0) {
                    setState(() => currentPlayer.catnipScore += change);
                  }
                }),
                _buildScoreRow('Costumes (${currentPlayer.calculateCostumeScore(players) >= 0 ? '+' : ''}${currentPlayer.calculateCostumeScore(players)} pts)', currentPlayer.costumeScore, (change) {
                  if (currentPlayer.costumeScore + change >= 0) {
                    setState(() => currentPlayer.costumeScore += change);
                  }
                }),
                const Divider(),
                _buildScoreRow('Penalties (-)', currentPlayer.penaltyScore, (change) {
                  if (currentPlayer.penaltyScore + change >= 0) {
                    setState(() => currentPlayer.penaltyScore += change);
                  }
                }),
                
                const SizedBox(height: 30),
                const Text('Total Score', style: TextStyle(fontSize: 24, color: Colors.grey)),
                Text(
                  '${currentPlayer.calculateTotalScore(players)}',
                  style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
                const SizedBox(height: 20),
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