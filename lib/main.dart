import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //first section
              Container(height: 120, width: 500, color: Colors.blue[100]),

              const SizedBox(height: 10),
              //second section
              Row(
                children: [
                  Container(height: 30, width: 60, color: Colors.grey[300]),
                  const SizedBox(width: 8),
                  Container(height: 30, width: 410, color: Colors.grey[300]),
                ],
              ),

              const SizedBox(height: 20),

              //Third section
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // fourth section
                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 250,
                        color: Colors.green[300],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 60,
                        width: 250,
                        color: Colors.green[300],
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),

                  Row(
                    children: [
                      Container(
                        height: 128,
                        width: 105,
                        color: Colors.orange[300],
                      ),
                      const SizedBox(width: 8),
                      Container(
                        height: 128,
                        width: 105,
                        color: Colors.orange[300],
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // fifth section
              Container(
                color: const Color.fromARGB(255, 240, 167, 253),
                child: Row(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      color: const Color.fromARGB(255, 225, 127, 242),
                    ),
                    const SizedBox(width: 8),

                    Column(
                      children: [
                        Container(
                          height: 55,
                          width: 100,
                          color: Colors.purple[300],
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 55,
                          width: 100,
                          color: Colors.purple[300],
                        ),
                      ],
                    ),

                    const SizedBox(width: 8),

                    Container(
                      height: 120,
                      width: 120,
                      color: const Color.fromARGB(255, 225, 127, 242),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      height: 120,
                      width: 120,
                      color: Colors.purple[100],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // sixth section
              Row(
                children: [
                  Container(height: 60, width: 236, color: Colors.cyan[100]),
                  const SizedBox(width: 8),
                  Container(height: 60, width: 236, color: Colors.teal[200]),
                ],
              ),

              const SizedBox(height: 20),

              // last section
              Container(height: 40, width: 500, color: Colors.grey[300]),
            ],
          ),
        ),
      ),
    );
  }
}
