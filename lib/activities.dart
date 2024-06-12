import 'package:flutter/material.dart';
import 'mainscreen.dart';
import 'training_level.dart';
import 'create_plan.dart';

void main() {
  runApp(const ActivitySelectionApp());
}

class ActivitySelectionApp extends StatelessWidget {
  const ActivitySelectionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Activity Selection',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: const ActivitySelectionScreen(),
    );
  }
}

class ActivitySelectionScreen extends StatefulWidget {
  const ActivitySelectionScreen({super.key});

  @override
  _ActivitySelectionScreenState createState() => _ActivitySelectionScreenState();
}

class _ActivitySelectionScreenState extends State<ActivitySelectionScreen> {
  final List<String> _selectedActivities = [];

  void _onActivitySelected(String activity) {
    setState(() {
      if (_selectedActivities.contains(activity)) {
        _selectedActivities.remove(activity);
      } else {
        _selectedActivities.add(activity);
      }
    });
  }

  Widget _buildActivityOption(String activity, String imagePath) {
    final isSelected = _selectedActivities.contains(activity);
    return GestureDetector(
      onTap: () => _onActivitySelected(activity),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              height: 50.0,
              width: 50.0,
            ),
            const SizedBox(width: 16.0),
            Text(activity),
            const Spacer(),
            if (isSelected)
              const Icon(Icons.check_circle, color: Colors.black)
            else
              const Icon(Icons.circle_outlined, color: Colors.grey),
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
                MaterialPageRoute(builder: (context) => const TrainingLevelSelectionScreen()),
              );
            },
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Center(
            child: Text('Step 7 of 7'),
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
                'Choose activities that interest',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Multiple selection possible',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24.0),
              _buildActivityOption('Stretch', 'assets/images/stretch.png'),
              const SizedBox(height: 16.0),
              _buildActivityOption('Cardio', 'assets/images/cardio.png'),
              const SizedBox(height: 16.0),
              _buildActivityOption('Power training', 'assets/images/power.png'),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: _selectedActivities.isNotEmpty ? Colors.black : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: _selectedActivities.isNotEmpty ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreatePlanScreen()),
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

