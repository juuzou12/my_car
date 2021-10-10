import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class text_widget extends StatelessWidget {
  final String text, font;
  final int color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const text_widget(
      {Key? key,
      required this.text,
      required this.font,
      required this.color,
      required this.fontSize,
      required this.fontWeight,
      required this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.getFont(font,
        color: Color(color),
        fontSize: fontSize,
        fontWeight: fontWeight,),
    );
  }
}
