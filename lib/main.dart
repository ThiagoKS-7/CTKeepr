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
        appBar: AppBar(title: Text("CT Keepr - Home"), actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Novo Relatório',
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Novo Relatório',
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
          ),
        ]),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(height: 200, child: Text('Teste')),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  color: Colors.cyan[900],
                  height: 380,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      int img = index + 10;
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Material(
                          color: Colors.cyan[900],
                          child: InkWell(
                              onTap: () => {},
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    // Image border
                                    child: Image(
                                      image: NetworkImage(
                                        'https://picsum.photos/100/90?image=$img',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 60),
                                    child: Column(
                                      children: [
                                        Text('Relatório $index'),
                                        Text('Descrição $index, dd/mm/yyy')
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ),
                      );
                    },
                  ),
                ),
              ),
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
