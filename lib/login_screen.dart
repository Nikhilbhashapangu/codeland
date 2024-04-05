import 'package:codeland/image_upload.dart';
import 'package:codeland/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.fromLTRB(5.w, 0, 5.w, 10.w),
        backgroundColor: const Color(0xffF68326),
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                    height: 70.w,
                    width: 70.w,
                    child: Image.asset("assets/images/image.png")),
                ReusableText(
                  t: "Biomedical Kiosk",
                  c: Colors.black,
                  s: 16.sp,
                  isBold: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 5.w),
                    ReusableText(
                        t: "for HCE's", c: const Color(0xffFF7709), s: 11.sp),
                  ],
                ),
                SizedBox(height: 2.h),
                ReusableTextField(
                  textEditingController: username,
                  width: 90.w,
                  height: 8.h,
                  hintText: "Username",
                ),
                ReusableTextField(
                  textEditingController: password,
                  width: 90.w,
                  height: 8.h,
                  hintText: "Password",
                  isPass: true,
                ),
                SizedBox(height: 2.h),
                ReusableButton(
                    height: 7.h,
                    borderRadius: 2.w,
                    fontColor: Colors.white,
                    color: const Color(0xffFF7709),
                    label: "Login",
                    onPressed: () {
                      if (username.text.isEmpty || password.text.isEmpty) {
                        showSnackBar(
                            "Please enter both the username and password");
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ImageUploadScren()), // Your target page
                        );
                      }
                    },
                    width: 90.w,
                    fontsize: 15.sp),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 9.h),
                  child: SizedBox(
                      child: Column(children: [
                    Row(
                      children: [
                        ReusableText(
                            t: "For Assistance & Login Details Contact: ",
                            c: Colors.black.withOpacity(0.8),
                            s: 11.sp),
                      ],
                    ),
                    Row(
                      children: [
                        ReusableText(
                            t: "English, Kannada & Telugu  : ",
                            c: Colors.black.withOpacity(0.8),
                            s: 11.sp),
                        ReusableText(
                            t: "7406333800",
                            c: const Color(0xffF68326),
                            isUnderline: true,
                            s: 11.sp)
                      ],
                    ),
                    Row(
                      children: [
                        ReusableText(
                            t: "English, Kannada & Hindi : ",
                            c: Colors.black.withOpacity(0.8),
                            s: 12.sp),
                        ReusableText(
                            t: "9071386515",
                            c: const Color(0xffF68326),
                            isUnderline: true,
                            s: 12.sp)
                      ],
                    ),
                  ])),
                ),
                ReusableText(
                    t: "v1.7 © 2023, Codeland Infosolutions Pvt Ltd.",
                    c: Colors.black,
                    s: 12.sp)
              ],
            ),
          ),
        ),
      ));
    });
  }
}
