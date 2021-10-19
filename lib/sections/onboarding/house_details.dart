import 'package:bnbs_project/widgets/button_widgets.dart';
import 'package:bnbs_project/widgets/formbuildtextfield.dart';
import 'package:bnbs_project/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'owner_details.dart';
class house_details extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _house_detailsState();
  }

}

class _house_detailsState extends State<house_details> {
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
              Lottie.asset('assets/animations/home.json',
                  width: 300,
                  fit: BoxFit.fitWidth,
                  animate: true ,reverse: false,addRepaintBoundary: true),
              const text_widget(
                color: 0xffFF9C27B0,
                fontWeight: FontWeight.w800,
                textAlign: TextAlign.center,
                font: "Lato",
                fontSize: 20,
                text: "Home details",
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: text_widget(
                  color: 0xff707070,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 15,
                  text: "This involves location,building name, house no.",
                ),
              ),
              const SizedBox(height: 20,),
              FormBuilder(
                child: Column(
                    children: [
                      formbuildtextfield(height: 50,color: 0xff000000,hintText:"Enter building name" ,attribute: "name",
                        dividerColor:0xffFFFFFF ,errorText:"Enter building name" ,font: "Lato",keybordType: TextInputType.name,fontWeight:FontWeight.w400 ,fontSize: 15.0,
                        formType: "text",dropDownList: [],
                        iconButton: IconButton(
                            icon: Icon(Icons.person),
                            onPressed: () {}),),
                      const SizedBox(
                        height: 16,
                      ),
                      formbuildtextfield(height: 50,color: 0xff000000,hintText:"Enter house number" ,attribute: "password",
                          dividerColor:0xffFFFFFF ,errorText:"Enter house number" ,font: "Lato",keybordType: TextInputType.text,fontWeight:FontWeight.w400 ,fontSize: 15.0,
                          formType: "text",dropDownList: [],
                        iconButton: IconButton(
                            icon: Icon(Icons.phone),
                            onPressed: () {}),),
                      const SizedBox(
                        height: 16,
                      ),
                      formbuildtextfield(height: 50,color: 0xff000000,hintText:"Business Number" ,attribute: "password",
                          dividerColor:0xffFFFFFF ,errorText:"Enter Business Number" ,font: "Lato",keybordType: TextInputType.number,fontWeight:FontWeight.w400 ,fontSize: 15.0,
                          formType: "text",dropDownList: [],
                        iconButton: IconButton(
                            icon: Icon(Icons.phone),
                            onPressed: () {}),),
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
                  Get.to(owner_details());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}