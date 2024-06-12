import 'package:fitday/start.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'exercise_provider.dart';
import 'fitness.dart';
import 'calendar.dart';
import 'timer.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ExerciseProvider()),
      ],
      child: const FitDayApp(),
    ),
  );
}

class FitDayApp extends StatelessWidget {
  const FitDayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitDay',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StartScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            const Text(
              'FITDAY',
              style: TextStyle(
                fontSize: 38.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            _buildMenuButton(
              context,
              'assets/images/fitness.png',
              'Fitness',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FitnessScreen()),
                );
              },
            ),
            const SizedBox(height: 16.0),
            _buildMenuButton(
              context,
              'assets/images/timer.png',
              'Timer',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryScreen()),
                );
              },
            ),
            const SizedBox(height: 16.0),
            _buildMenuButton(
              context,
              'assets/images/calendar.png',
              'Calendar',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalendarScreen()),
                );
              },
            ),
            const Spacer(flex: 2),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0, bottom: 32.0),
                child: Image.asset(
                  'assets/images/avatar.png',
                  height: 150.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String imagePath, String text, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black, backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        minimumSize: const Size(250, 70),
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: 40.0,
          ),
          const SizedBox(width: 16.0),
          Text(
            text,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
