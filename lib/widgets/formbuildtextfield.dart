import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';

class formbuildtextfield extends StatelessWidget {

  const formbuildtextfield({Key? key, required this.attribute, required this.hintText, required this.font, required this.errorText, required this.color, required this.dividerColor, required this.fontSize, required this.height, required this.fontWeight, required this.keybordType, required this.formType, required this.dropDownList, required this.iconButton}) : super(key: key);

  final String attribute, hintText, font, errorText;
  final int color, dividerColor;
  final double fontSize, height;
  final FontWeight fontWeight;
  final TextInputType keybordType;
  final String formType;
  final List dropDownList;
  final IconButton iconButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xffF1F1F1)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FormBuilderTextField(
          name: attribute,
          style: GoogleFonts.getFont(
            font,
            color: Color(color),
            fontSize: hintText == "Series title"
                ?16:fontSize,
            fontWeight: fontWeight,
          ),
          obscureText:  hintText == "***********" ? true : false,
          keyboardType:  keybordType,
          textCapitalization: TextCapitalization.none,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context),
            ]),
          decoration: InputDecoration(
            suffixIcon: iconButton,
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: GoogleFonts.getFont(
              font,
              color: Color(color),
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        )

      ),
    );
  }
}
