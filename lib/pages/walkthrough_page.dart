import 'package:bnbs_project/widgets/button_widgets.dart';
import 'package:bnbs_project/widgets/formbuildtextfield.dart';
import 'package:bnbs_project/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:lottie/lottie.dart';

import 'dashboard_page.dart';
import 'signup_page.dart';

class walthrough_page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _walthrough_pageState();
  }

}

class _walthrough_pageState extends State<walthrough_page> {
  Location location = new Location();

  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;
  /*getting the your current location*/
  void getCurrentLocation()async{
    _locationData = await location.getLocation();
    if(_locationData!=null){
      Get.off(dashboard_page(currentLat: _locationData!.latitude,currentLong: _locationData!.longitude));
    }
    print("-----$_locationData-------");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        physics: const BouncingScrollPhysics(),
        children: [
          /*this is first image...*/
          SizedBox(
            width: Get.width,
            height: Get.height,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(child: SizedBox(),),
                  Image.asset("assets/icons/home.png",
                    width: 200,
                    height: 200,),
                  const text_widget(
                    color: 0xff000000,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                    font: "Lato",
                    fontSize: 20,
                    text: "Find a place",
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: text_widget(
                      color: 0xff707070,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                      font: "Lato",
                      fontSize: 18,
                      text: "Find a place for a night with zero effort. This is made simple by simply login in",
                    ),
                  ),
                  const Expanded(child: SizedBox(),),

                  RotatedBox(
                    quarterTurns: 90,
                    child: Lottie.asset('assets/animations/next.json',
                        width: 200),
                  ),
                ],
              ),
            ),
          ),
          /*this is second image...*/
          SizedBox(
            width: Get.width,
            height: Get.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(child: SizedBox(),),
                Image.asset("assets/images/interior.png",
                  width: 250,
                  height: 250,),
                const text_widget(
                  color: 0xff000000,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 20,
                  text: "Fully furnished houses",
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: text_widget(
                    color: 0xff707070,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    font: "Lato",
                    fontSize: 18,
                    text: "Experience a wonderful stay with wonderful and fully furnished equipments.",
                  ),
                ),
                const Expanded(child: SizedBox(),),

                RotatedBox(
                  quarterTurns: 90,
                  child: Lottie.asset('assets/animations/next.json',
                      width: 200,),
                ),
              ],
            ),
          ),
          /*this is third image...*/
          loginScreen(),
        ],
      )
    );
  }

  /*login page screen*/
  Widget loginScreen(){
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Row(
              children: const [
                text_widget(
                  color: 0xff000000,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 20,
                  text: "Welcome to BnBs",
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: const [
                text_widget(
                  color: 0xff707070,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 16,
                  text: "Login to your account to find a house and history",
                ),
              ],
            ),
            const SizedBox(height: 40,),
            FormBuilder(
              child: Column(
                  children: const [
                    formbuildtextfield(height: 50,color: 0xff000000,hintText:"sample@email.com" ,attribute: "name",
                      dividerColor:0xffFFFFFF ,errorText:"Enter an email first" ,font: "Lato",keybordType: TextInputType.emailAddress,fontWeight:FontWeight.w400 ,fontSize: 15.0,
                      formType: "text",dropDownList: [],),
                    SizedBox(
                      height: 16,
                    ),
                    formbuildtextfield(height: 50,color: 0xff000000,hintText:"***********" ,attribute: "password",
                        dividerColor:0xffFFFFFF ,errorText:"Enter a password first" ,font: "Lato",keybordType: TextInputType.text,fontWeight:FontWeight.w400 ,fontSize: 15.0,
                        formType: "text",dropDownList: [])
                  ]
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                const text_widget(
                  color: 0xff000000,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 15,
                  text: "Forgot password",
                ),
                InkWell(
                  child: const text_widget(
                    color: 0xffFF9C27B0,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                    font: "Lato",
                    fontSize: 15,
                    text: "Create an account",
                  ),
                  onTap: (){
                    Get.to(signup_page());
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              child: const button_widgets(color:0xffe1163c,height: 60,width: 150,radius: 10,borderColor: 0xffFF9C27B0,widget:Center(
                child: text_widget(
                  color: 0xffFFFFFF,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 20,
                  text: "Login",
                ),
              )),
              onTap: (){
                getCurrentLocation();
              },
            ),

          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}