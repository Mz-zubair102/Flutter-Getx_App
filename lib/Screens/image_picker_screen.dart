import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Controller/login_screen_controller.dart';

import '../Controller/image_picker_controller.dart';
import '../Widgets/text_button_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        title: Text("Image Picker Screen"),
      ),
      body: GetBuilder<ImagePickerController>(
          // id: _.imageUpdateKey,
        init: ImagePickerController(),
          builder: (logic) {
            return logic.imageFile!=null?Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.file(logic.imageFile!,fit: BoxFit.cover,)),
                  ),
                ],
              ),
            ): TextButton(
                onPressed:()async{
                  await logic.pickUserProfileImage();
                },
                child:Text("Pick Image",style: TextStyle(color: Colors.blue),));
          }),
    );
  }
}
