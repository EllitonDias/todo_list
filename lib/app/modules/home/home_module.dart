import 'package:get/get.dart';

import '../../core/modules/module.dart';
import '../../core/ui/constants.dart';
import 'home_bindings.dart';
import 'home_page.dart';

class HomeModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: RoutersConstants.home,
      page: () => const HomePage(),
      binding: HomeBindings(),
      transition: Transition.fadeIn,
    ),
  ];
}
