import 'package:codeland/image_picker.dart';
import 'package:codeland/login_screen.dart';
import 'package:codeland/reusable_widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class ImageUploadScren extends StatefulWidget {
  const ImageUploadScren({super.key});

  @override
  State<ImageUploadScren> createState() => _ImageUploadScrenState();
}

class _ImageUploadScrenState extends State<ImageUploadScren> {
  Uint8List? image;
  Uint8List? imageData;
  bool showImage = false;
  selectImage() async {
    Uint8List imageData = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      image = imageData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
          body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              ReusableText(t: "Upload an image", c: Colors.black, s: 13.sp),
              SizedBox(height: 2.h),
              DottedBorder(
                  color: Colors.black.withOpacity(0.3),
                  dashPattern: const [8, 4],
                  child: image != null
                      ? showImage
                          ? Container(
                              width: 80.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: MemoryImage(image!),
                                      fit: BoxFit.fitWidth)))
                          : SizedBox(
                              width: 80.w,
                              height: 60.h,
                              child: Center(
                                child: ReusableText(
                                    t: "Image Uploaded. Click View to see the image",
                                    c: Colors.black,
                                    s: 12.sp),
                              ))
                      : SizedBox(
                          width: 80.w,
                          height: 60.h,
                          child: Icon(Icons.image,
                              size: 22.w, color: Colors.black.withOpacity(0.4)),
                        )),
              SizedBox(height: 6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ReusableButton(
                      height: 5.5.h,
                      borderRadius: 2.w,
                      color: const Color(0xffFF7709),
                      label: "Upload",
                      fontColor: Colors.white,
                      onPressed: () {
                        selectImage();
                        setState(() {
                          showImage = false;
                        });
                      },
                      width: 30.w,
                      fontsize: 15.sp),
                  ReusableButton(
                      height: 5.5.h,
                      borderRadius: 2.w,
                      color: const Color(0xffD3D3D6),
                      label: "Viewwwwsss",
                      onPressed: () {
                        setState(() {
                          showImage = true;
                        });
                      },
                      width: 30.w,
                      fontsize: 15.sp),
                ],
              ),
              SizedBox(height: 2.h),
              TextButton(
                  onPressed: () {
                    setState(() {
                      image = null;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const LoginScreen()), // Your target page
                      );
                    });
                  },
                  child: ReusableText(
                      t: "Logout",
                      c: const Color(0xffF5862A),
                      isBold: true,
                      s: 12.sp))
            ]),
          ),
        ),
      ));
    });
  }
}
