import 'package:bl_getx/bl_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

GetPage cGetPageInitial<T extends BasePage>(T page,
    {Bindings? binding, List<GetMiddleware>? middlewares}) {
  return GetPage(
      name: page.routeName,
      page: () => page,
      binding: binding,
      middlewares: [
        if (BaseState.instance.globalMiddleware != null)
          BaseState.instance.globalMiddleware!,
        if ((middlewares ?? []).isNotEmpty) ...middlewares!,
      ]);
}

GetPage cGetPage<T extends BasePage>(T page,
    {Bindings? binding, List<GetMiddleware>? middlewares}) {
  return GetPage(
      name: page.routeName,
      page: () {
        T _page = Get.arguments;
        return _page;
      },
      binding: binding,
      middlewares: [
        if (BaseState.instance.globalMiddleware != null)
          BaseState.instance.globalMiddleware!,
        if ((middlewares ?? []).isNotEmpty) ...middlewares!,
      ]);
}

GetPage cGetWidget<T extends BaseWidget>(T page,
    {Bindings? binding, List<GetMiddleware>? middlewares}) {
  return GetPage(
      name: page.routeName,
      page: () {
        T _page = Get.arguments;
        return _page;
      },
      binding: binding,
      middlewares: [
        if (BaseState.instance.globalMiddleware != null)
          BaseState.instance.globalMiddleware!,
        if ((middlewares ?? []).isNotEmpty) ...middlewares!,
      ]);
}

Future<dynamic> loadPage(BasePage page) async {
  await Future.delayed(const Duration(milliseconds: 100));

  var result = await Get.toNamed(page.routeName, arguments: page);
  return result;
}

Future<dynamic> loadWidget(BaseWidget page) async {
  var result = await Get.toNamed(page.routeName,
      arguments: page, preventDuplicates: false);
  return result;
}

loadPageWithRemovePrevious(
  BasePage toRoute,
  BasePage fromRoute,
) async {
  await Future.delayed(const Duration(milliseconds: 100));
  Get.offNamedUntil(toRoute.routeName, ModalRoute.withName(fromRoute.routeName),
      arguments: toRoute);
}

loadPageWithRemoveAllPrevious(
  BasePage page,
) async {
  await Future.delayed(const Duration(milliseconds: 100));
  Get.offAllNamed(page.routeName, arguments: page);
}

backTo(BasePage page) {
  Get.until((route) => Get.currentRoute == page.routeName);
}

T? getController<T extends GetxController>(T controller) {
  if (Get.isRegistered<T>()) {
    return Get.find<T>();
  } else {
    return null;
  }
}
