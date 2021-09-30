import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class RemainingCard extends StatelessWidget {
  const RemainingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).primaryColor;
    final textColor =
        backgroundColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
    final normalTextStyle =
        Theme.of(context).textTheme.bodyText1!.copyWith(color: textColor);
    final boldTextStyle = Theme.of(context).textTheme.bodyText1!.copyWith(
          color: textColor,
          fontWeight: FontWeight.bold,
        );
    final bigTextStyle = Theme.of(context).textTheme.headline5!.copyWith(
          color: textColor,
          fontWeight: FontWeight.bold,
        );

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          height: 230,
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularPercentIndicator(
                radius: 180,
                percent: 0.75,
                lineWidth: 10,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.white,
                backgroundColor: Colors.white30,
                center: CircleContainer(
                  radius: 130,
                  color: Colors.white30,
                  child: Center(
                    child: CircleContainer(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Remaining",
                              style: normalTextStyle,
                            ),
                            Text(
                              "1,112",
                              style: bigTextStyle,
                            ),
                            Text(
                              "kcal",
                              style: normalTextStyle,
                            ),
                          ],
                        ),
                      ),
                      radius: 110,
                      color: backgroundColor.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NutritionLevels(
                      header: "Carbs",
                      takenGrams: 125,
                      neededGrams: 323,
                      boldTextStyle: boldTextStyle,
                      normalTextStyle: normalTextStyle,
                    ),
                    NutritionLevels(
                      header: "Proteins",
                      takenGrams: 115,
                      neededGrams: 129,
                      boldTextStyle: boldTextStyle,
                      normalTextStyle: normalTextStyle,
                    ),
                    NutritionLevels(
                      header: "Fats",
                      takenGrams: 66,
                      neededGrams: 85,
                      boldTextStyle: boldTextStyle,
                      normalTextStyle: normalTextStyle,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CircleContainer extends StatelessWidget {
  const CircleContainer({
    this.radius = 100,
    this.color = Colors.white,
    this.child,
    Key? key,
  }) : super(key: key);

  final double radius;
  final Widget? child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      height: radius,
      width: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}

class NutritionLevels extends StatelessWidget {
  const NutritionLevels({
    required this.header,
    required this.takenGrams,
    required this.neededGrams,
    required this.boldTextStyle,
    required this.normalTextStyle,
    Key? key,
  }) : super(key: key);

  final String header;
  final int takenGrams;
  final int neededGrams;
  final TextStyle boldTextStyle;
  final TextStyle normalTextStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: boldTextStyle,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: LinearPercentIndicator(
              padding: EdgeInsets.zero,
              progressColor: Colors.white,
              backgroundColor: Colors.white30,
              percent: takenGrams / neededGrams,
            ),
          ),
          Text(
            "$takenGrams/$neededGrams g",
            style: normalTextStyle,
          ),
        ],
      ),
    );
  }
}