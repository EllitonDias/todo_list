import 'package:flutter/material.dart';

class MessageModel {
  final String title;
  final String message;
  final MessageType type;

  MessageModel({
    required this.title,
    required this.message,
    required this.type,
  });

  MessageModel.error({
    required this.title,
    required this.message,
  }) : type = MessageType.error;

  MessageModel.info({
    required this.title,
    required this.message,
  }) : type = MessageType.info;

  MessageModel.success({
    required this.title,
    required this.message,
  }) : type = MessageType.success;
}

enum MessageType { error, info, success }

extension MessageTypeColorExtension on MessageType {
  Color color() {
    switch (this) {
      case MessageType.error:
        return Colors.red[600]!;
      case MessageType.info:
        return Colors.blue[600]!;
      case MessageType.success:
        return Colors.green[600]!;
    }
  }
}
