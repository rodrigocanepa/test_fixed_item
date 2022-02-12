import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_fixed_item/provider_selection.dart';
import 'package:test_fixed_item/tooltip_shape_widget.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ItemText extends StatefulWidget {
  final int index;
  const ItemText({Key? key, required this.index}) : super(key: key);

  @override
  _ItemTextState createState() => _ItemTextState();
}

class _ItemTextState extends State<ItemText> {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      height: 50.0,
      child: Column(
        children: [
          (widget.index == 20 || widget.index == 10) ? Container(
              decoration: ShapeDecoration(
                color: Colors.green.shade200,
                shape: TooltipShapeBorder(
                    arrowArc: 0.5, arrowPosition: 'bottom'),
                shadows: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4.0,
                      offset: Offset(2, 2))
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: const [
                    Text(
                      'Data 1',
                    ),
                    Text(
                      // All this show just to Capitalise in Dart FFS!
                      'Data 2',
                    ),
                    Text(
                      // Just dates, no day
                      'Data 3',
                    )
                  ],
                ),
              )
          ) : SizedBox(height: 69.0),
          const SizedBox(height: 5.0),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: (widget.index == 20 || widget.index == 10) ? Colors.green.shade200 : Colors.transparent
            ),
            child: Text(
              widget.index.toString(),
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          const SizedBox(height: 10.0),

        ],
      ),
    );
  }
}
