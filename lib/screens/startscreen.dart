import 'package:flutter/material.dart';
import '../styles/text_styles.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF231F3E),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("Good morning,", style: TextStyles.h3()),
              ),
              SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("New topic is waiting", style: TextStyles.h1()),
              ),
              SizedBox(height: 20),
              Center(
                child: Image.asset(
                  "images/home_image.png",
                  height: MediaQuery.of(context).size.width,
                ),
              ),

              Spacer(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/q1');
                      },
                      child: Text(
                        "Start Quiz",
                        style: TextStyle(
                          color: Color(0xFF45395F),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 7),
              Center(
                child: Divider(
                  thickness: 3,
                  color: Colors.white,
                  indent: 130,
                  endIndent: 130,
                  radius: BorderRadius.circular(50),
                ),
              ),
              SizedBox(height: 7),
            ],
          ),
        ),
      ),
    );
  }
}
