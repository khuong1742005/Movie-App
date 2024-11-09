import 'package:flutter/material.dart';
import 'package:movie_app/screens/home_page/navigation_bar_screen.dart';
import 'package:movie_app/widgets/main_button.dart';
import 'package:movie_app/widgets/main_text_field.dart';
import 'package:movie_app/widgets/quick_login.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscureText = true;
  bool _isRememberMe = false;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Image.asset(
                'assets/home_pic2.png',
                width: 270,
                height: 270,
              ),
              const Text(
                "Login to your account",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              buildTextField(
                hintText: 'Email',
                iconLead: Icons.email,
              ),
              const SizedBox(height: 7),
              buildTextField(
                hintText: 'Password',
                isPass: _obscureText,
                iconLead: Icons.lock,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                      value: _isRememberMe,
                      onChanged: (bool? value) {
                        setState(() {
                          _isRememberMe = value ?? false;
                        });
                      }),
                  Text(
                    'Remember me',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              buildMainButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavigationBarScreen(),
                      ));
                },
                width: 350,
                height: 45,
                radius: 40,
                backgroudColor: Theme.of(context).colorScheme.primary,
                text: 'Sign in',
                textColor: Colors.white,
                fontSize: 16,
                borderColor: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Forgot your password?',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    height: 1,
                    width: 110,
                    color: Colors.grey,
                    margin: const EdgeInsets.only(left: 20.0, right: 10),
                  ),
                  const Text('or continue with'),
                  Container(
                    height: 1,
                    width: 110,
                    color: Colors.grey,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildLogin(
                    context,
                    onTap: () {},
                    img: 'assets/facebook.png',
                    width: 80,
                    height: 58,
                    isHaveText: false,
                  ),
                  buildLogin(
                    context,
                    onTap: () {},
                    img: 'assets/google.png',
                    width: 80,
                    height: 58,
                    isHaveText: false,
                  ),
                  buildLogin(
                    context,
                    onTap: () {},
                    img: 'assets/github.png',
                    width: 80,
                    height: 58,
                    isHaveText: false,
                  ),
                ],
              ),
              const SizedBox(height: 15),
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
          )
        ],
      ),
    );
  }
}
