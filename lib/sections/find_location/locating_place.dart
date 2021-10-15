import 'dart:async';

import 'package:bnbs_project/sections/find_location/payment_section.dart';
import 'package:bnbs_project/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class locating_place extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _locating_placeState();
  }

}

class _locating_placeState extends State<locating_place> {
  String message='Pick up a location to stay';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            Lottie.asset('assets/animations/loading.json',
                width: Get.width,
                height: 250),
            const text_widget(
              color: 0xffFF9C27B0,
              fontWeight: FontWeight.w800,
              textAlign: TextAlign.center,
              font: "Lato",
              fontSize: 20,
              text: "Places found",
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: text_widget(
                color: 0xff707070,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                font: "Lato",
                fontSize: 15,
                text: message,
              ),
            ),
            const SizedBox(height: 20,),
            historyLocationUI(),
            historyLocationUI(),

          ],
        ),
      ),
    );
  }

  /*loading message to interact with the user*/
  void loadingController(String message){
    var timer;
    switch(message){
    /*msg--1*/
      case "Sending request":
        timer=Timer(const Duration(microseconds:300 ), ()async{
          setState(() {
            message="Processing your request";
          });
          loadingController(message);
        });

        break;
    /*msg--2*/
      case "Processing your request":
        timer=Timer(const Duration(microseconds:400 ), ()async{
          setState(() {
            message="Knocking at doors to find you a place";
          });
          loadingController(message);
        });

        break;
    /*msg--3*/
      case "Knocking at doors to find you a place":
        timer=Timer(const Duration(microseconds:300 ), ()async{
          setState(() {
            message="Hey have a place for my friend?";
          });
          loadingController(message);
        });

        break;
    /*msg--4*/
      case "Hey have a place for my friend?":
        timer=Timer(const Duration(microseconds:300 ), ()async{
          setState(() {
            message="Found you some options.....";
          });
          loadingController(message);
        });

        break;
    }

  }

  /*widgets used for UI in the dashboard*/
  Widget historyLocationUI(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xfff1f1f1)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.location_on_outlined),
                        SizedBox(width: 8,),
                        text_widget(
                          color: 0xff000000,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                          font: "Lato",
                          fontSize: 17,
                          text: "My Home Style",
                        ),
                      ],
                    ),
                    InkWell(
                      child: const text_widget(
                        color: 0xffFF9C27B0,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        font: "Lato",
                        fontSize: 14,
                        text: "View more",
                      ),
                      onTap: (){

                      },
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(Icons.timer,color: Colors.white,),
                    SizedBox(width: 8,),
                    text_widget(
                      color: 0xff707070,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                      font: "Lato",
                      fontSize: 13,
                      text: "Owner: Owner name",
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
        onTap: (){
          Get.to(const payment_section(state: "paymentForHome",));
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadingController(message);
  }
}