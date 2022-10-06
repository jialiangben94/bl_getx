import 'package:bl_getx/bl_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BasePage<T extends BaseController> extends GetView<T>
    with WidgetsBindingObserver {
  const BasePage({Key? key}) : super(key: key);

  String get routeName;
}
