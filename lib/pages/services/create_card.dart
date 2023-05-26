import 'package:flutter/material.dart';
import 'package:calculate_bmi/pages/services/constances.dart';

// this class creates cards throughout the app.
class CreateCard extends StatelessWidget {
  final Color myColour;
  final Widget cardChild;
  const CreateCard(this.myColour, this.cardChild, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: myColour,
      ),
      child: cardChild,
    );
  }
}

// this class returns a column to create male and female cards
class CreateIcon extends StatelessWidget {
  final Icon myIcon;
  final String myText;
  const CreateIcon(this.myIcon, this.myText, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        myIcon,
        const SizedBox(height: 10),
        Text(myText, style: myTextStyle),
      ],
    );
  }
}

// create a minus and plus button.
class CreateButton extends StatelessWidget {
  const CreateButton(
      {super.key, required this.myIcon, required this.myFunction});
  final IconData myIcon;
  final VoidCallback myFunction;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6,
      onPressed: myFunction,
      shape: const CircleBorder(),
      fillColor: const Color(0xff1e283a),
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      child: Icon(
        myIcon,
        size: 25,
        color: Colors.white,
      ),
    );
  }
}

// create the bottom buttons.

class Bottonbutton extends StatelessWidget {
  final String buttonText;
  const Bottonbutton(this.buttonText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0XFFEB1555),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(top: 10, bottom: 2),
      width: double.infinity,
      child: Center(
          child: Text(buttonText,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
                color: Colors.white,
                fontFamily: 'Quitery-Regular',
              ))),
    );
  }
}
