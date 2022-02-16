import 'package:flutter/material.dart';

class DoubleInputVertical extends StatefulWidget {
  final double min;
  final double max;
  final int divisions;

  late final _ScalarInputVerticalState state;

  DoubleInputVertical({Key? key, required this.min, required this.max, required this.divisions, required double value})
      : super(key: key) {
    state = _ScalarInputVerticalState(value: value);
  }

  @override
  _ScalarInputVerticalState createState() => state;

  double get value {
    return state.value;
  }
}

class _ScalarInputVerticalState extends State<DoubleInputVertical> {

  double value;

  _ScalarInputVerticalState({required this.value});

  @override
  Widget build(BuildContext context) {
    final double increment = (widget.max - widget.min) / widget.divisions;

    Widget _slider = RotatedBox(
        quarterTurns: 3,
        child: Slider(
          value: value,
          min: widget.min,
          max: widget.max,
          divisions: widget.divisions,
          onChanged: (double newValue) {
            setState(() {
              value = newValue;
            });
          },
        ));

    Text _text = Text("${value.toStringAsFixed(1)} °C", style: const TextStyle(fontSize: 20, color: Colors.blue));

    Widget _buttons =
        Column(
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_circle_up, color: Colors.blue),
          iconSize: 35.0,
          onPressed: () {
            setState(() {
              value += increment;
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.arrow_circle_down, color: Colors.blue),
          iconSize: 35.0,
          onPressed: () {
            setState(() {
              value -= increment;
            });
          },
        ),
      ],
    );

    return Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
      Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
        _slider,
        _text,
      ]),
      const SizedBox(width: 15.0),
      _buttons
    ]);
  }
}
