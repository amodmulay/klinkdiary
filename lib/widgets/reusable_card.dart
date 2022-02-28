import 'package:flutter/material.dart';
import '../theme/constants.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget? child;
  final VoidCallback? onTap;

  ReusableCard({required this.color, this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        margin: const EdgeInsets.all(kCardMargin),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(kCardBorderRadius),),
        ),
      //  color: color,
      ),
    );
  }
}