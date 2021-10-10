import 'package:bnbs_project/widgets/button_widgets.dart';
import 'package:bnbs_project/widgets/formbuildtextfield.dart';
import 'package:bnbs_project/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class signup_page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _signup_pageState();
  }

}

class _signup_pageState extends State<signup_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(),
              Image.asset("assets/images/login.png",
                width: 200,
                height: 140,),
              const text_widget(
                color: 0xff000000,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
                font: "Lato",
                fontSize: 20,
                text: "Create your account",
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: text_widget(
                  color: 0xff707070,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 14,
                  text: "Create an account to find a house and history",
                ),
              ),
              FormBuilder(
                child: Column(
                    children: const [
                      formbuildtextfield(height: 50,color: 0xff000000,hintText:"sample@email.com" ,attribute: "name",
                        dividerColor:0xffFFFFFF ,errorText:"Enter an email first" ,font: "Lato",keybordType: TextInputType.emailAddress,fontWeight:FontWeight.w400 ,fontSize: 15.0,
                          formType: "text",dropDownList: []),
                      SizedBox(
                        height: 16,
                      ),
                      formbuildtextfield(height: 50,color: 0xff000000,hintText:"***********" ,attribute: "password",
                        dividerColor:0xffFFFFFF ,errorText:"Enter a password first" ,font: "Lato",keybordType: TextInputType.text,fontWeight:FontWeight.w400 ,fontSize: 15.0,
                          formType: "text",dropDownList: []),

                    ]
                ),
              ),
              const SizedBox(
                height: 16,
              ),
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
              const SizedBox(
                height: 16,
              ),
              const button_widgets(color:0xffFF9C27B0,height: 50,width: 150,radius: 100,borderColor: 0xffFF9C27B0,widget:Center(
                child: text_widget(
                  color: 0xffFFFFFF,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 14,
                  text: "Create account",
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}