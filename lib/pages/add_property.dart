import 'package:bnbs_project/sections/onboarding/house_details.dart';
import 'package:bnbs_project/widgets/button_widgets.dart';
import 'package:bnbs_project/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class add_property extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _add_propertyState();
  }

}

class _add_propertyState extends State<add_property> {
  LottieComposition? composition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Row(
              children:  [
                InkWell(
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.keyboard_backspace),
                  ),
                  onTap: (){
                    Get.back();
                  },
                )
              ],
            ),
            const Expanded(child: SizedBox(height: 50,)),
            Lottie.asset('assets/animations/walking.json',
                width: 300,
                fit: BoxFit.fitWidth,
                animate: true ,reverse: false,addRepaintBoundary: true),
            const text_widget(
              color: 0xffFF9C27B0,
              fontWeight: FontWeight.w800,
              textAlign: TextAlign.center,
              font: "Lato",
              fontSize: 25,
              text: "Add a home",
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: text_widget(
                color: 0xff707070,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                font: "Lato",
                fontSize: 15,
                text: "This is a process to add a home or property for renting out. This will be a process that involves personal information",
              ),
            ),
            const Expanded(child: SizedBox(height: 50,)),
            InkWell(
              child: const button_widgets(color:0xffe1163c,height: 55,width: 320,radius: 10,borderColor: 0xffFF9C27B0,widget:Center(
                child: text_widget(
                  color: 0xffFFFFFF,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 20,
                  text: "Next",
                ),
              )),
              onTap: (){
                Get.to(house_details());
              },
            ),
            const SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}