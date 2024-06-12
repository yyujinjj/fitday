import 'package:fitday/gender.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
import 'mainscreen.dart';
import 'height.dart';

void main() {
  runApp(const GoalSelectionApp());
}

class GoalSelectionApp extends StatelessWidget {
  const GoalSelectionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Goal Selection',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: const GoalSelectionScreen(),
    );
  }
}

class GoalSelectionScreen extends StatefulWidget {
  const GoalSelectionScreen({Key? key}) : super(key: key);

  @override
  _GoalSelectionScreenState createState() => _GoalSelectionScreenState();
}

class _GoalSelectionScreenState extends State<GoalSelectionScreen> {
  String? _selectedGoal;

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
                MaterialPageRoute(builder: (context) => const GenderSelectionScreen()),
              );
            },
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Center(
            child: Text('Step 2 of 7'),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 80.0),
              const Text(
                'Choose main goal',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24.0),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedGoal = 'Lose weight';
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _selectedGoal == 'Lose weight' ? Colors.black : Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/weight_scale.png',
                        height: 50.0,
                        width: 50.0,
                      ),
                      const SizedBox(width: 16.0),
                      const Text('Lose weight'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedGoal = 'Keep fit';
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _selectedGoal == 'Keep fit' ? Colors.black : Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/puzzle.png',
                        height: 50.0,
                        width: 50.0,
                      ),
                      const SizedBox(width: 16.0),
                      const Text('Keep fit'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedGoal = 'Get stronger';
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _selectedGoal == 'Get stronger' ? Colors.black : Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/muscle.png',
                        height: 50.0,
                        width: 50.0,
                      ),
                      const SizedBox(width: 16.0),
                      const Text('Get stronger'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedGoal = 'Gain muscle mass';
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _selectedGoal == 'Gain muscle mass' ? Colors.black : Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/dumbbell.png',
                        height: 50.0,
                        width: 50.0,
                      ),
                      const SizedBox(width: 16.0),
                      const Text('Gain muscle mass'),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: _selectedGoal != null ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HeightSelectionScreen()),
                  );
                } : null,
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 30.0,)
            ],
          ),
        ),
      ),
    );
  }
}
