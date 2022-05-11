import 'package:flutter/material.dart';

import '../i18n/i18n.dart';
import '../theme/constants.dart';

class HorizontalSlider extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final String label;

  late final _HorizontalSliderState state;

  HorizontalSlider(
      {Key? key,
      required this.maxValue,
      required this.minValue,
        required this.label,
        required double currentSliderValue})
      : super(key: key) {
    state = _HorizontalSliderState(currentSliderValue: currentSliderValue);
  }

  double get currentSliderValue {
    return state.currentSliderValue;
  }

  @override
  State<StatefulWidget> createState() => state;
}

class _HorizontalSliderState extends State<HorizontalSlider> {
  double currentSliderValue;

  _HorizontalSliderState({required this.currentSliderValue});

  @override
  Widget build(BuildContext context) {
    Widget _textArea =
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                currentSliderValue.round().toString(),
                style: kLargeNumberLabelTextStyle,
              ),
              const Text(
                " bpm",
                style: kLabelTextStyle,
              ),
            ],
    );

    Widget _slider = SliderTheme(
      data: SliderTheme.of(context).copyWith(
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 15.0,
        ),
        overlayShape: const RoundSliderOverlayShape(
          overlayRadius: 30.0,
        ),
        thumbColor: Colors.deepOrange,
        overlayColor: Colors.deepOrange.shade900,
        activeTrackColor: Colors.white,
        inactiveTrackColor: const Color(0xFF8D8E98),
      ),
      child: Slider(
        value: currentSliderValue,
        min: widget.minValue,
        max: widget.maxValue,
        divisions: (widget.maxValue - widget.minValue).toInt(),
        label: currentSliderValue.round().toString(),
        onChanged: (double newValue) {
          setState(() {
            currentSliderValue = newValue;
          });
        },
      ),
    );

    Widget _sliderLayout = Padding(
    padding: const EdgeInsets.all(36.0),
    child: _slider);
    return Column( children: [_textArea,_sliderLayout]);
  }
}
