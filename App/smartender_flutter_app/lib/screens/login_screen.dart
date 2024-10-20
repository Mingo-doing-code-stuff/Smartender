import 'package:flutter/material.dart';
import 'package:smartender_flutter_app/components/my_textfield.dart';
import 'package:smartender_flutter_app/components/signIn_button.dart';
import 'package:smartender_flutter_app/components/square_tile.dart';
import 'package:smartender_flutter_app/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  void signUserIn(BuildContext context) async {
    final email = usernameController.text.trim();
    final password = passwordController.text;

    bool success = await _authService.signIn(email, password);
    print("SENDE LOGIN DATEN");
    print(success);

    if (success) {
      // Navigation zur nächsten Seite
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Fehlerbehandlung
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login fehlgeschlagen. Bitte überprüfe deine Eingaben.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 150,
          ),
          const Icon(
            Icons.lock,
            size: 100,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            'Welcome back you\'ve been missing',
            style: TextStyle(color: Colors.grey[700], fontSize: 16),
          ),
          const SizedBox(
            height: 25,
          ),
          MyTextField(
            controller: usernameController,
            hintText: 'Username',
            obscureText: false,
          ),
          const SizedBox(height: 10),
          MyTextField(
            controller: passwordController,
            hintText: 'Password',
            obscureText: true,
          ),
          const SizedBox(
            height: 10,
          ),
          Text('Forgot Password?'),
          const SizedBox(
            height: 25,
          ),
          SignInButton(
            onTap: () => signUserIn(context),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Or continue with',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),

          //Google + Apple sign in
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SquareTile(imagePath: 'lib/images/google.png'),

              const SizedBox(width: 25,),

              SquareTile(imagePath: 'lib/images/apple.png'),
            ],
          ),
          const SizedBox(height: 50,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Not a member?', style: TextStyle(color: Colors.grey[700]),),
              const SizedBox(width: 4),
              Text(
                  'Register now',
                  style: TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold,
              ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
