import 'package:flutter/material.dart';
import 'package:httpjson/model/pokemon_model.dart';
import 'package:httpjson/model/services/pokedex_api.dart';
import 'package:httpjson/pages/app_title.dart';
import 'package:httpjson/pages/pokemon_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) => Column(
          children: [
            AppTitle(),
            Expanded(child: PokemonList()),
          ],
        ),
      ),
    );
  }
}
