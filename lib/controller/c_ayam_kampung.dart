import 'package:get/get.dart';
import 'package:project_if22a/model/ayam_kampung.dart';

class CAyamkampung extends GetxController {
  Rx<Ayamkampung> _ayamkampung = Ayamkampung().obs;

  Ayamkampung get ayamkampung => _ayamkampung.value;

  void setayamkampung(Ayamkampung dataAyamkampung) =>
      _ayamkampung.value = dataAyamkampung;
}
