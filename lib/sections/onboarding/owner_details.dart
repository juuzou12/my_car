import 'package:bnbs_project/functions/api_calls.dart';
import 'package:bnbs_project/sections/find_location/payment_section.dart';
import 'package:bnbs_project/widgets/button_widgets.dart';
import 'package:bnbs_project/widgets/formbuildtextfield.dart';
import 'package:bnbs_project/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
class owner_details extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _owner_detailsStae();
  }

}

class _owner_detailsStae extends State<owner_details> {
  api_calls api = api_calls();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
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
              const SizedBox(height: 50,),
              Lottie.asset('assets/animations/owner.json',
                  width: 300,
                  fit: BoxFit.fitWidth,
                  animate: true ,reverse: false,addRepaintBoundary: true),
              const text_widget(
                color: 0xffFF9C27B0,
                fontWeight: FontWeight.w800,
                textAlign: TextAlign.center,
                font: "Lato",
                fontSize: 20,
                text: "Owner's details",
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: text_widget(
                  color: 0xff707070,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 15,
                  text: "This involves legit documents since they will be verified at the end",
                ),
              ),
              const SizedBox(height: 20,),
              FormBuilder(
                child: Column(
                    children: [
                      formbuildtextfield(height: 50,color: 0xff000000,hintText:"Owners Name" ,attribute: "name",
                        dividerColor:0xffFFFFFF ,errorText:"Owners Name" ,font: "Lato",keybordType: TextInputType.emailAddress,fontWeight:FontWeight.w400 ,fontSize: 15.0,
                        formType: "text",dropDownList: [],
                        iconButton: IconButton(
                            icon: Icon(Icons.person),
                            onPressed: () {}), showPassword: false,),
                      const SizedBox(
                        height: 16,
                      ),
                      formbuildtextfield(height: 50,color: 0xff000000,hintText:"Owners Email" ,attribute: "password",
                          dividerColor:0xffFFFFFF ,errorText:"Enter Owners Email" ,font: "Lato",keybordType: TextInputType.text,fontWeight:FontWeight.w400 ,fontSize: 15.0,
                          formType: "text",dropDownList: [],
                        iconButton: IconButton(
                            icon: Icon(Icons.email_outlined),
                            onPressed: () {}), showPassword: false,),
                      const SizedBox(
                        height: 16,
                      ),
                      formbuildtextfield(height: 50,color: 0xff000000,hintText:"Owners Number" ,attribute: "password",
                          dividerColor:0xffFFFFFF ,errorText:"Enter Owners Number" ,font: "Lato",keybordType: TextInputType.number,fontWeight:FontWeight.w400 ,fontSize: 15.0,
                          formType: "text",dropDownList: [],
                        iconButton: IconButton(
                            icon: Icon(Icons.phone),
                            onPressed: () {}), showPassword: false,),
                    ]
                ),
              ),
              const SizedBox(height: 50,),
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

                  api.addHome('', '', '');
                  Get.to(const payment_section(state: "addHomePayment", company: '', people: '', attendance: '', date: '', StandAlone: 'apartment',));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}