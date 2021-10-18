import 'package:bnbs_project/functions/api_calls.dart';
import 'package:bnbs_project/pages/dashboard_page.dart';
import 'package:bnbs_project/widgets/button_widgets.dart';
import 'package:bnbs_project/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:lottie/lottie.dart';

class payment_section extends StatefulWidget{
  final String state;

  const payment_section({Key? key, required this.state}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _payment_sectionState();
  }

}

class _payment_sectionState extends State<payment_section> {
  List<dynamic>paymentMethod=[
    {
      "value":"m-pesa",
      "name":"Mpesa services",
    },
    {
      "value":"google-pay",
      "name":"Google pay",
    },
    {
      "value":"other-payment",
      "name":"Other methods...(card,other mno, etc)",
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
            Lottie.asset('assets/animations/payment.json',
                width: 300,
                height: 300),
            const text_widget(
              color: 0xffFF9C27B0,
              fontWeight: FontWeight.w800,
              textAlign: TextAlign.center,
              font: "Lato",
              fontSize: 24,
              text: "Final Step Payment",
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: text_widget(
                color: 0xff707070,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                font: "Lato",
                fontSize: 15,
                text: "A full payment is required to complete the process. A receipt will be shared to your email.",
              ),
            ),
            const SizedBox(height: 10,),
            FormBuilder(
              child: Column(
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
                          text: "Pick a payment method:",
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
                        hint: Text('Pick a mode of payment',style: GoogleFonts.getFont("Lato",
                            color: Colors.grey,
                            fontSize: 15),),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context)
                        ]),

                        items:paymentMethod
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
            ),
            const SizedBox(height: 20,),
            InkWell(
              child: const button_widgets(color:0xffe1163c,height: 60,width: 350,radius: 10,borderColor: 0xffFF9C27B0,widget:Center(
                child:text_widget(
                  color: 0xffFFFFFF,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 20,
                  text: "Make payment",
                ),
              )),
              onTap: (){
                api_calls api = api_calls(context);
                api.addItem('', '', '', 'null', '', '', 'active');
                getCurrentLocation();
              },
            ),
          ],
        ),
      ),
    );
  }
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
}