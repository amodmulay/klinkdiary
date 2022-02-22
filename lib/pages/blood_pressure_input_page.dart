import 'package:flutter/material.dart';
/*import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import '../components/page_bottom_button.dart';
import '../components/reusable_card.dart';
import '../theme/constants.dart';
import '../components/round_icon_button.dart';
import '../data/bp_store.dart';
import '../data/bp_store.dart'; */
import '../i18n/i18n.dart';

class BloodPressureInputPage extends StatelessWidget {
  const BloodPressureInputPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(context.localize(PhraseKey.bloodPressure)),
      ),
      body: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),

    );
  }}

    //BPStore store = VxState.store as BPStore;

    /*return Scaffold(
        appBar: AppBar(
          title: const Text('BLOOD PRESSURE'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: VxBuilder(
                      mutations: const {ChangeHeartRate},
                      builder: (context,_,__) => ReusableCard(
                        color: kActiveCardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "HEART RATE",
                              style: kLabelTextStyle,
                            ),
                           /* Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  store.heartRate.toString(),
                                  style: kLargeNumberLabelTextStyle,
                                ),
                                const Text(
                                  "cm",
                                  style: kLabelTextStyle,
                                ),
                              ],
                            ), */
                            SliderTheme(
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
                                value: 11,
                                //value: store.heartRate.toDouble(),
                                min: kSliderMin,
                                max: kSliderMax,
                                divisions: (kSliderMax - kSliderMin).toInt(),
                                onChanged: (double newValue) =>
                                    ChangeHeartRate(newValue.toInt()),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /* Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: VxBuilder(
                      mutations: const {ChangeSystolic},
                      builder: (context,_,__) => ReusableCard(
                        color: kActiveCardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Systolic",
                              style: kLabelTextStyle,
                            ),
                            Text(
                              store.systolic.toString(),
                              style: kLargeNumberLabelTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () =>
                                      ChangeSystolic(store.systolic + 1),
                                ),
                                const SizedBox(width: 10),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () =>
                                      ChangeSystolic(store.systolic - 1),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: VxBuilder(
                      mutations: const {ChangeDiastolic},
                      builder: (context,_,__) => ReusableCard(
                        color: kActiveCardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Diastolic",
                              style: kLabelTextStyle,
                            ),
                            Text(
                              store.diastolic.toString(),
                              style: kLargeNumberLabelTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () => ChangeDiastolic(store.diastolic + 1),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () => ChangeDiastolic(store.diastolic - 1),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),*/
            /*PageBottomButton(
              label: 'ADD RECORD',
              onPress: () {
                /*final calc = Calculator(height: store.height, weight: store.weight);
                final bmi = calc.calculate();
                final result = calc.getResult();
                final interpretation = calc.getInterpretation(); */

               /* Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                          bmi: bmi,
                          result: result,
                          interpretation: interpretation,
                        )));*/
              },
            ),*/
          ],
        )); */
 // }
//}