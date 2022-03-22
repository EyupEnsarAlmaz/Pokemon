import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:httpjson/model/pokemon_model.dart';
import 'package:httpjson/model/services/UI_helper.dart';
import 'package:httpjson/pages/poke_information.dart';
import 'package:httpjson/pages/poke_type_name.dart';

class DetailPage extends StatelessWidget {
  final Pokemonmodel pokemon;
  const DetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokebal2 = "images/Pokeball.png";
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              padding: UIHelper.getDefaultPadding(),
              iconSize: 24.h,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          PokeTypeName(pokemon: pokemon),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: Stack(children: [
              Positioned(
                child: Image.asset(
                  pokebal2,
                  height: 0.15.sh,
                  fit: BoxFit.fitHeight,
                ),
                right: 0,
                top: 0,
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 0.12.sh,
                  child: PokeInformation(pokemonmodel: pokemon)),
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: pokemon.id!,
                  child: CachedNetworkImage(
                    imageUrl: pokemon.img ?? "",
                    height: 0.25.sh,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              )
            ]),
          )
        ],
      )),
    );
  }
}
