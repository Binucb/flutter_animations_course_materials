import 'package:flutter/material.dart';

class BinuTweenAnimationPage extends StatelessWidget {
  const BinuTweenAnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Binu's Tween Animation Page")),
      body: BinuHSVColorSelector(),
    );
  }
}

class BinuHSVColorSelector extends StatefulWidget {
  const BinuHSVColorSelector({Key? key}) : super(key: key);

  @override
  State<BinuHSVColorSelector> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BinuHSVColorSelector> {
  double _hue = 45.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            //mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 1500),
                width: 200,
                height: 200,
                //color: HSVColor.fromAHSV(1.0, _hue, 1.0, 1.0).toColor(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: HSVColor.fromAHSV(1.0, _hue, 1.0, 1.0).toColor(),
                ),
              ),
              SizedBox(
                width: 48,
              ),
              TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: _hue),
                  duration: Duration(milliseconds: 3500),
                  builder: (context, hue, child) {
                    return Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: HSVColor.fromAHSV(1.0, _hue, 1.0, 1.0).toColor(),
                      ),
                    );
                  }),
            ],
          ),
        ),
        SizedBox(
          height: 48,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            height: 30.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              for (var h = 0.0; h < 360.0; h += 1)
                HSVColor.fromAHSV(1, h, 1, 1).toColor()
            ], stops: [
              for (var h = 0.0; h < 360.0; h += 1) h / 360
            ])),
          ),
        ),
        Slider.adaptive(
            value: _hue,
            min: 0,
            max: 360,
            onChanged: ((newValue) => setState(() {
                  _hue = newValue;
                }))),
        Text("Hue Value : ${_hue.toString()}")
      ],
    );
  }
}
