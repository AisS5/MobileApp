import 'package:flutter/material.dart';

enum CatColour { orange, black, white }
enum FoodType { chicken, tuna, milk }

class CatCard {
  final String id;
  final String name;  
  final int basePoint;
  final List<CatColour> colour;
  List<FoodType> food;
  final String? specialAbility;
  final bool requiresInput;
  int customInput;
  FoodType? truffleFoodType;
  Map<FoodType, int> customFoodInputs;

  CatCard({
    required this.id,
    required this.name,
    this.basePoint = 0,
    this.colour = const [],
    this.food = const [],
    this.specialAbility,
    this.requiresInput = false,
    this.customInput = 0,
    this.truffleFoodType,
    Map<FoodType, int>? customFoodInputs,
  }) : customFoodInputs = customFoodInputs ?? {};

  CatCard copy() {
    return CatCard(
      id: id,
      name: name,
      basePoint: basePoint,
      colour: List<CatColour>.from(colour),
      food: List<FoodType>.from(food),
      specialAbility: specialAbility,
      requiresInput: requiresInput,
      customInput: customInput,
      truffleFoodType: truffleFoodType,
      customFoodInputs: Map<FoodType, int>.from(customFoodInputs),
    );
  }

  int get totalFoodCubes => customFoodInputs.values.fold(0, (sum, count) => sum + count);
}

final List<CatCard> catCards = [
  CatCard(id: 'sweetheart', name: 'Sweetheart', basePoint: 5, colour: [CatColour.white, CatColour.black], food: [FoodType.milk, FoodType.milk, FoodType.tuna]),
  CatCard(id: 'moonbeam', name: 'Moonbeam', basePoint: 3, colour: [CatColour.white], food: [FoodType.chicken, FoodType.milk]),
  CatCard(id: 'gershon', name: 'Gershon', basePoint: 1, colour: [CatColour.white], food: [FoodType.chicken]),
  CatCard(id: 'sox', name: 'Sox', basePoint: 6, colour: [CatColour.white], food: [FoodType.tuna, FoodType.tuna, FoodType.milk]),
  CatCard(id: 'sircuddleface', name: 'Sir Cuddleface', basePoint: 4, colour: [CatColour.white], food: [FoodType.chicken, FoodType.tuna]),
  CatCard(id: 'sparkle', name: 'Sparkle', basePoint: 3, colour: [CatColour.white], food: [FoodType.milk]),
  CatCard(id: 'chairmanmeow', name: 'Chairman Meow', basePoint: 6, colour: [CatColour.orange], food: [FoodType.chicken, FoodType.chicken, FoodType.milk]),
  CatCard(id: 'snowflake', name: 'Snowflake', basePoint: 2, colour: [CatColour.white], food: [FoodType.tuna]),
  CatCard(id: 'pumpkin', name: 'Pumpkin', basePoint: 6, colour: [CatColour.orange], food: [FoodType.chicken, FoodType.tuna, FoodType.milk]),
  CatCard(id: 'lily', name: 'Lily', basePoint: 2, colour: [CatColour.black], food: [FoodType.milk]),
  CatCard(id: 'chester', name: 'Chester', basePoint: 1, colour: [CatColour.orange], food: [FoodType.chicken]),
  CatCard(id: 'cooper', name: 'Cooper', basePoint: 1, colour: [CatColour.white], food: [FoodType.tuna]),
  CatCard(id: 'henriette', name: 'Henriette Van Weelde', basePoint: 5, colour: [CatColour.white, CatColour.black, CatColour.orange], food: [FoodType.chicken, FoodType.chicken, FoodType.tuna]),
  CatCard(id: 'blackberry', name: 'Blackberry', basePoint: 3, colour: [CatColour.black], food: [FoodType.tuna, FoodType.tuna]),
  CatCard(id: 'zeus', name: 'Zeus', basePoint: 3, colour: [CatColour.orange], food: [FoodType.chicken, FoodType.milk]),
  CatCard(id: 'bronte', name: 'Bronte', basePoint: 3, colour: [CatColour.orange], food: [FoodType.tuna, FoodType.milk]),
  CatCard(id: 'keaton', name: 'Keaton', basePoint: 4, colour: [CatColour.black], food: [FoodType.chicken, FoodType.tuna]),
  CatCard(id: 'bell', name: 'Bell', basePoint: 1, colour: [CatColour.orange], food: [FoodType.milk]),
  CatCard(id: 'pablopicatso', name: 'Pablo Picatso', basePoint: 6, colour: [CatColour.black], food: [FoodType.chicken, FoodType.tuna, FoodType.tuna]),
  CatCard(id: 'jagg', name: 'Jagg', basePoint: 1, colour: [CatColour.black], food: [FoodType.chicken]),

  CatCard(id: 'luna', name: 'Luna', colour: [CatColour.white, CatColour.black], food: [FoodType.tuna, FoodType.milk]),
  CatCard(id: 'dinah', name: 'Dinah', colour: [CatColour.orange, CatColour.white], food: [FoodType.chicken, FoodType.milk]),
  CatCard(id: 'alvin', name: 'Alvin', colour: [CatColour.orange, CatColour.black], food: [FoodType.chicken, FoodType.tuna]),
  CatCard(id: 'macak', name: 'Macak', basePoint: 2, colour: [CatColour.orange], food: [FoodType.milk, FoodType.milk]),
  CatCard(id: 'levarpurrton', name: 'Levar Purrton', colour: [CatColour.white], food: [FoodType.chicken, FoodType.tuna, FoodType.milk]),
  CatCard(id: 'penny', name: 'Penny', colour: [CatColour.orange], food: [FoodType.tuna]),
  CatCard(id: 'zoroaster', name: 'Zoroaster', colour: [CatColour.black], food: [FoodType.chicken, FoodType.chicken]),
  CatCard(id: 'eliot', name: 'Eliot', colour: [CatColour.black], food: [FoodType.chicken, FoodType.milk]),
  CatCard(id: 'antoinette', name: 'Antoinette', colour: [CatColour.white], food: [FoodType.tuna, FoodType.milk]),
  CatCard(id: 'florence', name: 'Florence', colour: [CatColour.orange], food: [FoodType.chicken, FoodType.tuna]),
  CatCard(id: 'hemingway', name: 'Hemingway', colour: [CatColour.black], food: [FoodType.tuna, FoodType.tuna, FoodType.milk]),

  CatCard(id: 'cow', name: 'Cow', colour: [CatColour.white], requiresInput: true),
  CatCard(id: 'waffle', name: 'Waffle', colour: [CatColour.orange], requiresInput: true),
  CatCard(id: 'truffle', name: 'Truffle', colour: [CatColour.black], requiresInput: true),
];

class CatLadyPlayer {
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

  bool get hasMacak => fedCats.any((cat) => cat.id == 'macak');
  int get effectiveCatnipCount => catnipScore + (hasMacak ? 1 : 0);

  int get totalCatnipScore {
    int totalCatnip = effectiveCatnipCount;
    int fedcatsCount = fedCats.length;

    if (totalCatnip == 0) {
      return 0;
    } else if (totalCatnip == 1) {
      return -2;
    } else if (totalCatnip >= 2 && totalCatnip <= 3) {
      return fedcatsCount * 1;
    } else {
      return fedcatsCount * 2;
    }
  }

  int get totalToyCount => toyCount.values.fold(0, (sum, count) => sum + count);

  int calculateFedCat(List<CatLadyPlayer> allPlayers) {
    int score = 0; 
    int orangeCats = 0;
    int blackCats = 0;
    int whiteCats = 0;

    for (var cat in fedCats) {
      if (cat.colour.contains(CatColour.orange)) orangeCats++;
      if (cat.colour.contains(CatColour.black)) blackCats++;
      if (cat.colour.contains(CatColour.white)) whiteCats++;
    }

    for (var cat in fedCats) {
      score += cat.basePoint;

      switch (cat.id) {
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
        case 'cow':
          score += cat.totalFoodCubes * 2;
          break;
        case 'truffle':
          if (cat.truffleFoodType != null) {
            int matchingCats = fedCats.where((otherCat) {
              if (otherCat == cat) return false;
              return otherCat.food.contains(cat.truffleFoodType);
            }).length;
            score += matchingCats * 2;
          }
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
        case 'hemingway': 
          int maxCatFed = allPlayers.map((p) => p.fedCats.length).fold(0, (a, b) => a > b ? a : b);
          bool isMost = fedCats.length == maxCatFed && fedCats.isNotEmpty;
          score += isMost ? 7 : 3;
          break;
        default:
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

    while (count.any((c) => c > 0)) {
      int uniqueToys = 0;
      for (int i = 0; i < count.length; i++) {
        if (count[i] > 0) {
          uniqueToys++;
          count[i]--;
        }
      }
      totalToyScore += points[uniqueToys] ?? 0;
    }
    return totalToyScore;
  }

  int calculateCostumePoints(List<CatLadyPlayer> allPlayers) {
    if (costumeScore == 0) return -2;
    int maxCostumes = allPlayers.map((p) => p.costumeScore).fold(0, (a, b) => a > b ? a : b);
    bool hasMost = costumeScore == maxCostumes && costumeScore > 0;
    return hasMost ? 6 : 0;
  }

  int calculateTotalScore(List<CatLadyPlayer> allPlayers) {
    return calculateFedCat(allPlayers) +
           toyScore +
           totalCatnipScore +
           calculateCostumePoints(allPlayers) -
           penaltyScore;
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

  void _addPlayer() {
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
            onPressed: () {
              if (_nameController.text.trim().isNotEmpty) {
                setState(() {
                  players.add(CatLadyPlayer(name: _nameController.text.trim()));
                  _nameController.clear();
                });
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 100), () {
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

  void _editPlayerName(CatLadyPlayer player) {
    _nameController.text = player.name;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Player Name'),
        content: TextField(
          controller: _nameController,
          decoration: const InputDecoration(hintText: 'Enter new name'),
          textCapitalization: TextCapitalization.words,
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (_nameController.text.trim().isNotEmpty) {
                setState(() {
                  player.name = _nameController.text.trim();
                });
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

  void _showAddCatDialog(CatLadyPlayer player) {
    String searchQuery = '';
    showDialog(
      context: context, 
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            final filteredCats = catCards.where((cat) {
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
                      onChanged: (value) {
                        setDialogState(() => searchQuery = value);
                      },
                    ),
                    const SizedBox(height: 10),
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: filteredCats.length,
                        itemBuilder: (context, index) {
                          final cat = filteredCats[index];
                          return ListTile(
                            title: Text(cat.name),  
                            trailing: const Icon(Icons.add_circle_outline, color: Colors.green), 
                            onTap: () {
                              final newCat = cat.copy();
                              if (newCat.requiresInput) {
                                _promptInput(newCat, player);
                              } else {
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

  void _promptInput(CatCard cat, CatLadyPlayer player) {
    if (cat.id == 'truffle') {
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: const Text("Select Food Type"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: FoodType.values.map((type) {
              String label = type.name[0].toUpperCase() + type.name.substring(1);
              return ListTile(
                title: Text(label),
                onTap: () {
                  cat.truffleFoodType = type;
                  cat.food = [type];
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
    } 
    else if (cat.id == 'waffle') {
      FoodType selectedType = FoodType.values.first;
      int cubeCount = 1;

      showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
          builder: (context, setDialogState) => AlertDialog(
            title: const Text('Food Fed to Waffle (Max 4)'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButton<FoodType>(
                  value: selectedType,
                  isExpanded: true,
                  items: FoodType.values.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type.name[0].toUpperCase() + type.name.substring(1)),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) setDialogState(() => selectedType = val);
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle, color: Colors.red),
                      onPressed: () {
                        if (cubeCount > 1) setDialogState(() => cubeCount--);
                      },
                    ),
                    Text('$cubeCount Cubes', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                  cat.customFoodInputs = {selectedType: cubeCount};
                  cat.food = [selectedType];
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
    } 
    else {
      Map<FoodType, int> tempInputs = {
        for (var type in FoodType.values) type: 0
      };

      showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
          builder: (context, setDialogState) => AlertDialog(
            title: const Text('Food Fed to Cow'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: FoodType.values.map((type) {
                String label = type.name[0].toUpperCase() + type.name.substring(1);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(label, style: const TextStyle(fontSize: 16)),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle, color: Colors.redAccent),
                            onPressed: () {
                              if (tempInputs[type]! > 0) {
                                setDialogState(() => tempInputs[type] = tempInputs[type]! - 1);
                              }
                            },
                          ),
                          SizedBox(
                            width: 24,
                            child: Text('${tempInputs[type]}', textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_circle, color: Colors.green),
                            onPressed: () {
                              setDialogState(() => tempInputs[type] = tempInputs[type]! + 1);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  cat.customFoodInputs = Map.from(tempInputs);
                  cat.food = tempInputs.entries
                      .where((e) => e.value > 0)
                      .map((e) => e.key)
                      .toList();
                  cat.customInput = cat.totalFoodCubes;
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

  void _toysDialog(CatLadyPlayer player) {
    showDialog(
      context: context, 
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Column(
                children: [
                  const Text('TOYS'),
                  Text(
                    '+${player.toyScore} points',
                    style: const TextStyle(color: Colors.deepPurple, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
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

  String _getCatChipLabel(CatCard cat) {
    if (cat.id == 'truffle') {
      return '${cat.name} (${cat.truffleFoodType?.name.toUpperCase() ?? 'NONE'})';
    } else if (cat.id == 'waffle' || cat.id == 'cow') {
      if (cat.customFoodInputs.isEmpty) return cat.name;
      final details = cat.customFoodInputs.entries
          .where((e) => e.value > 0)
          .map((e) => '${e.value} ${e.key.name[0].toUpperCase()}')
          .join(', ');
      return details.isNotEmpty ? '${cat.name} ($details)' : cat.name;
    }
    return cat.name;
  }

  Widget _buildScoreRow(String title, int currentValue, Function(int) onChanged) {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Lady Score Sheet'),
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

                _buildScoreRow(
                  'Catnip Cards (${currentPlayer.totalCatnipScore >= 0 ? '+' : ''}${currentPlayer.totalCatnipScore} pts)', 
                  currentPlayer.catnipScore, 
                  (change) {
                    if (currentPlayer.catnipScore + change >= 0) {
                      setState(() => currentPlayer.catnipScore += change);
                    }
                  },
                ),

                _buildScoreRow(
                  'Costumes (${currentPlayer.calculateCostumePoints(players) >= 0 ? '+' : ''}${currentPlayer.calculateCostumePoints(players)} pts)', 
                  currentPlayer.costumeScore, 
                  (change) {
                    if (currentPlayer.costumeScore + change >= 0) {
                      setState(() => currentPlayer.costumeScore += change);
                    }
                  },
                ),

                const Divider(),

                _buildScoreRow(
                  'Penalties (-)', 
                  currentPlayer.penaltyScore, 
                  (change) {
                    if (currentPlayer.penaltyScore + change >= 0) {
                      setState(() => currentPlayer.penaltyScore += change);
                    }
                  },
                ),
                
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
    );
  }
}