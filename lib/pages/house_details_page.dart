import 'package:bnbs_project/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class house_details_page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _house_details_pageState();
  }

}

class _house_details_pageState extends State<house_details_page> {
  bool showMoreDetails = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: Stack(
                  children: [
                    Container(
                      width: Get.width,
                      height: 200,
                      color: const Color(0xfff1f1f1),
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Expanded(child: SizedBox()),
                          FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: Colors.purple,
                            child: const Icon(Icons.account_circle_outlined),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                height: 240,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                            child: text_widget(
                              color: 0xff000000,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.start,
                              font: "Lato",
                              fontSize: 16,
                              text: "Username here",
                            )),
                        showMoreDetails==false?InkWell(child: const Icon(Icons.more_vert_rounded,color: Colors.purple,),
                          onTap: (){
                            setState(() {
                              showMoreDetails=true;
                            });
                          },):InkWell(
                          child: Container(
                            color: Color(0xffF1F1F1),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: text_widget(
                                color: 0xffFF9C27B0,
                                fontWeight: FontWeight.w700,
                                textAlign: TextAlign.start,
                                font: "Lato",
                                fontSize: 14,
                                text: "Edit profile",
                              ),
                            ),
                          ),
                          onTap: (){

                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Expanded(
                            child: text_widget(
                              color: 0xff707070,
                              fontWeight: FontWeight.w700,
                              textAlign: TextAlign.start,
                              font: "Lato",
                              fontSize: 14,
                              text: "email@gmail.com",
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              showMoreDetails == false?InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                          child: text_widget(
                            color: 0xff707070,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.start,
                            font: "Lato",
                            fontSize: 14,
                            text:
                            "Usually, a list of items. Note that unless isScrollControlled is set to true, the body of a FloatingSearchBar must not have an unbounded height meaning that shrinkWrap should be set to true on all Scrollables.",
                          )),
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    showMoreDetails = true;
                  });
                },
              ): moreDetailsContainer(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  color: Color(0xff707070),
                ),
              ),
            ],
          ),
          physics: const BouncingScrollPhysics(),
        ),
      ),
    );
  }
  Widget moreDetailsContainer() {
    return InkWell(
      child: Container(
        width: Get.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                      child: text_widget(
                        color: 0xff707070,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.start,
                        font: "Lato",
                        fontSize: 14,
                        text:
                        "Usually, a list of items. Note that unless isScrollControlled is set to true, the body of a FloatingSearchBar must not have an unbounded height meaning that shrinkWrap should be set to true on all Scrollables.",
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                      child: text_widget(
                        color: 0xff707070,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.start,
                        font: "Lato",
                        fontSize: 14,
                        text: "Phone No: 0712345678",
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                      child: text_widget(
                        color: 0xff707070,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.start,
                        font: "Lato",
                        fontSize: 14,
                        text: "Location",
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                      child: text_widget(
                        color: 0xff707070,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.start,
                        font: "Lato",
                        fontSize: 14,
                        text: "Started date",
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                      child: text_widget(
                        color: 0xff707070,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.start,
                        font: "Lato",
                        fontSize: 14,
                        text: "UserID:8VuLC1ugUBa7xPzEyKLhMqvmLN62",
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                      child: text_widget(
                        color: 0xff000000,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                        font: "Lato",
                        fontSize: 14,
                        text: "Coins: 1200Sp",
                      )),
                  Expanded(
                      child: text_widget(
                        color: 0xffFF9C27B0,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                        font: "Lato",
                        fontSize: 14,
                        text: "Position: Elite",
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          showMoreDetails = false;
        });
      },
    );
  }


}