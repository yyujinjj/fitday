import 'package:flutter/material.dart';
import 'goal.dart';
import 'mainscreen.dart';
import 'weight.dart';

void main() {
  runApp(const HeightSelectionApp());
}

class HeightSelectionApp extends StatelessWidget {
  const HeightSelectionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Height Selection',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: const HeightSelectionScreen(),
    );
  }
}

class HeightSelectionScreen extends StatefulWidget {
  const HeightSelectionScreen({Key? key}) : super(key: key);

  @override
  _HeightSelectionScreenState createState() => _HeightSelectionScreenState();
}

class _HeightSelectionScreenState extends State<HeightSelectionScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                MaterialPageRoute(builder: (context) => const GoalSelectionScreen()),
              );
            },
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Center(
            child: Text('Step 3 of 7'),
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
              const SizedBox(height: 80.0),
              const Text(
                'Select height',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: TextField(
                        controller: _controller,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const Text(
                    'cm',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: _controller.text.isNotEmpty ? Colors.black : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: _controller.text.isNotEmpty ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WeightSelectionScreen()),
                  );
                } : null,
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 30.0), // 간격을 맞추기 위한 공간 추가
            ],
          ),
        ),
      ),
    );
  }
}
