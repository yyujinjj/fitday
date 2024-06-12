import 'package:flutter/material.dart';
import 'exercise.dart';
import 'exercise_detail_screen.dart';

class FitnessScreen extends StatefulWidget {
  @override
  _FitnessScreenState createState() => _FitnessScreenState();
}

class _FitnessScreenState extends State<FitnessScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Exercise> _recommendations = [];
  String _appBarTitle = 'Arms';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _getRecommendations('Arms');
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        String category = _getCategoryName(_tabController.index);
        setState(() {
          _appBarTitle = category;
        });
        _getRecommendations(category);
      }
    });
  }

  String _getCategoryName(int index) {
    switch (index) {
      case 0:
        return 'Arms';
      case 1:
        return 'Legs';
      case 2:
        return 'Shoulders';
      case 3:
        return 'Back';
      case 4:
        return 'Chest';
      case 5:
        return 'Lower Body';
      default:
        return 'Arms';
    }
  }

  void _getRecommendations(String category) {
    final recommendations = _generateExerciseRecommendations(category);
    setState(() {
      _recommendations = recommendations.exercises;
    });
  }

  ExerciseRecommendation _generateExerciseRecommendations(String category) {
    final exercises = [
      Exercise(
        name: 'Bicep Curl',
        category: 'Arms',
        description: 'Bicep curls are great for building arm strength.',
        imagePath: 'assets/images/arms1.png',
        videoPath: 'assets/videos/arms1.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Tricep Extension',
        category: 'Arms',
        description: 'Tricep extensions help to build arm and shoulder strength.',
        imagePath: 'assets/images/arms2.png',
        videoPath: 'assets/videos/arms2.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Hammer Curl',
        category: 'Arms',
        description: 'Hammer curls work the brachialis and brachioradialis.',
        imagePath: 'assets/images/arms3.png',
        videoPath: 'assets/videos/arms3.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Preacher Curl',
        category: 'Arms',
        description: 'Preacher curls isolate the biceps for a concentrated workout.',
        imagePath: 'assets/images/arms4.png',
        videoPath: 'assets/videos/arms4.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Concentration Curl',
        category: 'Arms',
        description: 'Concentration curls provide a deep burn to the biceps.',
        imagePath: 'assets/images/arms5.png',
        videoPath: 'assets/videos/arms5.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Squats',
        category: 'Legs',
        description: 'Squats help to build lower body strength and improve flexibility.',
        imagePath: 'assets/images/legs1.png',
        videoPath: 'assets/videos/legs1.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Lunges',
        category: 'Legs',
        description: 'Lunges are great for building leg strength and balance.',
        imagePath: 'assets/images/legs2.png',
        videoPath: 'assets/videos/legs2.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Leg Press',
        category: 'Legs',
        description: 'Leg presses help to build lower body strength and muscle.',
        imagePath: 'assets/images/legs3.png',
        videoPath: 'assets/videos/legs3.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Leg Curl',
        category: 'Legs',
        description: 'Leg curls work the hamstrings and improve flexibility.',
        imagePath: 'assets/images/legs4.png',
        videoPath: 'assets/videos/legs4.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Calf Raise',
        category: 'Legs',
        description: 'Calf raises help to build calf muscles and lower leg strength.',
        imagePath: 'assets/images/legs5.png',
        videoPath: 'assets/videos/legs5.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Shoulder Press',
        category: 'Shoulders',
        description: 'Shoulder presses are great for building shoulder and arm strength.',
        imagePath: 'assets/images/shoulders1.png',
        videoPath: 'assets/videos/shoulders1.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Lateral Raise',
        category: 'Shoulders',
        description: 'Lateral raises help to build shoulder strength and width.',
        imagePath: 'assets/images/shoulders2.png',
        videoPath: 'assets/videos/shoulders2.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Front Raise',
        category: 'Shoulders',
        description: 'Front raises work the front part of the shoulder.',
        imagePath: 'assets/images/shoulders3.png',
        videoPath: 'assets/videos/shoulders3.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Rear Delt Fly',
        category: 'Shoulders',
        description: 'Rear delt flies target the back of the shoulders.',
        imagePath: 'assets/images/shoulders4.png',
        videoPath: 'assets/videos/shoulders4.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Shrugs',
        category: 'Shoulders',
        description: 'Shrugs help to build the trapezius muscles.',
        imagePath: 'assets/images/shoulders5.png',
        videoPath: 'assets/videos/shoulders5.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Pull-ups',
        category: 'Back',
        description: 'Pull-ups are great for building upper body and back strength.',
        imagePath: 'assets/images/back1.png',
        videoPath: 'assets/videos/back1.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Deadlift',
        category: 'Back',
        description: 'Deadlifts are great for building overall strength, especially in the back.',
        imagePath: 'assets/images/back2.png',
        videoPath: 'assets/videos/back2.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Bent Over Row',
        category: 'Back',
        description: 'Bent over rows target the upper back and lats.',
        imagePath: 'assets/images/back3.png',
        videoPath: 'assets/videos/back3.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'T-Bar Row',
        category: 'Back',
        description: 'T-bar rows are excellent for back thickness.',
        imagePath: 'assets/images/back4.png',
        videoPath: 'assets/videos/back4.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Lat Pulldown',
        category: 'Back',
        description: 'Lat pulldowns focus on the latissimus dorsi muscles.',
        imagePath: 'assets/images/back5.png',
        videoPath: 'assets/videos/back5.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Bench Press',
        category: 'Chest',
        description: 'Bench presses are great for building chest muscles.',
        imagePath: 'assets/images/chest1.png',
        videoPath: 'assets/videos/chest1.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Chest Fly',
        category: 'Chest',
        description: 'Chest flies help to build and define the chest muscles.',
        imagePath: 'assets/images/chest2.png',
        videoPath: 'assets/videos/chest2.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Incline Bench Press',
        category: 'Chest',
        description: 'Incline bench presses target the upper chest.',
        imagePath: 'assets/images/chest3.png',
        videoPath: 'assets/videos/chest3.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Decline Bench Press',
        category: 'Chest',
        description: 'Decline bench presses target the lower chest.',
        imagePath: 'assets/images/chest4.png',
        videoPath: 'assets/videos/chest4.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Push-ups',
        category: 'Chest',
        description: 'Push-ups are a great bodyweight exercise for the chest.',
        imagePath: 'assets/images/chest5.png',
        videoPath: 'assets/videos/chest5.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Leg Press',
        category: 'Lower Body',
        description: 'Leg presses help to build lower body strength and muscle.',
        imagePath: 'assets/images/lowerbody1.png',
        videoPath: 'assets/videos/lowerbody1.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Calf Raise',
        category: 'Lower Body',
        description: 'Calf raises help to build calf muscles and lower leg strength.',
        imagePath: 'assets/images/lowerbody2.png',
        videoPath: 'assets/videos/lowerbody2.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Leg Extension',
        category: 'Lower Body',
        description: 'Leg extensions focus on the quadriceps.',
        imagePath: 'assets/images/lowerbody3.png',
        videoPath: 'assets/videos/lowerbody3.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Leg Curl',
        category: 'Lower Body',
        description: 'Leg curls work the hamstrings and improve flexibility.',
        imagePath: 'assets/images/lowerbody4.png',
        videoPath: 'assets/videos/lowerbody4.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
      Exercise(
        name: 'Glute Bridge',
        category: 'Lower Body',
        description: 'Glute bridges are excellent for targeting the glutes and hamstrings.',
        imagePath: 'assets/images/lowerbody5.png',
        videoPath: 'assets/videos/lowerbody5.mp4',
        date: DateTime.now(),
        icon: Icons.fitness_center,
      ),
    ];

    final filteredExercises = exercises.where((exercise) => exercise.category == category).toList();

    return ExerciseRecommendation(exercises: filteredExercises);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(_appBarTitle),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Arms'),
            Tab(text: 'Legs'),
            Tab(text: 'Shoulders'),
            Tab(text: 'Back'),
            Tab(text: 'Chest'),
            Tab(text: 'Lower Body'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(6, (index) {
          return _buildExerciseGrid();
        }),
      ),
    );
  }

  Widget _buildExerciseGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.75,
      ),
      itemCount: _recommendations.length,
      itemBuilder: (context, index) {
        final exercise = _recommendations[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExerciseDetailScreen(exercise: exercise),
              ),
            );
          },
          child: Card(
            color: Colors.black,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.asset(
                    exercise.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    exercise.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ExerciseRecommendation {
  final List<Exercise> exercises;

  ExerciseRecommendation({required this.exercises});
}
