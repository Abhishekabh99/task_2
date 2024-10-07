import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NISSI',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _fadeAnimation =
        Tween<double>(begin: 0.5, end: 1.0).animate(_animationController);
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 1.1).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NISSI',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Color.fromARGB(255, 152, 0, 198)),
        ),
        backgroundColor: const Color.fromARGB(255, 54, 174, 244),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "lib/image/back_image.jpeg"), // Add your image here
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Button and UI
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Press the button below to know about us",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff001f3f), // Text color with contrast
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent, // Vibrant button color
                    side: const BorderSide(
                      color: Colors.white, // White border
                      width: 2.0, // Border width
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15), // Larger button size
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded edges
                    ),
                    elevation: 8, // Adds shadow to make button pop
                    shadowColor: Colors.black,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('About NISSI'),
                          content: const SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text(
                                    'NISSI is managed by professionals specialized in Electrical, Electronics, and Instrumentation Engineering.'),
                                SizedBox(height: 10),
                                Text(
                                    'Since 2005, NISSI offers high-quality solutions with a high degree of reliability and aesthetic looks.'),
                                SizedBox(height: 10),
                                Text(
                                    'We provide services and solutions for power transmission, distribution, and integrated automation to improve productivity, enhance comfort, and ensure safety and security.'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Close'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text(
                    'Show About NISSI',
                    style: TextStyle(
                      color: Colors.white, // Text color contrast
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
