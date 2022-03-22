import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:httpjson/model/pokemon_model.dart';

class PokeApi {
  static const String _url =
      "https://raw.githubusercontent.com/Biuni/PokemonGo-Pokedex/master/pokedex.json";

  static Future<List<Pokemonmodel>> gePokemonData() async {
    List<Pokemonmodel> _list = [];
    var result = await Dio().get(_url);
    var pokelist = jsonDecode(result.data)["pokemon"];

    if (pokelist is List) {
      _list = pokelist.map((e) => Pokemonmodel.fromJson(e)).toList();
    } else {
      return [];
    }
    return _list;
  }
}
