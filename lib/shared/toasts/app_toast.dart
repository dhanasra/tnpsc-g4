import 'package:bot_toast/bot_toast.dart';

class AppToast {
  static void show(
    String message,
  ) {
    BotToast.showText(
      text: message,
    );
  }

  static void success(
    String message,
  ) {
    BotToast.showText(
      text: message,
    );
  }

  static void error(
    String message,
  ) {
    BotToast.showText(
      text: message,
    );
  }
}