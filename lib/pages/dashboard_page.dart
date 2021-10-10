import 'dart:async';

import 'package:bnbs_project/functions/local_functions.dart';
import 'package:bnbs_project/sections/dashboard/map_section.dart';
import 'package:bnbs_project/sections/reports/pie_chart.dart';
import 'package:bnbs_project/widgets/button_widgets.dart';
import 'package:bnbs_project/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'add_property.dart';
import 'find_location_page.dart';

class dashboard_page extends StatefulWidget{
  final double currentLat;
  final double currentLong;

  const dashboard_page({Key? key, required this.currentLat, required this.currentLong}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _dashboard_pageState();
  }

}

class _dashboard_pageState extends State<dashboard_page> {


  double containerHeight=400;
  List<dynamic>searchList=[
    "Karen plains",
    "Langata apartment",
    "Nakuru flats",
    "Olive flats",
    "Composa way",
  ];

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  String? userMode;
  local_functions localFunctions=local_functions();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          map_section(currentLong: widget.currentLong,currentLat: widget.currentLat,),
          containerHeight==400?userMode=="userMode"?controlSection():businessControlSection():expandedControlSection(),
          containerHeight==400?buildFloatingSearchBar():const SizedBox()
        ],
      ),
    );
  }


  /*widgets used for UI in the dashboard*/
  Widget historyLocationUI(){
    return Container(
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
                      color: 0xff707070,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      font: "Lato",
                      fontSize: 17,
                      text: "My Home Style",
                    ),
                  ],
                ),
                const text_widget(
                  color: 0xffFF9C27B0,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 15,
                  text: "Visit again",
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
                  text: "12/12/2020:18:45",
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget activeLocationUI(){
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xffFF9C27B0)),
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
                      color: 0xff707070,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      font: "Lato",
                      fontSize: 17,
                      text: "My Home Style",
                    ),
                  ],
                ),
                const text_widget(
                  color: 0xffFF9C27B0,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 15,
                  text: "currently active",
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
                  text: "12/12/2020:18:45",
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget historyTenantUI(){
    return Container(
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
                    Icon(Icons.account_circle_outlined),
                    SizedBox(width: 8,),
                    text_widget(
                      color: 0xff707070,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      font: "Lato",
                      fontSize: 17,
                      text: "Tenant one",
                    ),
                  ],
                ),
                const text_widget(
                  color: 0xffFF9C27B0,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 15,
                  text: "See details",
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
                  text: "12/12/2020:18:45",
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

  /*search widget UI*/
  Widget buildFloatingSearchBar() {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: 'Where to...',
      scrollPadding: const EdgeInsets.only(top: 8, bottom: 8),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      leadingActions: const [
        Icon(Icons.location_on_outlined,color: Colors.purple,)
      ],
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        // Call your model, bloc, controller here.

      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: searchList.map((value) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(value),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
  /*this is the bottom sheet in the screen when it is not expanded*/
  Widget controlSection(){
    return Column(
      children: [
        Expanded(child: InkWell(
          child: const SizedBox(

          ),
          onTap: (){

          },
        )),
        GestureDetector(
            child: Container(
              height: containerHeight,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight:  Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    containerHeight==400?Padding(
                      padding: const EdgeInsets.only(bottom:8.0),
                      child: Container(
                        width: 50,
                        height: 5,
                        decoration: BoxDecoration(
                            color: const Color(0xfff1f1f1),
                            borderRadius: BorderRadius.circular(5)
                        ),
                      ),
                    ):const SizedBox(height: 50,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const text_widget(
                          color: 0xff000000,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                          font: "Lato",
                          fontSize: 20,
                          text: "Good Afternoon!",
                        ),
                        InkWell(
                          child: text_widget(
                            color: 0xff000000,
                            fontWeight: FontWeight.w700,
                            textAlign: TextAlign.center,
                            font: "Lato",
                            fontSize: 10,
                            text: "${widget.currentLat},${widget.currentLong}",
                          ),
                          onTap: (){
                            map_section map= map_section(currentLat: widget.currentLat, currentLong: widget.currentLong);

                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        text_widget(
                          color: 0xff707070,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                          font: "Lato",
                          fontSize: 15,
                          text: "sample@email.com",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        text_widget(
                          color: 0xffCCCCCC,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                          font: "Lato",
                          fontSize: 15,
                          text: "Previous visited locations.",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    historyLocationUI(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        text_widget(
                          color: 0xffFF9C27B0,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                          font: "Lato",
                          fontSize: 15,
                          text: "Active visit",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    activeLocationUI(),
                    const Expanded(
                      child: SizedBox(
                        height: 20,
                      ),
                    ),
                    InkWell(
                      child: button_widgets(color:0xffe1163c,height: 55,width: 320,radius: 10,borderColor: 0xffFF9C27B0,widget:Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.filter_alt_outlined,color: Colors.white,),
                            text_widget(
                              color: 0xffFFFFFF,
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.center,
                              font: "Lato",
                              fontSize: 20,
                              text: "Find By Preference",
                            ),
                          ],
                        ),
                      )),
                      onTap: (){
                        /*get state of the button*/
                        print("onButtonTap-----");
                        Get.to(find_location_page());
                      },
                    ),
                  ],
                ),
              ),
            ),
            onVerticalDragEnd:(DraggableDetails){
              /*check status of drag*/
              print("onDrag-----");
              if(containerHeight==400){
                setState(() {
                  containerHeight=Get.height;
                });
              }else{
                setState(() {
                  containerHeight=400;
                });
              }

            }
        ),
      ],
    );
  }
  /*this is the bottom sheet in the screen when it is expanded*/
  Widget expandedControlSection(){
    return PageView(
      children: [
        Column(
          children: [
            const Expanded(child: SizedBox(

            )),
            Container(
              height: containerHeight,
              width: Get.width,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    containerHeight==400?Padding(
                      padding: const EdgeInsets.only(bottom:8.0),
                      child: Container(
                        width: 50,
                        height: 5,
                        decoration: BoxDecoration(
                            color: const Color(0xfff1f1f1),
                            borderRadius: BorderRadius.circular(5)
                        ),
                      ),
                    ):const SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        InkWell(
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.keyboard_backspace),
                          ),
                          onTap: (){
                            setState(() {
                              containerHeight=400;
                            });
                          },
                        ),
                        const text_widget(
                          color: 0xffFF9C27B0,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                          font: "Lato",
                          fontSize: 15,
                          text: "<< Swipe to settings ",
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        text_widget(
                          color: 0xff000000,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                          font: "Lato",
                          fontSize: 20,
                          text: "Good Afternoon!",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        text_widget(
                          color: 0xff707070,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                          font: "Lato",
                          fontSize: 15,
                          text: "sample@email.com",
                        ),
                      ],
                    ),
                    pie_chart(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        text_widget(
                          color: 0xffCCCCCC,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                          font: "Lato",
                          fontSize: 15,
                          text: "Previous visited locations.",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    historyLocationUI(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        text_widget(
                          color: 0xffFF9C27B0,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                          font: "Lato",
                          fontSize: 15,
                          text: "Active visit",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    activeLocationUI(),
                    const Expanded(
                      child: SizedBox(
                        height: 20,
                      ),
                    ),
                    userMode=="userMode"?InkWell(
                      child: button_widgets(color:0xffe1163c,height: 55,width: 320,radius: 10,borderColor: 0xffFF9C27B0,widget:Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.filter_alt_outlined,color: Colors.white,),
                            text_widget(
                              color: 0xffFFFFFF,
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.center,
                              font: "Lato",
                              fontSize: 20,
                              text: "Find By Preference",
                            ),
                          ],
                        ),
                      )),
                      onTap: (){
                        /*get state of the button*/
                        print("onButtonTap-----");
                        Get.to(find_location_page());
                      },
                    ):const SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
        settingsPage(),
      ],
    );
  }

  Widget expandedBusinessControlSection(){
    return PageView(
      children: [
        Column(
          children: [
            const Expanded(child: SizedBox(

            )),
            Container(
              height: containerHeight,
              width: Get.width,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    containerHeight==400?Padding(
                      padding: const EdgeInsets.only(bottom:8.0),
                      child: Container(
                        width: 50,
                        height: 5,
                        decoration: BoxDecoration(
                            color: const Color(0xfff1f1f1),
                            borderRadius: BorderRadius.circular(5)
                        ),
                      ),
                    ):const SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        InkWell(
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.keyboard_backspace),
                          ),
                          onTap: (){
                            setState(() {
                              containerHeight=400;
                            });
                          },
                        ),
                        const text_widget(
                          color: 0xffFF9C27B0,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                          font: "Lato",
                          fontSize: 15,
                          text: "<< Swipe to settings ",
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        text_widget(
                          color: 0xff000000,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                          font: "Lato",
                          fontSize: 20,
                          text: "Good Afternoon!",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        text_widget(
                          color: 0xff707070,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                          font: "Lato",
                          fontSize: 15,
                          text: "sample@email.com",
                        ),
                      ],
                    ),
                    pie_chart(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        text_widget(
                          color: 0xffCCCCCC,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                          font: "Lato",
                          fontSize: 15,
                          text: "Previous visited locations.",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    historyLocationUI(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        text_widget(
                          color: 0xffFF9C27B0,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                          font: "Lato",
                          fontSize: 15,
                          text: "Active visit",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    activeLocationUI(),
                    const Expanded(
                      child: SizedBox(
                        height: 20,
                      ),
                    ),
                    userMode=="userMode"?InkWell(
                      child: button_widgets(color:0xffe1163c,height: 55,width: 320,radius: 10,borderColor: 0xffFF9C27B0,widget:Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.filter_alt_outlined,color: Colors.white,),
                            text_widget(
                              color: 0xffFFFFFF,
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.center,
                              font: "Lato",
                              fontSize: 20,
                              text: "Find By Preference",
                            ),
                          ],
                        ),
                      )),
                      onTap: (){
                        /*get state of the button*/
                        print("onButtonTap-----");
                        Get.to(find_location_page());
                      },
                    ):const SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
        settingsPage(),
      ],
    );
  }
  /*settings page this will be accessed by swiping from the right*/
  Widget settingsPage(){
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Expanded(child: SizedBox(height: 40,)),
            Row(
              children: const [
                text_widget(
                  color: 0xff000000,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 20,
                  text: "Settings",
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: const [
                text_widget(
                  color: 0xff707070,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 14,
                  text: "Here you will find all the other features and settings",
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: const [
                text_widget(
                  color: 0xffFF9C27B0,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 16,
                  text: "View my receipts",
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                text_widget(
                  color: 0xffFF9C27B0,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 16,
                  text: "Read Terms & Conditions",
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                userMode=="userMode"?InkWell(
                  child: const text_widget(
                    color: 0xffe1163c,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    font: "Lato",
                    fontSize: 16,
                    text: "Switch to business profile",
                  ),
                  onTap: (){
                    localFunctions.settingUserMode("businessMode");
                    setState(() {
                      containerHeight=400;
                      userMode='businessMode';
                    });
                  },
                ):InkWell(
                  child: const text_widget(
                    color: 0xffe1163c,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    font: "Lato",
                    fontSize: 16,
                    text: "Switch to user profile",
                  ),
                  onTap: (){
                    setState(() {
                      containerHeight=400;
                      userMode='userMode';
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                text_widget(
                  color: 0xff707070,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 16,
                  text: "Log out",
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              child: button_widgets(color:0xffe1163c,height: 55,width: 320,radius: 10,borderColor: 0xffFF9C27B0,widget:Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.pin_drop_outlined,color: Colors.white,),
                    text_widget(
                      color: 0xffFFFFFF,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                      font: "Lato",
                      fontSize: 20,
                      text: " Add a home",
                    ),
                  ],
                ),
              )),
              onTap: (){
                /*get state of the button*/
                print("onButtonTap-----");
                Get.to(add_property());
              },
            ),
          ],
        ),
      ),
    );
  }
  /*when the account is switched to business the layout of expanded and not expanded*/
  Widget businessControlSection(){
    return Column(
      children: [
        const Expanded(child: SizedBox(

        )),
        GestureDetector(
            child: Container(
              height: containerHeight,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight:  Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    containerHeight==400?Padding(
                      padding: const EdgeInsets.only(bottom:8.0),
                      child: Container(
                        width: 50,
                        height: 5,
                        decoration: BoxDecoration(
                            color: const Color(0xfff1f1f1),
                            borderRadius: BorderRadius.circular(5)
                        ),
                      ),
                    ):const SizedBox(height: 50,),
                    Row(
                      children: const [
                        text_widget(
                          color: 0xff000000,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                          font: "Lato",
                          fontSize: 20,
                          text: "Good Afternoon!",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        text_widget(
                          color: 0xff707070,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                          font: "Lato",
                          fontSize: 15,
                          text: "sample@email.com",
                        ),
                      ],
                    ),
                    pie_chart(),
                    Row(
                      children: const [
                        text_widget(
                          color: 0xffCCCCCC,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                          font: "Lato",
                          fontSize: 15,
                          text: "Previous tenants.",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    historyTenantUI(),
                  ],
                ),
              ),
            ),
            onVerticalDragEnd:(DraggableDetails){
              /*check status of drag*/
              print("onDrag-----");
              if(containerHeight==400){
                setState(() {
                  containerHeight=Get.height;
                });
              }else{
                setState(() {
                  containerHeight=400;
                });
              }

            }
        ),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*checking the user mode if its business or user..*/
  }


}