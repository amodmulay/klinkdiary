import 'package:flutter/material.dart';

class DoubleInputVertical extends StatefulWidget {
  DoubleInputVertical(
      {Key? key, required this.min, required this.max, required this.divisions, required this.value})
      : super(key: key);

  final double min;
  final double max;
  final int divisions;

  double value;

  @override
  _ScalarInputVerticalState createState() => _ScalarInputVerticalState();
}

class _ScalarInputVerticalState extends State<DoubleInputVertical> {

  @override
  Widget build(BuildContext context) {
    final double increment = (widget.max - widget.min) / widget.divisions;

    Widget _slider = RotatedBox(
        quarterTurns: 3,
        child: Slider(
          value: widget.value,
          min: widget.min,
          max: widget.max,
          divisions: widget.divisions,
          onChanged: (double newValue) {
            setState(() {
              widget.value = newValue;
            });
          },
        ));

    Text _text = Text("${widget.value.toStringAsFixed(1)} °C",
        style: const TextStyle(fontSize: 20, color: Colors.blue));

    Widget _buttons = Column(
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_circle_up, color: Colors.blue),
          onPressed: () {
            setState(() {
              widget.value += increment;
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.arrow_circle_down, color: Colors.blue),
          onPressed: () {
            setState(() {
              widget.value -= increment;
            });
          },
        ),
      ],
    );

    Container container = Container(
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
          _slider,
          _text,
        ]),
        _buttons
      ]),
    );

    return container;
  }
}
