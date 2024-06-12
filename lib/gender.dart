import 'package:flutter/material.dart';
import 'signup.dart';
import 'mainscreen.dart';
import 'goal.dart';

void main() {
  runApp(const GenderSelectionApp());
}

class GenderSelectionApp extends StatelessWidget {
  const GenderSelectionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gender Selection',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: const GenderSelectionScreen(),
    );
  }
}

class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({Key? key}) : super(key: key);

  @override
  _GenderSelectionScreenState createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String? _selectedGender;

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
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
              );
            },
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Center(
            child: Text('Step 1 of 7'),
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
                'Choose gender',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24.0),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedGender = 'Woman';
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _selectedGender == 'Woman' ? Colors.black : Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/gender_w.png',
                        height: 50.0,
                        width: 50.0,
                      ),
                      const SizedBox(width: 16.0),
                      const Text('Woman'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedGender = 'Man';
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _selectedGender == 'Man' ? Colors.black : Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/gender_m.png',
                        height: 50.0,
                        width: 50.0,
                      ),
                      const SizedBox(width: 16.0),
                      const Text('Man'),
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
                onPressed: _selectedGender != null ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GoalSelectionScreen()),
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
