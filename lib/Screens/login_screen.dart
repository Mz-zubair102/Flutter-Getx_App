import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:getx/Controller/login_screen_controller.dart';
import 'package:get/get.dart';
import '../Widgets/text_button_widget.dart';
import '../Widgets/text_input_field.dart';
import 'image_picker_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginScreenController>(
        init: LoginScreenController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.cyan,
              title: Text("Login Screen"),
            ),
            body: Form(
              key: controller.formkey,
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 8.0, right: 8.0, top: 20.0, bottom: 8.0),
                    child: Column(
                      children: [
                        TextInputField(
                            label: controller.labelemailtext,
                            mycontroller: controller.emailcontroller,
                            validator: controller.validateemail),
                        TextInputField(
                          label: controller.labelpasswordText,
                          mycontroller: controller.passwordcontroller,
                          validator: controller.validatepassword,
                          isobscure: true,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        FlutterPwValidator(
                            width: 350,
                            height: 120,
                            minLength: 8,
                            uppercaseCharCount: 1,
                            numericCharCount: 3,
                            specialCharCount: 1,
                            successColor: Colors.green,
                            failureColor: Colors.red,
                            onSuccess: () {
                              print("MATCHED");
                              ScaffoldMessenger.of(context).showSnackBar(
                                  new SnackBar(
                                      content:
                                          new Text("Password is Matched")));
                              onFail:
                              () {
                                print("NOT MATCHED");
                              };
                            },
                            controller: controller.passwordcontroller),
                        SizedBox(
                          height: 25,
                        ),
                        TextButtonWidget(
                            btnname: "Login",
                            onpressed: () {
                              if (controller.formkey.currentState!.validate()) {
                                // Get.to(ProfileScreen());
                                controller.onloginPressed();
                              }
                            }),
                        TextButton(
                          onPressed: () {
                            Get.to(ProfileScreen());
                          },
                          child: Text("Profile Screen"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Dont have an account?",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "SignUp",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.cyan,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          );
        });
  }
}
