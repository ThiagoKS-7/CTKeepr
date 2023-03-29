import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Over Screens',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: MainPage(),

      // Declare routes
      routes: {
        // Main initial route
        '/': (context) => MainPage(),
        // Second route
        '/second': (context) => SecondPage(),
      },
      initialRoute: '/',
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text('Navigation over screens'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              // Navigate using declared route name
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/second'),
                child: Text('Navigate using routes'),
              ),
              // Navigate using simple push method
              ElevatedButton(
                onPressed: () =>
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondPage()),
                    ),
                child: Text('Navigate using push method'),
              )
            ],
          ),
        ),
      );
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second screen'),
      ),
      body: Container(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Back'),
        ),
      ),
    );
  }
}
