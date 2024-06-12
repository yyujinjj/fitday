import 'package:flutter/material.dart';

void main() {
  runApp(const LogIn());
}

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Screen',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 8.0),
              const Text(
                'Log In',
                style: TextStyle(fontSize: 30.0, color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 48.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  labelText: 'Phone',
                ),
              ),
              const SizedBox(height: 24.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  labelText: 'Password',
                  suffixIcon: const Icon(Icons.visibility),
                ),
              ),
              const SizedBox(height: 48.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50), backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Less rounded corners
                  ),// Green background color
                ),
                onPressed: () {},
                child: const Text(
                  'Log In',
                  style: TextStyle(color: Colors.white), // White text color
                ),
              ),
              TextButton(
                onPressed: () {},
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'You don\'t have an account? Click ',
                        style: TextStyle(color: Colors.grey), // Grey text color
                      ),
                      TextSpan(
                        text: 'Log In',
                        style: TextStyle(color: Colors.black), // Green text color for 'Sign Up'
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}