import 'package:flutter_riverpod/flutter_riverpod.dart';

class Noti1 extends StateNotifier<String> {
  String theString;
  Noti1(this.theString) : super("con1.init");

  void doAsync(String newString) async {
    await Future.delayed(const Duration(seconds: 1));
    state = newString;
  }
}

final provider1 = StateNotifierProvider<Noti1, String>((ref) {
  return Noti1("pro1.init");
});

// *********** Noti 2 *************

class Noti2 extends StateNotifier<String> {
  String theString;
  Noti2(this.theString) : super("con2.init");

  void doAsync(String newString) async {
    await Future.delayed(const Duration(seconds: 2));
    state = newString;
  }
}

final provider2 = StateNotifierProvider<Noti2, String>((ref) {
  return Noti2("pro.init");
});
