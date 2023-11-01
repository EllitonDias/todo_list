import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/ui/constants.dart';
import './splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          return AnimatedOpacity(
            duration: const Duration(seconds: 3),
            opacity: controller.animationOpacityLogoValue,
            curve: Curves.easeIn,
            onEnd: () {
              Get.offNamed(RoutersConstants.home);
            },
            child: AnimatedContainer(
              duration: const Duration(seconds: 3),
              curve: Curves.linearToEaseOut,
              width: controller.logoAnimationWidth,
              height: controller.logoAnimationHeight,
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
              ),
            ),
          );
        }),
      ),
    );
  }
}
