import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';

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

/*INICIO COISAS DA LISTA */

abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// TITULO DO CARD
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Container(
      color: Colors.blue[600],
      padding: EdgeInsets.only(top: 20, bottom: 40),
      margin: EdgeInsets.only(bottom: 40),
      child: Center(
        child: Text(
          heading,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

/// CONTEUDO DO CARD
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}
/* FIM COISAS DA LISTA */

class MainPage extends StatelessWidget {
  final items = List<ListItem>.generate(
    10,
    (i) => i == 0
        ? HeadingItem('Flutter Gov')
        : MessageItem('Relatório $i', 'Descrição $i, dd/mm/yyy'),
  );

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 30),
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                ListItem item = items[index];
                int img = index + 10;
                return index != 0
                    ? Card(
                        child: ListTile(
                          leading: index != 0
                              ? Image(
                                  image: NetworkImage(
                                      'https://picsum.photos/250?image=$img'),
                                )
                              : null,
                          title: item.buildTitle(context),
                          subtitle: item.buildSubtitle(context),
                        ),
                      )
                    : ListTile(
                        leading: index != 0
                            ? Image(
                                image: NetworkImage(
                                    'https://picsum.photos/250?image=$img'),
                              )
                            : null,
                        title: item.buildTitle(context),
                        subtitle: item.buildSubtitle(context),
                      );
              },
            ),
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

class RelForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 150,
            child: Stack(
              children: <Widget>[
                const Center(child: CircularProgressIndicator()),
                Center(
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: 'https://picsum.photos/250?image=9',
                  ),
                ),
              ],
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Nome',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo obrigatório';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'CPF',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo obrigatório';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'CEP',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo obrigatório';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Endereço',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo obrigatório';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Bairro',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo obrigatório';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
