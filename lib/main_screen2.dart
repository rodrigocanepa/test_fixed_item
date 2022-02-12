import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:test_fixed_item/item_text.dart';

class MainScreen2 extends StatefulWidget {
  const MainScreen2({Key? key}) : super(key: key);

  @override
  _MainScreen2State createState() => _MainScreen2State();
}

class _MainScreen2State extends State<MainScreen2> {

  GlobalKey<State> key = GlobalKey();
  GlobalKey<State> key2 = GlobalKey();

  double fabOpacityLeft = 0.0;
  double fabOpacityRight = 1.0;

  double fabOpacityLeft2 = 0.0;
  double fabOpacityRight2 = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: NotificationListener<ScrollNotification>(
                child: ListView.builder(
                  itemCount: 100,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) => ItemText(
                      index: index,
                      key: getKey(index),
                  ),
                ),
                onNotification: (ScrollNotification scroll) {
                  var currentContext = key.currentContext;
                  if (currentContext != null){
                    var renderObject = currentContext.findRenderObject();
                    RenderAbstractViewport? viewport = RenderAbstractViewport.of(renderObject);
                    var offsetToRevealBottom = viewport!.getOffsetToReveal(renderObject!, 1.0);
                    var offsetToRevealTop = viewport.getOffsetToReveal(renderObject, 0.0);

                    // left
                    if (offsetToRevealTop.offset < scroll.metrics.pixels) {
                      if (fabOpacityLeft != 1.0) {
                        print('encendiendo');
                        setState(() {
                          fabOpacityLeft = 1.0;
                        });
                      }
                    } else {
                      if (fabOpacityLeft == 1.0) {
                        print('apagandolo');
                        setState(() {
                          fabOpacityLeft = 0.0;
                        });
                      }
                    }

                    // right
                    if ((scroll.metrics.pixels) < offsetToRevealTop.offset - (offsetToRevealTop.offset - offsetToRevealBottom.offset)) {
                      if (fabOpacityRight != 1.0) {
                        print('encendiendo');
                        setState(() {
                          fabOpacityRight = 1.0;
                        });
                      }
                    } else {
                      if (fabOpacityRight == 1.0) {
                        print('apagandolo');
                        setState(() {
                          fabOpacityRight = 0.0;
                        });
                      }
                    }
                  }


                  // ************ WE ARE GOING TO READ THE KEY 2 ****************
                  var currentContext2 = key2.currentContext;
                  if (currentContext2 != null) {
                    var renderObject2 = currentContext2.findRenderObject();
                    RenderAbstractViewport? viewport2 = RenderAbstractViewport.of(renderObject2);
                    var offsetToRevealBottom2 = viewport2!.getOffsetToReveal(renderObject2!, 1.0);
                    var offsetToRevealTop2 = viewport2.getOffsetToReveal(renderObject2, 0.0);

                    // left
                    if (offsetToRevealTop2.offset < scroll.metrics.pixels) {
                      if (fabOpacityLeft2 != 1.0) {
                        setState(() {
                          fabOpacityLeft2 = 1.0;
                        });
                      }
                    } else {
                      if (fabOpacityLeft2 == 1.0) {
                        setState(() {
                          fabOpacityLeft2 = 0.0;
                        });
                      }
                    }

                    // right
                    if ((scroll.metrics.pixels) < offsetToRevealTop2.offset - (offsetToRevealTop2.offset - offsetToRevealBottom2.offset)) {
                      if (fabOpacityRight2 != 1.0) {
                        print('encendiendo');
                        setState(() {
                          fabOpacityRight2 = 1.0;
                        });
                      }
                    } else {
                      if (fabOpacityRight2 == 1.0) {
                        print('apagandolo');
                        setState(() {
                          fabOpacityRight2 = 0.0;
                        });
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
              child: Opacity(
                opacity: fabOpacityLeft,
                child: Row(
                  children: [
                    const SizedBox(width: 30.0),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.green.shade200
                      ),
                      child: Row(
                        children: const [
                          Icon(
                              Icons.keyboard_arrow_left_rounded
                          ),
                          Text(
                            '10',
                            style: TextStyle(
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
              child: Opacity(
                opacity: fabOpacityRight,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.green.shade200
                      ),
                      child:Row(
                        children: const [
                          Text(
                            '10',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Icon(
                              Icons.keyboard_arrow_right_rounded
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 30.0),
                  ],
                ),
              ),
            ),
          ),


          Positioned(
            top: 30.0,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0, right: 5.0),
              child: Opacity(
                opacity: fabOpacityLeft2,
                child: Row(
                  children: [
                    const SizedBox(width: 30.0),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.green.shade200
                      ),
                      child: Row(
                        children: const [
                          Icon(
                              Icons.keyboard_arrow_left_rounded
                          ),
                          Text(
                            '20',
                            style: TextStyle(
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
                ),
              ),
            ),
          ),
          Positioned(
            top: 30.0,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0, right: 5.0),
              child: Opacity(
                opacity: fabOpacityRight2,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.green.shade200
                      ),
                      child: Row(
                        children: const [
                          Text(
                            '20',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right_rounded
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 30.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  getKey(int index){
    if(index == 10){
      return key;
    } else if(index == 20){
      return key2;
    } else{
      return null;
    }
  }
}
