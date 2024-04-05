import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ======================= Text ====================================

class ReusableText extends StatefulWidget {
  final String t;
  final Color c;
  final double s;
  final bool isBold;
  final bool isUnderline;
  const ReusableText(
      {Key? key,
      required this.t,
      required this.c,
      required this.s,
      this.isUnderline = false,
      this.isBold = false})
      : super(key: key);

  @override
  State<ReusableText> createState() => _ReusableTextState();
}

class _ReusableTextState extends State<ReusableText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.ellipsis,
      widget.t,
      style: TextStyle(
          decoration: widget.isUnderline
              ? TextDecoration.underline
              : TextDecoration.none,
          decorationColor: widget.c,
          color: widget.c,
          fontSize: widget.s,
          fontWeight: widget.isBold ? FontWeight.bold : FontWeight.normal),
    );
  }
}

// ------------------------ Text Form Field-------------------------------------

class ReusableTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;

  final double radius;
  final double height;
  final double width;
  const ReusableTextField({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    required this.width,
    required this.height,
    this.radius = 8,
    required this.hintText,
  }) : super(key: key);

  @override
  State<ReusableTextField> createState() => _ReusableTextFieldState();
}

class _ReusableTextFieldState extends State<ReusableTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(widget.radius)),
      child: TextFormField(
        cursorColor: Colors.black,
        style: const TextStyle(color: Colors.black),
        controller: widget.textEditingController,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle:
              TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 11.sp),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 2, color: Color(0xffFF7709)), //<-- SEE HERE
            borderRadius: BorderRadius.circular(widget.radius),
          ),
          contentPadding: const EdgeInsets.all(8),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
            borderRadius: BorderRadius.circular(widget.radius),
          ),
        ),
        obscureText: widget.isPass,
      ),
    );
  }
}

/// Reusable button widget that can be used in different parts of the app
class ReusableButton extends StatefulWidget {
  final double height;
  final double borderRadius;
  final Color color;
  final String label;
  final Function() onPressed;
  final double width;
  final double fontsize;
  final Color fontColor;

  const ReusableButton(
      {super.key,
      required this.height,
      required this.borderRadius,
      required this.color,
      required this.label,
      required this.onPressed,
      required this.width,
      this.fontColor = Colors.black,
      required this.fontsize});

  @override
  State<ReusableButton> createState() => _ReusableButtonState();
}

class _ReusableButtonState extends State<ReusableButton> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return SizedBox(
        height: widget.height,
        width: widget.width,
        child: (ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
              elevation: 1.w,
              shadowColor: widget.color,
              backgroundColor: widget.color,
              alignment: Alignment.center,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius))),
          child: Text(
            widget.label,
            style: TextStyle(
                fontSize: widget.fontsize,
                fontWeight: FontWeight.w400,
                color: widget.fontColor),
          ),
        )),
      );
    });
  }
}
