import 'package:flutter/material.dart';
import 'package:movie_app/screens/login_page/login_screen.dart';
import 'package:movie_app/widgets/main_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        OverflowBox(
          maxWidth: double.infinity,
          maxHeight: double.infinity,
          child: Transform.rotate(
            angle: 0.3,
            child: Container(
              width: MediaQuery.of(context).size.width * 1.5,
              height: MediaQuery.of(context).size.height * 1.5,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/onboarding_background.png'),
                fit: BoxFit.cover,
              )),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.9),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to KFilm',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                      'The best movie streaming app of the century to make your days great',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: Colors.grey),
                      textAlign: TextAlign.center),
                ),
                const SizedBox(height: 15),
                buildMainButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ));
                  },
                  width: 350,
                  height: 45,
                  radius: 40,
                  backgroudColor: Theme.of(context).colorScheme.primary,
                  text: 'Get Started',
                  textColor: Colors.white,
                  fontSize: 18,
                  borderColor: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
