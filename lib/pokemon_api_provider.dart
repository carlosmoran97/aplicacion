import 'package:dio/dio.dart';
import 'package:flutter_app_repaso/pokemon_model.dart';

class PokemonApiProvider{
  final String baseUrl = "https://pokeapi.co/api/v2/";
  Future<List<Pokemon>> getPokemons() async {
    try{
      Dio dio = Dio();
      Response response = await dio.get("$baseUrl/pokemon/");
      List<Pokemon> pokemons = List<Pokemon>();
      (response.data['results'] as List).forEach((dynamic map){
        pokemons.add(Pokemon.fromMap(map));
      });
      return pokemons;
    }catch(e){
      print(e);
      return null;
    }
  }
}