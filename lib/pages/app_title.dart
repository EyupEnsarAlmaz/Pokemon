import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:httpjson/model/services/UI_helper.dart';

class AppTitle extends StatefulWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  State<AppTitle> createState() => _AppTitleState();
}

class _AppTitleState extends State<AppTitle> {
  @override
  Widget build(BuildContext context) {
    String pokeball = "images/Pokebal2.png";
    return Container(
      color: Color.fromARGB(255, 145, 10, 0),
      height: UIHelper.getAppTitleWidgetHeight(),
      child: Stack(
        children: [
          Padding(
            padding: UIHelper.getDefaultPadding(),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Pokedex",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              pokeball,
              width: ScreenUtil().orientation == Orientation.portrait
                  ? 0.15.sh
                  : 0.15.sw,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
