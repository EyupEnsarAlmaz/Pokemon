import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:httpjson/model/pokemon_model.dart';
import 'package:httpjson/model/services/UI_helper.dart';

class PokeInformation extends StatelessWidget {
  final Pokemonmodel pokemonmodel;
  const PokeInformation({Key? key, required this.pokemonmodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInformationRow("Name", pokemonmodel.name),
            _buildInformationRow("Height", pokemonmodel.height),
            _buildInformationRow("Weight", pokemonmodel.weight),
            _buildInformationRow("Spawn Time", pokemonmodel.spawnTime),
            _buildInformationRow("Weakness", pokemonmodel.weaknesses),
            _buildInformationRow("Pre Evolution", pokemonmodel.prevEvolution),
            _buildInformationRow("Next Evolution", pokemonmodel.nextEvolution)
          ],
        ),
      ),
    );
  }

  _buildInformationRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: UIHelper.getPokeLabelTextStyle(),
        ),
        if (value is List && value.isNotEmpty)
          Text(
            value.join(" , "),
            style: UIHelper.getPokeInfoTextStyle(),
          )
        else if (value == null)
          Text(
            "Not available",
            style: UIHelper.getPokeInfoTextStyle(),
          )
        else
          Text(
            value,
            style: UIHelper.getPokeInfoTextStyle(),
          ),
      ],
    );
  }
}
