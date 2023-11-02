import 'package:get/get.dart';

import '../../core/modules/module.dart';
import '../../core/ui/constants.dart';
import 'splash_bindings.dart';
import 'splash_page.dart';

class SplashModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: RoutersConstants.splash,
      page: () => const SplashPage(),
      binding: SplashBindings(),
      transition: Transition.fadeIn,
    ),
  ];
}
