import 'package:bnbs_project/functions/api_calls.dart';
import 'package:bnbs_project/pages/walkthrough_page.dart';
import 'package:bnbs_project/widgets/button_widgets.dart';
import 'package:bnbs_project/widgets/formbuildtextfield.dart';
import 'package:bnbs_project/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class forgot_password extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _forgotpasswordState();
  }
}

class _forgotpasswordState extends State<forgot_password> {
  final _formKey = GlobalKey<FormBuilderState>();
  api_calls api = api_calls();

  @override
  Widget build(BuildContext context) {

                   /*
                    MyTextButton(
                        buttonName: 'Send Request',
                        onTap: (){
                          if(_formKey.currentState!.saveAndValidate()){
                            api_calls api = api_calls(context);
                            api.sendpasswordresetemail(_formKey.currentState!.value["email"]);
                          }
                          Get.to(const signin_page());
                        },
                     ;*/
    return Scaffold(
      backgroundColor: Colors.white,
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
                height: 140,
              fit: BoxFit.fill,),
              const text_widget(
                color: 0xff000000,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
                font: "Lato",
                fontSize: 20,
                text: "Forgot password?",
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: text_widget(
                  color: 0xff707070,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 14,
                  text: "Reset password to login into account to find a house and history",
                ),
              ),
              FormBuilder(
                child: Column(
                    children: [
                      formbuildtextfield(height: 50,color: 0xff000000,hintText:"sample@gmail.com" ,attribute: "name",
                          dividerColor:0xffFFFFFF ,errorText:"Enter an email first" ,font: "Lato",keybordType: TextInputType.emailAddress,fontWeight:FontWeight.w400 ,fontSize: 15.0,
                          formType: "text",dropDownList: [],
                        iconButton: IconButton(
                            icon: Icon(Icons.email),
                            onPressed: () {}), showPassword: false,),
                    ]
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              button_widgets(color:0xffFF9C27B0,height: 50,width: 150,radius: 100,borderColor: 0xffFF9C27B0,widget:Center(
                child: InkWell(
                  child: const text_widget(
                    color: 0xffFFFFFF,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    font: "Lato",
                    fontSize: 14,
                    text: "Send email",
                  ),
                  onTap: (){
                    if(_formKey.currentState!.saveAndValidate()){

                      api.sendpasswordresetemail(_formKey.currentState!.value["email"],(){

                      });
                    }
                    Get.to(walkthrough_page());
                  },
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}