import 'package:bnbs_project/widgets/button_widgets.dart';
import 'package:bnbs_project/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'attendance.dart';
import 'locating_place.dart';
import 'payment_section.dart';

class duration_section extends StatefulWidget{
  final String StandAlone;

  const duration_section({Key? key, required this.StandAlone}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _duration_sectionState();
  }

}

class _duration_sectionState extends State<duration_section> {
  List<dynamic> getSubject = [{
    "value":"party",
    "name":"For a party",
  }, {
    "value":"relaxing",
    "name":"For a Get-away",
  },{
    "value":"family",
    "name":"Family functions",
  },
  ];

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
            Lottie.asset('assets/animations/house.json',
                width: 300,
                height: 250),
            const text_widget(
              color: 0xffFF9C27B0,
              fontWeight: FontWeight.w800,
              textAlign: TextAlign.center,
              font: "Lato",
              fontSize: 24,
              text: "Duration & Purpose",
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: text_widget(
                color: 0xff707070,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                font: "Lato",
                fontSize: 15,
                text: "Provide the duration of how long your stay is",
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
                                text: "Purpose for attendance",
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
                              hint: Text('Pick purpose',style: GoogleFonts.getFont("Lato",
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
                                text: "Enter date for attendance:",
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FormBuilderDateRangePicker(
                              name: 'date_range',
                              firstDate: DateTime(1970),
                              lastDate: DateTime(2030),
                              onChanged: (value){

                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(
                                        Radius.circular(6.0))),                                labelText: 'Date Range',
                                helperText: 'Helper text',
                                hintText: 'Hint text',
                              ),
                            ),
                          ),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Color(0xffF1F1F1)
                          ),
                        ),
                      ],
                    ),
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
                Get.to(const attendance(StandAlone: 'apartment', attendace: "", date: '',));

              },
            ),
          ],
        ),
      ),
    );
  }
}