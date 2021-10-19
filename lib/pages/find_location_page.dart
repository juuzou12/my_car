import 'package:bnbs_project/sections/find_location/attendance.dart';
import 'package:bnbs_project/sections/find_location/duration_section.dart';
import 'package:bnbs_project/widgets/formbuildtextfield.dart';
import 'package:bnbs_project/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class find_location_page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _find_location_pageState();
  }

}

class _find_location_pageState extends State<find_location_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Lottie.asset('assets/animations/hello.json',
                width: 300,
                height: 300),
            const text_widget(
              color: 0xff000000,
              fontWeight: FontWeight.w800,
              textAlign: TextAlign.center,
              font: "Lato",
              fontSize: 20,
              text: "Let's get you hooked up with a place of your choosing.",
            ),
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: text_widget(
                color: 0xff707070,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                font: "Lato",
                fontSize: 15,
                text: "First pick the kind of place you would like to rent out",
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: const Color(0xfff1f1f1),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.home_outlined,size: 40,color: Color(0xffFF9C27B0),),
                          text_widget(
                            color: 0xffFF9C27B0,
                            fontWeight: FontWeight.w800,
                            textAlign: TextAlign.center,
                            font: "Lato",
                            fontSize: 15,
                            text: "Stand alone",
                          )
                        ],
                      ),
                    ),
                  ),
                  onTap: (){
                    Get.to(const duration_section(StandAlone: 'standAlong',));
                  },
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: const Color(0xfff1f1f1),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.apartment_outlined,size: 40,color: Color(0xffFF9C27B0),),
                          text_widget(
                            color: 0xffFF9C27B0,
                            fontWeight: FontWeight.w800,
                            textAlign: TextAlign.center,
                            font: "Lato",
                            fontSize: 15,
                            text: "Apartment",
                          )
                        ],
                      ),
                    ),
                  ),
                  onTap: (){
                    Get.to(duration_section(StandAlone: 'apartment',));
                  },
                ),
              ],
            ),
            const Expanded(child: SizedBox(height: 50,)),
          ],
        ),
      ),
    );
  }
}