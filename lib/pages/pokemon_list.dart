import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:httpjson/pages/pokelist_item.dart';
import '../model/pokemon_model.dart';
import '../model/services/pokedex_api.dart';

class PokemonList extends StatefulWidget {
  PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<Pokemonmodel>> _pokemonList;
  @override
  void initState() {
    _pokemonList = PokeApi.gePokemonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemonmodel>>(
        future: _pokemonList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Pokemonmodel> _listem = snapshot.data!;
            return GridView.builder(
                itemCount: _listem.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        ScreenUtil().orientation == Orientation.portrait
                            ? 2
                            : 3),
                itemBuilder: (context, index) =>
                    PokeListItem(pokemon: _listem[index]));
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Hata Çıktı"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}/*
ListView.builder(
                itemCount: _listem.length,
                itemBuilder: (context, index) {
                  var oankipokemon = _listem[index];
                  return PokeListItem(pokemon: oankipokemon);
                }*/