import 'dart:developer';

import 'package:bl_getx/bl_getx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';

abstract class BaseController extends FullLifeCycleController
    with FullLifeCycleMixin {
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance?.addObserver(this);
    setStatusBarColor(null);
  }

  @override
  void onClose() {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(
        BaseState.instance.statusBarTextWhiteColor);
    super.onClose();
  }

  @override
  void onDetached() {
    log('$runtimeType - onDetached called');
  }

  @override
  void onInactive() {
    log('$runtimeType - onInactive called');
  }

  @override
  void onPaused() {
    log('$runtimeType - onPaused called');
  }

  @override
  void onResumed() {
    log('$runtimeType - onResumed called');
  }

  Future<void> setStatusBarColor(bool? isWhite) async {
    await FlutterStatusbarcolor.setStatusBarWhiteForeground(
        isWhite ?? BaseState.instance.statusBarTextWhiteColor);
  }

  bool onFailed(int code, String message, String apiCode, dynamic data) {
    if (BaseState.instance.onFailed == null || Get.context == null) {
      return false;
    }
    return BaseState.instance.onFailed!(Get.context!, code, message);
  }
}
