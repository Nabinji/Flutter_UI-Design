import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SpeedometerPage extends StatefulWidget {
  const SpeedometerPage({super.key});

  @override
  State<SpeedometerPage> createState() => _SpeedometerPageState();
}

class _SpeedometerPageState extends State<SpeedometerPage> {
  final ValueNotifier<double> _notifier = ValueNotifier(0.0);
  late final Ticker _ticker;
  bool isAccelerating = false;
  @override
  void initState() {
    super.initState();
    _ticker = Ticker(updateSpeed);
    _ticker.start();
  }

  void updateSpeed(Duration elapsed) {
    setState(() {
      if (isAccelerating) {
        // gradual accelerating
        _notifier.value = (_notifier.value + elapsed.inMilliseconds * 0.00003)
            .clamp(0.0, 240);
      } else {
        // gradual declerating
        _notifier.value = (_notifier.value - elapsed.inMilliseconds * 0.00001)
            .clamp(0.0, 240);
      }
    });
  }

  void startAcceleration() {
    setState(() {
      isAccelerating = true;
    });
  }

  void startDecleration() {
    setState(() {
      isAccelerating = false;
    });
  }

  void applyBreak() {
    setState(() {
      isAccelerating = false;
      // smooth braking
      _notifier.value = (_notifier.value - 20).clamp(0.0, 240);
    });
  }

  @override
  void dispose() {
    _ticker.dispose();
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "SPPDOMETER",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Speedometer
            ValueListenableBuilder<double>(
              valueListenable: _notifier,
              builder: (context, speed, child) {
                return SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      startAngle: 140,
                      endAngle: 40,
                      minimum: 0,
                      maximum: 240,
                      radiusFactor: 0.9,
                      majorTickStyle: const MajorTickStyle(
                        length: 12,
                        thickness: 2,
                        color: Colors.white,
                      ),
                      minorTicksPerInterval: 4,
                      minorTickStyle: const MinorTickStyle(
                        length: 6,
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      axisLineStyle: const AxisLineStyle(
                        thickness: 15,
                        gradient: SweepGradient(
                          colors: [
                            Colors.green,
                            Colors.yellow,
                            Colors.orange,
                            Colors.red,
                          ],
                          stops: [0.25, 0.5, 0.75, 1],
                        ),
                      ),
                      axisLabelStyle: const GaugeTextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      pointers: <GaugePointer>[
                        NeedlePointer(
                          value: speed,
                          enableAnimation: true,
                          animationType: AnimationType.easeOutBack,
                          needleColor: Colors.white,
                          needleStartWidth: 1,
                          needleEndWidth: 5,
                          needleLength: 0.75,
                          animationDuration: 2000,
                          gradient: const LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.red,
                            ],
                          ),
                          knobStyle: KnobStyle(
                            color: Colors.purple,
                            borderColor: Colors.blue.withAlpha(100),
                            borderWidth: 1,
                          ),
                        ),
                      ],
                      ranges: [
                        GaugeRange(
                          startValue: 0,
                          endValue: 30,
                          color: Colors.pink,
                          startWidth: 15,
                          endWidth: 15,
                        ),
                        GaugeRange(
                          startValue: 30,
                          endValue: 80,
                          color: Colors.green,
                          startWidth: 15,
                          endWidth: 15,
                        ),
                        GaugeRange(
                          startValue: 80,
                          endValue: 160,
                          color: Colors.amber,
                          startWidth: 15,
                          endWidth: 15,
                        ),
                        GaugeRange(
                          startValue: 160,
                          endValue: 240,
                          color: Colors.red,
                          startWidth: 15,
                          endWidth: 15,
                        ),
                      ],
                      annotations: [
                        GaugeAnnotation(
                          widget: Column(
                            children: [
                              Text(
                                speed.toStringAsFixed(0),
                                style: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,
                                  shadows: [
                                    Shadow(
                                      color: Colors.white,
                                      blurRadius: 20,
                                    ),
                                  ],
                                ),
                              ),
                              const Text(
                                "km/h",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          angle: 90,
                          positionFactor: 0.75,
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDashboardState("RPM", "7000", Colors.tealAccent),
                    buildDashboardState("Fuel", "65%", Colors.orangeAccent),
                    buildDashboardState("Temp", "92°C", Colors.redAccent),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDashboardState("Battery", "12.8V", Colors.pinkAccent),
                    buildDashboardState("Gear", "D", Colors.white),
                  ],
                )
              ],
            ),
            // controls button

            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTapDown: (_) => startAcceleration(),
                  onTapUp: (_) => startDecleration(),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        // backgroundColor: Colors.blue,
                        disabledBackgroundColor: Colors.white),
                    // now we have work on functional parts
                    onPressed:
                        null, // keeps the button inactive since festureDetector manages taps
                    child: const Text(
                      "Accelerate",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: applyBreak,
                    child: const Text(
                      "Breake",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildDashboardState(String title, String value, Color color) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
            shadows: [
              Shadow(
                color: color,
                blurRadius: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
