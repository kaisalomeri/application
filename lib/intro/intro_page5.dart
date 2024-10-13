import 'package:flutter/material.dart';

class IntroPage5 extends StatefulWidget {
  final VoidCallback toggleTheme; // Callback to toggle theme

  const IntroPage5({super.key, required this.toggleTheme});

  @override
  State<IntroPage5> createState() => _IntroPage5State();
}

class _IntroPage5State extends State<IntroPage5> {
  @override
  Widget build(BuildContext context) {
    // Check the current theme mode
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Center(
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () =>
                            Navigator.popAndPushNamed(context, '/intro4'),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.arrow_back,
                            color: Theme.of(context).primaryColor,
                            size: 40,
                          ),
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      IconButton(
                        icon: Icon(
                          isDarkMode
                              ? Icons.light_mode // Light mode icon
                              : Icons.dark_mode, // Dark mode icon
                          color: isDarkMode
                              ? Colors.white // Light mode icon color
                              : Colors.black, // Dark mode icon color
                        ),
                        onPressed: widget.toggleTheme,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/all.png"))),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "شامل",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'تطبيق شامل لتأجير الأراضي والأجنحة والمنازل بسهولة وأمان، يقدم خيارات متعددة تناسب جميع الاحتياجات.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < 5; i++) // Creates 5 dots
                                Container(
                                  margin: EdgeInsets.all(
                                      8.0), // Spacing between dots
                                  width: 24.0, // Width of each dot
                                  height: 24.0, // Height of each dot
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: i == 4
                                        ? Colors.transparent
                                        : Theme.of(context).primaryColor,
                                    border: i == 4
                                        ? Border.all(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 2.0)
                                        : null, // Smooth border for the fourth dot
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/login');
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50),
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'بدء', // Arabic text for "Start"
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Icon(Icons.arrow_forward_rounded,
                                  color: Colors.white),
                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
