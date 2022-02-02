import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin SnackMixin on GetxController {
  void messageListener(Rxn<MessageModel?> message) {
    ever<MessageModel?>(message, (model) async {
      if (model != null) {
        Get.snackbar(
          model.title,
          model.message,
          backgroundColor: model.type.color(),
          colorText: model.type.textColor(),
        );
      }
    });
  }
}

class MessageModel {
  String message;
  String title;
  MessageType type;

  MessageModel({
    required this.message,
    required this.title,
    required this.type,
  });
}

enum MessageType { error, info }

extension MessageTypeColorExt on MessageType {
  Color color() {
    switch (this) {
      case MessageType.error:
        return Colors.red[800]!;
      case MessageType.info:
        return Colors.blue[200]!;
    }
  }

  Color textColor() {
    switch (this) {
      case MessageType.error:
        return Colors.white;
      case MessageType.info:
        return Colors.black;
    }
  }
}
