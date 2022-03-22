import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:httpjson/model/pokemon_model.dart';
import 'package:httpjson/model/services/UI_helper.dart';

class PokeImageAndBall extends StatelessWidget {
  final Pokemonmodel pokemon;
  const PokeImageAndBall({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokeball = "images/Pokebal2.png";
    String pokebal2 = "images/Pokeball.png";
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset(
            pokebal2,
            width: UIHelper.calculatepokeImageAndBallSize(),
            height: UIHelper.calculatepokeImageAndBallSize(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
              imageUrl: pokemon.img ?? "",
              errorWidget: (context, url, error) => Image.asset(pokeball),
              width: UIHelper.calculatepokeImageAndBallSize(),
              height: UIHelper.calculatepokeImageAndBallSize(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
