import 'dart:io';
import 'dart:typed_data';
import 'package:campus360/pages/input.dart';
import 'package:flutter/material.dart';

class UserState with ChangeNotifier {
  String userName = "";
  String userSkill = "";
  Uint8List? webImageBytes;
  File? mobileImage;

  void setUserName(String name) {
    userName = name;
    notifyListeners();
  }

  void setUserSkill(String skill) {
    userSkill = skill;
    notifyListeners();
  }

  void setUserImage({Uint8List? webImage, File? mobileImage}) {
    webImageBytes = webImage;
    this.mobileImage = mobileImage;
    notifyListeners();
  }
}
