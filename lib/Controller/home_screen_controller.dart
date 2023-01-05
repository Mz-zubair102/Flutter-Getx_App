import 'package:get/get.dart';

class HomeScreenController extends GetxController{
  // var count=0.obs;
  RxInt count=0.obs;
  RxString s="".obs;
  increment(){
    count(++count.value);
    // int a=count.value;
    String ss=s.value;
  }
}