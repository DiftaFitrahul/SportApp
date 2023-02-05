import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LineUp extends StatelessWidget {
  const LineUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 28,
        right: 28,
        bottom: 28,
      ),
      child: Stack(
        children: [
          Image.network(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Soccer_Field_Transparant.svg/800px-Soccer_Field_Transparant.svg.png",
          ),
          Positioned(
            top: 50,
            left: 1,
            right: 1,
            child: Wrap(
              runSpacing: 60,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      FontAwesomeIcons.shirt,
                      color: Colors.white,
                    ),
                    Icon(
                      FontAwesomeIcons.shirt,
                      color: Colors.white,
                    ),
                    Icon(
                      FontAwesomeIcons.shirt,
                      color: Colors.white,
                    ),
                    Icon(
                      FontAwesomeIcons.shirt,
                      color: Colors.white,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      FontAwesomeIcons.shirt,
                      color: Colors.white,
                    ),
                    Icon(
                      FontAwesomeIcons.shirt,
                      color: Colors.white,
                    ),
                    Icon(
                      FontAwesomeIcons.shirt,
                      color: Colors.white,
                    ),
                    Icon(
                      FontAwesomeIcons.shirt,
                      color: Colors.white,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      FontAwesomeIcons.shirt,
                      color: Colors.white,
                    ),
                    Icon(
                      FontAwesomeIcons.shirt,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            right: 1,
            left: 1,
            child: Wrap(
              runSpacing: 35,
              children: [
                const Center(
                  child: Icon(
                    FontAwesomeIcons.shirt,
                    color: Colors.blue,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      FontAwesomeIcons.shirt,
                      color: Colors.blue,
                    ),
                    Icon(
                      FontAwesomeIcons.shirt,
                      color: Colors.blue,
                    ),
                    Icon(
                      FontAwesomeIcons.shirt,
                      color: Colors.blue,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      FontAwesomeIcons.shirt,
                      color: Colors.blue,
                    ),
                    Icon(
                      FontAwesomeIcons.shirt,
                      color: Colors.blue,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      FontAwesomeIcons.shirt,
                      color: Colors.blue,
                    ),
                    Icon(
                      FontAwesomeIcons.shirt,
                      color: Colors.blue,
                    ),
                    Icon(
                      FontAwesomeIcons.shirt,
                      color: Colors.blue,
                    ),
                    Icon(
                      FontAwesomeIcons.shirt,
                      color: Colors.blue,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

/*
const 

*/