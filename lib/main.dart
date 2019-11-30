import 'package:flutter/material.dart';
import 'package:flutter_app_repaso/pokemon_api_provider.dart';
import 'package:flutter_app_repaso/pokemon_model.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi primera aplicación"),
      ),
      body: Stack(
        children: <Widget>[
          Counter(),
        ],
      ),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count;
  @override
  void initState() {
    // TODO: implement initState
    count = 0;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PokemonApiProvider().getPokemons(),
      builder: (BuildContext context, AsyncSnapshot<List<Pokemon>> snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView(
          children: snapshot.data.map((Pokemon pokemon){
            return ListTile(
              title: Text(pokemon.name),
              subtitle: Text(pokemon.url),
            );
          }).toList(),
        );
      },
    );
  }
}
