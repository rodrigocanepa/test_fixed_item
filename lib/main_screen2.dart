import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:test_fixed_item/item_text.dart';
import 'package:test_fixed_item/provider_selection.dart';
import 'package:test_fixed_item/value_selected_model.dart';

class MainScreen2 extends StatefulWidget {
  const MainScreen2({Key? key}) : super(key: key);

  @override
  _MainScreen2State createState() => _MainScreen2State();
}

class _MainScreen2State extends State<MainScreen2> {

  List<GlobalKey<State>> keyList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i = 0; i < 100; i++){
      keyList.add(GlobalKey());
    }
  }

  @override
  Widget build(BuildContext context) {
    var providerSelection = Provider.of<ProviderSelection>(context, listen: true);
    List<ValueSelectedModel> valueSelectedList = providerSelection.valuesSelected;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: NotificationListener<ScrollNotification>(
                child: ListView.builder(
                  itemCount: 100,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {

                    return ItemText(
                      index: index,
                      globalKey: keyList[index],
                      key: keyList[index],
                    );
                  }
                ),
                onNotification: (ScrollNotification scroll) {
                  for(var valueSelected in valueSelectedList){
                    var currentContext = valueSelected.globalKey.currentContext;
                    if (currentContext != null){
                      var renderObject = currentContext.findRenderObject();
                      RenderAbstractViewport? viewport = RenderAbstractViewport.of(renderObject);
                      var offsetToRevealBottom = viewport!.getOffsetToReveal(renderObject!, 1.0);
                      var offsetToRevealTop = viewport.getOffsetToReveal(renderObject, 0.0);
                      print(offsetToRevealBottom.toString());
                      // left
                      if (offsetToRevealTop.offset < scroll.metrics.pixels) {
                        if (!providerSelection.valuesLeft.contains(valueSelected.value)) {
                          providerSelection.addValueToList(valueSelected.value, true);
                        }
                      } else {
                        if (providerSelection.valuesLeft.contains(valueSelected.value)) {
                          providerSelection.removeValueToList(valueSelected.value, true);
                        }
                      }

                      // right
                      if ((scroll.metrics.pixels) < offsetToRevealTop.offset - (offsetToRevealTop.offset - offsetToRevealBottom.offset)) {
                        if (!providerSelection.valuesRight.contains(valueSelected.value)) {
                          providerSelection.addValueToList(valueSelected.value, false);
                        }
                      } else {
                        if (providerSelection.valuesRight.contains(valueSelected.value)) {
                          providerSelection.removeValueToList(valueSelected.value, false);
                        }
                      }
                    }
                  }
                  return false;
                },
              ),
            ),
          ),

          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0, right: 5.0),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                      primary: false,
                      itemCount: providerSelection.valuesLeft.length,
                      itemBuilder: (BuildContext context, int index) {
                        return itemLeft(providerSelection.valuesLeft[index]);
                      }
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0, right: 5.0),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: providerSelection.valuesRight.length,
                      itemBuilder: (BuildContext context, int index) {
                        return itemRight(providerSelection.valuesRight[index]);
                      }
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  itemLeft(int value){
    return Row(
      children: [
        const SizedBox(width: 30.0),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.green.shade200
          ),
          child: Row(
            children: [
              const Icon(
                  Icons.keyboard_arrow_left_rounded
              ),
              Text(
                value.toString(),
                style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(),
        ),
      ],
    );
  }

  itemRight(int value){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.green.shade200
          ),
          child: Row(
            children: [
              Text(
                value.toString(),
                style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              const Icon(
                  Icons.keyboard_arrow_right_rounded
              )
            ],
          ),
        ),
        const SizedBox(width: 30.0),
      ],
    );
  }
}
