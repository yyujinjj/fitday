import 'package:flutter/material.dart';
import 'mainscreen.dart';
import 'goalweight.dart';
import 'activities.dart';

void main() {
  runApp(const TrainingLevelSelectionApp());
}

class TrainingLevelSelectionApp extends StatelessWidget {
  const TrainingLevelSelectionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Training Level Selection',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: const TrainingLevelSelectionScreen(),
    );
  }
}

class TrainingLevelSelectionScreen extends StatefulWidget {
  const TrainingLevelSelectionScreen({super.key});

  @override
  _TrainingLevelSelectionScreenState createState() => _TrainingLevelSelectionScreenState();
}

class _TrainingLevelSelectionScreenState extends State<TrainingLevelSelectionScreen> {
  String? _selectedLevel;

  void _onLevelSelected(String level) {
    setState(() {
      _selectedLevel = level;
    });
  }

  Widget _buildLevelOption(String level, String description) {
    return GestureDetector(
      onTap: () => _onLevelSelected(level),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: _selectedLevel == level ? Colors.black : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              level,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GoalWeightSelectionScreen()),
              );
            },
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Center(
            child: Text('Step 6 of 7'),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 16.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                );
              },
              child: const Text(
                'Skip',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 24.0),
              const Text(
                'Choose training level',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24.0),
              _buildLevelOption('Beginner', 'I want to start training'),
              const SizedBox(height: 16.0),
              _buildLevelOption('Irregular training', 'I train 1-2 times a week'),
              const SizedBox(height: 16.0),
              _buildLevelOption('Medium', 'I train 3-5 times a week'),
              const SizedBox(height: 16.0),
              _buildLevelOption('Advanced', 'I train more than 5 times a week'),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: _selectedLevel != null ? Colors.black : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: _selectedLevel != null ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ActivitySelectionScreen()),
                  );
                } : null,
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
