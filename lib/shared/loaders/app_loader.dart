import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class AppLoader {
  static void show() {
    BotToast.showCustomLoading(
      toastBuilder:
          (_) => const Center(
            child:
                CircularProgressIndicator(),
          ),
    );
  }

  static void hide() {
    BotToast.closeAllLoading();
  }
}