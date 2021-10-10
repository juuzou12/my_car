import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';

class formbuildtextfield extends StatefulWidget{
  final String attribute, hintText, font, errorText;
  final int color, dividerColor;
  final double fontSize, height;
  final FontWeight fontWeight;
  final TextInputType keybordType;
  final String formType;
  final List dropDownList;

  const formbuildtextfield({Key? key, required this.attribute, required this.hintText, required this.font, required this.errorText, required this.color, required this.dividerColor, required this.fontSize, required this.height, required this.fontWeight, required this.keybordType, required this.formType, required this.dropDownList}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _formbuildtextfieldState();
  }

}

class _formbuildtextfieldState extends State<formbuildtextfield> {
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
          name: widget.attribute,
          style: GoogleFonts.getFont(
            widget.font,
            color: Color(widget.color),
            fontSize: widget.hintText == "Series title"
                ?16:widget.fontSize,
            fontWeight: widget.fontWeight,
          ),
          obscureText:  widget.hintText == "***********" ? true : false,
          keyboardType:  widget.keybordType,
          textCapitalization: TextCapitalization.none,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context)
          ]),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: GoogleFonts.getFont(
              widget.font,
              color: Color(widget.color),
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
            ),
          ),
        )

      ),
    );
  }
}