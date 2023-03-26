import 'package:betting_app/dimensions.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class Columnstructure extends StatefulWidget {
  final String text;
  const Columnstructure({Key? key, required this.text}) : super(key: key);

  @override
  State<Columnstructure> createState() => _ColumnstructureState();
}

class _ColumnstructureState extends State<Columnstructure> {
  late String firsthalf;
  late String secondhalf;
  bool hiddentext = true;
  double textheight = Dimensions.screenHeight / 2.1;

  @override
  void initState() {
    if (widget.text.length > textheight) {
      firsthalf = widget.text.substring(0, textheight.toInt());
      secondhalf =
          widget.text.substring(textheight.toInt() + 1, widget.text.length);
    } else {
      firsthalf = widget.text;
      secondhalf = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondhalf.isEmpty
          ? Text(firsthalf)
          : Column(
              children: [
                Text(hiddentext ? ("$firsthalf...") : firsthalf + secondhalf),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddentext = !hiddentext;
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        hiddentext ? "Show More" : "Show Less",
                        style: const TextStyle(
                          color: AppColors.maincolor,
                        ),
                      ),
                      Icon(
                        hiddentext
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColors.maincolor,
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
