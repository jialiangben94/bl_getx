import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

typedef GeneralErrorHandle = bool Function(
    BuildContext context, int code, String message);

class BaseState {
  BaseState._();

  static final instance = BaseState._();

  void initialize({
    bool statusBarTextWhiteColor = false,
    GeneralErrorHandle? onFailed,
    GetMiddleware? globalMiddleware,
  }) {
    this.statusBarTextWhiteColor = statusBarTextWhiteColor;
    this.onFailed = onFailed;
    this.globalMiddleware = globalMiddleware;
    log("BaseState is initialized");
  }

  //set the statusBarText into white, default false(black).
  bool statusBarTextWhiteColor = false;

  //a General Error Handle all all pages using this.
  GeneralErrorHandle? onFailed;

  GetMiddleware? globalMiddleware;

  void lockScreenOrientation(DeviceOrientation orientation) {
    SystemChrome.setPreferredOrientations([
      orientation,
    ]);
  }

  void allowedOrientation(List<DeviceOrientation> orientationList) {
    SystemChrome.setPreferredOrientations(orientationList);
  }
}
