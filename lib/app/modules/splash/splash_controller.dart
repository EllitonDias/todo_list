import 'package:get/get.dart';

class SplashController extends GetxController {
  final _scale = 10.0.obs;

  final _animationOpacityLogo = 0.0.obs;

  double get logoAnimationWidth => 100 * _scale.value;
  double get logoAnimationHeight => 120 * _scale.value;

  double get animationOpacityLogoValue => _animationOpacityLogo.value;

  @override
  void onReady() {
    super.onReady();
    _animationOpacityLogo.value = 1.0;
    _scale.value = 2.0;
  }
}
