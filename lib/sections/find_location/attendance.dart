import 'package:bnbs_project/widgets/button_widgets.dart';
import 'package:bnbs_project/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'duration_section.dart';
import 'locating_place.dart';

class attendance extends StatefulWidget{
  final String houseType;

  const attendance({Key? key, required this.houseType}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _attendanceState();
  }

}

class _attendanceState extends State<attendance> {
  List<dynamic> getSubject = [{
    "value":"yes",
    "name":"Yes I do",
  }, {
    "value":"no",
    "name":"No I don't",
  },];

  List<dynamic> getNumberOfAttendance = [{
    "value":"2",
    "name":"2",
  }, {
    "value":"4",
    "name":"4",
  }, {
    "value":"5",
    "name":"5",
  }, {
    "value":"6",
    "name":"6",
  }, {
    "value":"7",
    "name":"7",
  }, {
    "value":"8",
    "name":"8",
  }, {
    "value":"9",
    "name":"9",
  }, {
    "value":"10",
    "name":"10",
  }, {
    "value":"11",
    "name":"11",
  }, {
    "value":"12",
    "name":"12",
  }, {
    "value":"13",
    "name":"13",
  }, {
    "value":"14",
    "name":"14",
  },
  ];
  var determiner="no";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            Lottie.asset('assets/animations/people.json',
                width: 300,
                height: 300),
            const text_widget(
              color: 0xffFF9C27B0,
              fontWeight: FontWeight.w800,
              textAlign: TextAlign.center,
              font: "Lato",
              fontSize: 24,
              text: "Guests attending",
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: text_widget(
                color: 0xff707070,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                font: "Lato",
                fontSize: 15,
                text: "This number will range between 6-14 people and it is determined by the type of house you picked ",
              ),
            ),
            const SizedBox(height: 10,),
            FormBuilder(
              child: Column(
                  children:  [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children:  const [
                              text_widget(
                                color: 0xff000000,
                                fontWeight: FontWeight.w800,
                                textAlign: TextAlign.center,
                                font: "Lato",
                                fontSize: 15,
                                text: "Do you have company with you",
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FormBuilderDropdown(
                              name: "attendance",
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(
                                        Radius.circular(6.0))),
                              ),
                              // initialValue: 'Male',
                              hint: Text('Do you have company with you',style: GoogleFonts.getFont("Lato",
                                  color: Colors.grey,
                                  fontSize: 15),),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context)
                              ]),

                              items:getSubject
                                  .map((e) => DropdownMenuItem(
                                value: e['value'],
                                child: Text(e['name']
                                  ,style: GoogleFonts.getFont("Poppins",
                                      color: Colors.black,
                                      fontSize: 15),),
                              )).toList(),
                              onChanged: (value){
                                setState(() {
                                  determiner=value.toString();
                                });
                              },
                            ),
                          ),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Color(0xffF1F1F1)
                          ),
                        ),
                      ],
                    ),
                    determiner=='yes'?Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children:  const [
                              text_widget(
                                color: 0xff000000,
                                fontWeight: FontWeight.w800,
                                textAlign: TextAlign.center,
                                font: "Lato",
                                fontSize: 15,
                                text: "What is the total number of people attending",
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FormBuilderDropdown(
                              name: "attendanceNo",
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(
                                        Radius.circular(6.0))),
                              ),
                              // initialValue: 'Male',
                              hint: Text('No of people',style: GoogleFonts.getFont("Lato",
                                  color: Colors.grey,
                                  fontSize: 15),),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context)
                              ]),

                              items:getNumberOfAttendance
                                  .map((e) => DropdownMenuItem(
                                value: e['value'],
                                child: Text(e['name']
                                  ,style: GoogleFonts.getFont("Poppins",
                                      color: Colors.black,
                                      fontSize: 15),),
                              )).toList(),
                              onChanged: (_){
                                setState(() {
                                });
                              },
                            ),
                          ),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Color(0xffF1F1F1)
                          ),
                        ),
                      ],
                    ):const SizedBox(),
                  ]
              ),
            ),
            const SizedBox(height: 10,),
            InkWell(
              child: const button_widgets(color:0xffe1163c,height: 60,width: 350,radius: 10,borderColor: 0xffFF9C27B0,widget:Center(
                child:text_widget(
                  color: 0xffFFFFFF,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 20,
                  text: "Next",
                ),
              )),
              onTap: (){
                Get.to(locating_place());
              },
            ),
            const Expanded(child: SizedBox(height: 50,)),
          ],
        ),
      ),
    );
  }
}