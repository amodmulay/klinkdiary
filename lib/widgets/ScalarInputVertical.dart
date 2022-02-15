import 'package:flutter/material.dart';

class ScalarInputVertical<T extends num> extends StatefulWidget {
  const ScalarInputVertical({Key? key, required this.min, required this.max, required this.divisions, required this.initialValue}) : super(key: key);

  final T min;
  final T max;
  final int divisions;

  final T initialValue;

  @override
  _ScalarInputVerticalState createState() => _ScalarInputVerticalState(min, max, divisions, initialValue);
}

class _ScalarInputVerticalState<T extends num> extends State<ScalarInputVertical<T>> {

  late final double _min;
  late final double _max;
  late final int _divisions;

  late double _value;

  _ScalarInputVerticalState(T min, T max, int divisions, T value) {
    this._min = min.toDouble();
    this._max = max.toDouble();
    this._divisions = divisions;

    this._value = value.toDouble();
  }

  @override
  Widget build(BuildContext context) {

    final double increment = (_max - _min) / _divisions;

    Widget _slider = RotatedBox(
        quarterTurns: 3,
        child: Slider(
          value: _value,
          min: _min,
          max: _max,
          divisions: _divisions,
          onChanged: (double newValue) {
            setState(() {
              _value = newValue;
            });
          },
        ));

    Text _text = Text(_value.toStringAsFixed(1));

    Widget _buttons = Column(
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_circle_up, color: Colors.blue),
          onPressed: () {
            setState(() {
              _value += increment;
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.arrow_circle_down, color: Colors.blue),
          onPressed: () {
            setState(() {
              _value -= increment;
            });
          },
        ),
      ],
    );

    Container container = Container(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _slider,
                  _text,
                ]),
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_buttons])
          ]),
    );

    return container;
  }
}
