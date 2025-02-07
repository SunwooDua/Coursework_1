import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  bool _isimage = true;
  late AnimationController _controller;
  late CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: const Duration(milliseconds: 500),
    );

    _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  void _toggleImage() {
    _controller.reset();
    _controller.forward();
    setState(() {
      _isimage = !_isimage;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FadeTransition(
                opacity: _curvedAnimation,
                child: Image.asset(
                  _isimage ? 'images/image1.png' : 'images/image2.png',
                  width: 200,
                  height: 400,
                ),
              ),
              ElevatedButton(
                onPressed: _toggleImage,
                child: Text("Toggle Image"),
              ),
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ElevatedButton(
                onPressed: _incrementCounter,
                child: Text("Increment Counter"),
              ),
            ],
          ),
        )); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
