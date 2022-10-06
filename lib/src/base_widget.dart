import 'package:bl_getx/bl_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseWidget<T extends BaseController> extends GetWidget<T>
    with WidgetsBindingObserver {
  const BaseWidget({Key? key}) : super(key: key);

  String get routeName;
}
