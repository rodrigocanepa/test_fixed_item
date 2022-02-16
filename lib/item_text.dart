import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_fixed_item/provider_selection.dart';
import 'package:test_fixed_item/tooltip_shape_widget.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ItemText extends StatefulWidget {
  final int index;
  final GlobalKey globalKey;
  const ItemText({Key? key, required this.globalKey, required this.index}) : super(key: key);

  @override
  _ItemTextState createState() => _ItemTextState();
}

class _ItemTextState extends State<ItemText> {
  @override
  Widget build(BuildContext context) {
    var providerSelection = Provider.of<ProviderSelection>(context, listen: false);
    var auxItem;
    bool isSelected = false;
    for(var value in providerSelection.valuesSelected){
      if(value.value == widget.index){
        isSelected = true;
        auxItem = value;
      }
    }

    return GestureDetector(
      onTap: (){
        if(isSelected){
          providerSelection.removeValueSelectedToList(auxItem);
        } else{
          providerSelection.addValueSelectedToList(widget.index, widget.globalKey);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        height: 50.0,
        child: Column(
          children: [
            isSelected ? Container(
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
            ) : const SizedBox(height: 69.0),
            const SizedBox(height: 5.0),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: isSelected ? Colors.green.shade200 : Colors.transparent
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
      ),
    );
  }
}
