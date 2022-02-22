import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme/constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  RoundIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      constraints: kRoundIconButtonConstraints,
      shape: CircleBorder(),
      fillColor: kRoundIconButtonColor,
    );
  }
}