import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

// It is a widget which drags down from bottom and
// expands in vertical direction. It expands up to a
// certain fraction of the screen as
//specified and then enables scrolling within
// the expanded height.
class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Draggable Scrollable Sheet'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              width: context.width,
              height: context.height,
              color: Colors.purple,
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 20),
                child: Text(
                  'Draggable Scrollable Sheet Demo',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            DraggableScrollableSheet(
              builder: (BuildContext buildContext,
                  ScrollController scrollController) {
                return Padding(
                  padding: EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: ListView.builder(
                      itemBuilder: (BuildContext buildContext, int index) {
                        return Obx(() => (ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.lightBlue,
                                child: Text(
                                  index.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              title: Text(
                                'Index position is $index',
                                style: TextStyle(
                                    color: controller.selected[index]
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              selectedTileColor: controller.selected[index]
                                  ? Colors.blue
                                  : null,
                              selected: controller.selected[index],
                              onTap: () => controller.selected[index] =
                                  !controller.selected[index],
                            )));
                      },
                      itemCount: 40,
                      controller: scrollController,
                    ),
                  ),
                );
              },
              // minChildSize<=initialChildSize
              // initial size of the sheet when app is opened.
              // default value 0.5
              initialChildSize: .3, //will take 30% of screen space
              //minimum size to which sheet can be dropped down.
              // default value .25
              minChildSize: .15,

              //max size to which  sheet can be dragged up
              //default value 1.0
              maxChildSize: 0.9,
            ),
          ],
        ));
  }
}
