
import 'package:get/get.dart';

import '../../models/message_model.dart';

mixin MessagesMixin on GetxController {
  void messageListener(Rxn<MessageModel> message) {
    ever<MessageModel?>(
      message,
      (model) {
        if (model != null) {
          Get.snackbar(
            model.title,
            model.message,
            backgroundColor: model.type.color(),
          );
        }
      },
    );
  }
  
}