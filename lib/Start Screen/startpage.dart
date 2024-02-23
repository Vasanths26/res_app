import 'package:coffe_app/Home%20Screens/homepage.dart';
import 'package:flutter/material.dart';

class OpenScreen extends StatelessWidget {
  const OpenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/e.jpg'),
          //fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [
              0.2,
              1,
            ],
            colors: [
              Colors.black,
              Colors.transparent,
              //Colors.black.withOpacity(.8),
              // Colors.black.withOpacity(.2),
              // Colors.black.withOpacity(.20),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Get Started',
                  style: TextStyle(color: Colors.orange),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Find the best coffee for you',
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(),
                    ),
                    child: Text(
                      'Skip Now',
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minimumSize: const Size(100, 50),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    },
                    child: const Text('Next'),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
