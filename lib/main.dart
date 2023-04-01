import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:io';
import 'package:fluttergov/widgets/FormWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Over Screens',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff111649),
        brightness: Brightness.dark,
        primaryColor: Colors.blue,
      ),

      // Declare routes
      routes: {
        // Main initial route
        '/': (context) => MainPage(),
        // Second route
        '/create': (context) => SecondPage(),
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
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  bottom: 30,
                ),
                child: Row(
                  children: [
                    Container(width: 80, child: Image.asset('images/main.png')),
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          'CT Keepr - Home',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 25),
                        )),
                  ],
                ),
              ),
              Container(
                  height: 100,
                  margin: EdgeInsets.only(bottom: 30),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 25),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(40),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          child: Container(
                            width: 90,
                            height: 110,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment(0.8, 1),
                                  colors: [
                                    Colors.red,
                                    Colors.orange,
                                    Colors.yellow,
                                  ]),
                            ),
                            child: Material(
                              color: Color(0x005b0060),
                              child: InkWell(
                                onTap: () =>
                                    {Navigator.pushNamed(context, '/create')},
                                child: Container(
                                  padding: EdgeInsets.only(left: 10, top: 50),
                                  child: Text(
                                    "Novo Relatório",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              SingleChildScrollView(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                  child: Container(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    color: Color(0xffe8ebeb),
                    height: 80,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        int img = index + 10;
                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Material(
                            color: Color(0xffe8ebeb),
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
                                      margin: EdgeInsets.only(left: 30),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Relatório $index',
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25),
                                          ),
                                          Text('Descrição $index, dd/mm/yyy',
                                              style: const TextStyle(
                                                color: Colors.black,
                                              ))
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
