import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:httpjson/model/pokemon_model.dart';
import 'package:httpjson/model/services/UI_helper.dart';
import 'package:httpjson/pages/detail_page.dart';
import 'package:httpjson/pages/poke_image.dart';
import 'package:httpjson/pages/pokemon_list.dart';

class PokeListItem extends StatelessWidget {
  final Pokemonmodel pokemon;
  const PokeListItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(pokemon: pokemon)));
      },
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
        elevation: 3,
        shadowColor: Colors.white,
        color: UIHelper.getColorFromType(pokemon.type![0]),
        child: Padding(
          padding: UIHelper.getDefaultPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pokemon.name.toString(),
                style: UIHelper.getPokemonNameTextStyle(),
              ),
              Chip(
                label: Text(pokemon.type![0]),
                labelStyle: UIHelper.getTypeChipTextStyle(),
              ),
              Expanded(child: PokeImageAndBall(pokemon: pokemon)),
            ],
          ),
        ),
      ),
    );
  }
}
