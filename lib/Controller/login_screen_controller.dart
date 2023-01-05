import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Screens/image_picker_screen.dart';
class LoginScreenController extends GetxController{
  GlobalKey<FormState> formkey=GlobalKey();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();

  String hintemailtext="Enter Your Email";
  String hintpasswordtext="Enter Your Password";
  String labelemailtext="Email...";
  String labelpasswordText="Password....";
  File? ImageFile;

  String? validateemail(String? input) {
    if (input == null || input.isEmpty) {
      return "Email is required";
    }else
    if ((!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(input))) {
      return 'Please Enter Correct Email with @';
    }else if(!GetUtils.isEmail(input)){
      return "enter valid email";
    }
    return null;
  }


  String? validatepassword(String? input) {
    if (input == null || input.isEmpty) {
      return "Password is required";
    } else
    if ((!RegExp(r'^(?=.*?[A-Z]{1})(?=.*?[a-z])(?=.*?[0-9]{3})(?=.*?[!@#\$&*~]{1}).{8,}$').hasMatch(input))) {
      return 'Please Enter valid password';
    }
    return null;
  }
  onloginPressed() {
      Get.to(ProfileScreen());
      Get.defaultDialog(title: "Status", content: Text("Successfull login"));
      Get.snackbar("Login Status", "Successfully Logged in",
          backgroundColor: Colors.pink, colorText: Colors.white);
    }
      // Get.snackbar("Login Status", "Successfully Logged in",
      //     backgroundColor: Colors.pink, colorText: Colors.white);
      // Get.defaultDialog(title: "Status", content: Text("Successfull login"));
  // }
}