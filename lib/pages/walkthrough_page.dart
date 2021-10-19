import 'package:bnbs_project/functions/api_calls.dart';
import 'package:bnbs_project/pages/forgot_password.dart';
import 'package:bnbs_project/widgets/button_widgets.dart';
import 'package:bnbs_project/widgets/formbuildtextfield.dart';
import 'package:bnbs_project/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:lottie/lottie.dart';

import 'dashboard_page.dart';
import 'signup_page.dart';

class walkthrough_page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _walkthrough_pageState();
  }

}

class _walkthrough_pageState extends State<walkthrough_page> {
  final _formKey = GlobalKey<FormBuilderState>();
  Location location = new Location();

  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  /*getting the your current location*/
  void getCurrentLocation() async {
    _locationData = await location.getLocation();
    if (_locationData != null) {
      Get.off(dashboard_page(currentLat: _locationData!.latitude,
          currentLong: _locationData!.longitude));
    }
    print("-----$_locationData-------");
  }

  bool isLoading = false;
  bool passwordVisible = false;

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
  /*TODO.... add the show password icon,change toast color,target the length of password*/
  Widget loginScreen() {
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
                  children: [
                    formbuildtextfield(height: 50,
                        color: 0xff000000,
                        hintText: "Enter your email",
                        attribute: "name",
                        dividerColor: 0xffFFFFFF,
                        errorText: "Enter an email first",
                        font: "Lato",
                        keybordType: TextInputType.emailAddress,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0,
                        formType: "text",
                        dropDownList: [],
                  iconButton: IconButton(
                      icon: Icon(Icons.email),
                      onPressed: () {}),),
                    const SizedBox(
                      height: 16,
                    ),
                    formbuildtextfield(height: 50,
                        color: 0xff000000,
                        hintText: "***********",
                        attribute: "password",
                        dividerColor: 0xffFFFFFF,
                        errorText: "Enter a password first",
                        font: "Lato",
                        keybordType: TextInputType.text,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0,
                        formType: "text",
                        dropDownList: [],
                      iconButton: IconButton(
                          icon: Icon(
                              passwordVisible ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          }),
                    )
                  ]
              ),
              key: _formKey,
            ),
            const SizedBox(
              height: 30,
            ),
            isLoading == false ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: const text_widget(
                    color: 0xff000000,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                    font: "Lato",
                    fontSize: 15,
                    text: "Forgot password",
                  ),
                  onTap: () {
                    Get.to(forgot_password());
                  },
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
                  onTap: () {
                    Get.to(signup_page());
                  },
                ),
              ],
            ) : const SizedBox(),
            const SizedBox(
              height: 30,
            ),
            isLoading == false ? InkWell(
              child: const button_widgets(color: 0xffe1163c,
                  height: 60,
                  width: 150,
                  radius: 10,
                  borderColor: 0xffFF9C27B0,
                  widget: Center(
                    child: text_widget(
                      color: 0xffFFFFFF,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                      font: "Lato",
                      fontSize: 20,
                      text: "Login",
                    ),
                  )),
              onTap: () {
                if (_formKey.currentState!.saveAndValidate()&&_formKey.currentState!.value['password'].toString().length>6) {
                  setState(() {
                    isLoading = true;
                  });
                  print("${_formKey.currentState!.value['name']}=---${_formKey
                      .currentState!.value['password']}");
                  /*login logic*/
                  api_calls api = api_calls(context);
                  api.loginUser(_formKey.currentState!.value["name"],
                      _formKey.currentState!.value["password"], () {
                        /*successfulFunction*/
                        printError(info: "Successful login");
                        Fluttertoast.showToast(
                            msg: "Successful login",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.purple,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                        setState(() {
                          isLoading = false;
                        });
                        getCurrentLocation();
                      }, () {
                        /*failedFunction*/
                        printError(info: "Unsuccessful login");
                        Fluttertoast.showToast(
                            msg: "Unsuccessful login",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.purple,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                        setState(() {
                          isLoading = false;
                        });
                      }, () {
                        /*wrongCredentialsFunction*/
                        printError(info: "Wrong credentials");
                        setState(() {
                          isLoading = false;
                        });
                        Fluttertoast.showToast(
                            msg: "Wrong credentials",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.purple,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }, () {
                        /*user not found*/
                        printError(info: "Wrong credentials");
                        setState(() {
                          isLoading = false;
                        });
                        Fluttertoast.showToast(
                            msg: "Create an account. User not found",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      });
                }
                else{
                  Fluttertoast.showToast(
                      msg: "Password must be more than 6",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.purple,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }
              },
            ) : const CircularProgressIndicator(
              backgroundColor: Color(0xfff1f1f1),
              color: Colors.purple,
            ),

          ],
        ),
      ),
    );
  }

}
