import 'package:flutter/material.dart';
import 'package:movie_app/screens/login_page/sign_in_screen.dart';
import 'package:movie_app/widgets/main_button.dart';
import 'package:movie_app/widgets/quick_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Image.asset(
              'assets/home_pic1.png',
              width: 270,
              height: 270,
            ),
          ),
          const Text(
            "Let's you in",
            style: TextStyle(
              fontSize: 40,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          buildLogin(
            context,
            onTap: () {},
            img: 'assets/facebook.png',
            text: 'Login With Facebook',
            width: 370,
            height: 58,
          ),
          buildLogin(
            context,
            onTap: () {},
            img: 'assets/google.png',
            text: 'Login With Google',
            width: 370,
            height: 58,
          ),
          buildLogin(
            context,
            onTap: () {},
            img: 'assets/github.png',
            text: 'Login With GitHub',
            width: 370,
            height: 58,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                height: 1,
                width: 150,
                color: Colors.grey,
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
              ),
              const Text('or'),
              Container(
                height: 1,
                width: 150,
                color: Colors.grey,
                margin: const EdgeInsets.symmetric(horizontal: 19.0),
              ),
            ],
          ),
          const SizedBox(height: 40),
          buildMainButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ));
            },
            width: 350,
            height: 45,
            radius: 40,
            backgroudColor: Theme.of(context).colorScheme.primary,
            text: 'Sign in with password',
            textColor: Colors.white,
            fontSize: 16,
            borderColor: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 45),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?",
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(width: 15),
              GestureDetector(
                onTap: () {},
                child: Text('Sign up',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
