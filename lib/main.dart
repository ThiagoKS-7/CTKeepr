import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:fluttergov/widgets/FormWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Over Screens',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),

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
  final ScrollController _scroll = ScrollController();
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Teste'),
              SingleChildScrollView(
                child: Container(
                  height: 300,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      int img = index + 10;
                      return InkWell(
                        onTap: () => {},
                        child: ListTile(
                          leading: Image(
                            image: NetworkImage(
                                'https://picsum.photos/250?image=$img'),
                          ),
                          title: Text('Relatório $index'),
                          subtitle: Text('Descrição $index, dd/mm/yyy'),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/second'),
          child: Icon(Icons.add),
          tooltip: "Novo Relatório",
        ),
      );
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo relatório'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[RelForm()],
            ),
          ),
        ),
      ),
    );
  }
}
