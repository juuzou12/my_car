import 'package:bnbs_project/functions/api_calls.dart';
import 'package:bnbs_project/pages/walkthrough_page.dart';
import 'package:bnbs_project/widgets/button_widgets.dart';
import 'package:bnbs_project/widgets/formbuildtextfield.dart';
import 'package:bnbs_project/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class signup_page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _signup_pageState();
  }

}

class _signup_pageState extends State<signup_page> {
  /*TODO...change the ui of signup, navigation after success, customized loading,change color toast, length of password, show password icon*/
  bool isLoading = false;
  bool passwordVisible = false;

  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: registerScreen(),
        )
    );
  }

  /*register page screen*/
  Widget registerScreen(){
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
                  text: "Register to BnBs",
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
                  text: "Create your account to find a house and history",
                ),
              ],
            ),
            const SizedBox(height: 40,),
            FormBuilder(
              child: Column(
                  children: [
                    formbuildtextfield(height: 50,color: 0xff000000,hintText:"Enter your email" ,attribute: "name",
                      dividerColor:0xffFFFFFF ,errorText:"Enter an email first" ,font: "Lato",keybordType: TextInputType.emailAddress,fontWeight:FontWeight.w400 ,fontSize: 15.0,
                      formType: "text",dropDownList: [],
                  iconButton: IconButton(
                      icon: Icon(Icons.email),
                      onPressed: () {}),
                    ),
                     const SizedBox(
                      height: 16,
                    ),
                    formbuildtextfield(height: 50,color: 0xff000000,hintText:"***********" ,attribute: "password",
                        dividerColor:0xffFFFFFF ,errorText:"Enter a password first" ,font: "Lato",keybordType: TextInputType.text,fontWeight:FontWeight.w400 ,fontSize: 15.0,
                        formType: "text",dropDownList: [],
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
            isLoading==false?Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:  [
                InkWell(
                  child: const text_widget(
                    color: 0xffFF9C27B0,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                    font: "Lato",
                    fontSize: 15,
                    text: "Login to account",
                  ),
                  onTap: (){
                    Get.back();
                  },
                ),
              ],
            ):const SizedBox(),
            const SizedBox(
              height: 30,
            ),
            isLoading==false?InkWell(
              child: const button_widgets(color:0xffe1163c,height: 60,width: 150,radius: 10,borderColor: 0xffFF9C27B0,widget:Center(
                child: text_widget(
                  color: 0xffFFFFFF,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 20,
                  text: "Register",
                ),
              )),
              onTap: (){
                print('---${_formKey.currentState!.value['name']}--${_formKey.currentState!.value['password']}');
                if(_formKey.currentState!.saveAndValidate()){
                  setState(() {
                    isLoading=true;
                  });
                  print(_formKey);
                  /*logic for register*/
                  api_calls api = api_calls(context);
                  api.createUser(_formKey.currentState!.value["name"], _formKey.currentState!.value["password"], (){
                    /*successful*/
                    api.addUser(_formKey.currentState!.value["name"], _formKey.currentState!.value["password"], (){
                      printError(info: "Registered successfully!!");
                      Fluttertoast.showToast(
                          msg: "Registered successfully!!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.purple,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      setState(() {
                        isLoading=false;
                      });
                      Get.back();
                    }, (){
                      /*Failed Function To addUser*/
                      printError(info: "Failed to register. Try again!");
                      Fluttertoast.showToast(
                          msg: "Failed to register. Try again!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.purple,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      setState(() {
                        isLoading=false;
                      });
                    });}, () {
                    /*failedFunction to createUser*/
                    printError(info: "Oops! Something went wrong. Try again!");
                    Fluttertoast.showToast(
                        msg: "Oops! Something went wrong. Try again!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.purple,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                    setState(() {
                      isLoading=false;
                    });
                  });
                }
              },
            ):const CircularProgressIndicator(
              backgroundColor: Color(0xfff1f1f1),
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}