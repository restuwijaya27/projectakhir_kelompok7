import 'dart:convert';
import 'package:project_if22a/config/api.dart';
import 'package:project_if22a/event/event_pref.dart';
import 'package:project_if22a/model/ayam_kampung.dart';
import 'package:project_if22a/model/ayam_pototng.dart';
import 'package:project_if22a/screen/admin/dashboard_admin.dart';
import 'package:project_if22a/widget/info.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_if22a/model/user.dart';

class EventDb {
  static Future<List<Ayamkampung>> getAyamkampung() async {
    List<Ayamkampung> listAyamkampung = [];

    try {
      var response = await http.get(Uri.parse(Api.getAyamkampung));
      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          var ayamkampung = responBody['ayamkampung'];

          ayamkampung.forEach((ayamkampung) {
            listAyamkampung.add(Ayamkampung.fromJson(ayamkampung));
          });
        }
      }
    } catch (e) {
      print(e);
    }

    return listAyamkampung;
  }

  static Future<String> AddAyamkampung(
      String nama, String alamat, String nomer_whatsapp) async {
    String reason;
    try {
      var response = await http.post(Uri.parse(Api.addAyampotong), body: {
        'text_nama': nama,
        'text_alamat': alamat,
        'text_nomer_whatsapp': nomer_whatsapp,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          reason = 'Add ayam kampung  Berhasil';
        } else {
          reason = responBody['reason'];
        }
      } else {
        reason = "Request Gagal";
      }
    } catch (e) {
      print(e);
      reason = e.toString();
    }
    return reason;
  }

  static Future<void> UpdateAyamkampung(
      String nama, String alamat, String nomer_whatsapp) async {
    try {
      var response = await http.post(Uri.parse(Api.updateAyamkampung), body: {
        'text_nama': nama,
        'text_alamat': alamat,
        'text_nomer_whatsapp': nomer_whatsapp,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          info.snackbar('Berhasil Update Ayam kampung');
        } else {
          info.snackbar('Berhasil Update Ayam kampung');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> deleteAyamkampung(String nama) async {
    try {
      var response = await http
          .post(Uri.parse(Api.deleteAyamkampung), body: {'nama': nama});

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          info.snackbar('Berhasil Delete Ayam kampung');
        } else {
          info.snackbar('Gagal Delete Ayam kampung');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  // dosen
  static Future<List<Ayampotong>> getAyampotong() async {
    List<Ayampotong> listAyampotong = [];

    try {
      var response = await http.get(Uri.parse(Api.getAyampotong));
      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          var ayampotong = responBody['ayampotong'];

          ayampotong.forEach((ayampotong) {
            listAyampotong.add(ayampotong.fromJson(ayampotong));
          });
        }
      }
    } catch (e) {
      print(e);
    }

    return listAyampotong;
  }

  static Future<String> AddAyampotong(
      String nama, String alamat, String nomer_whatsapp) async {
    String reason;
    try {
      var response = await http.post(Uri.parse(Api.addAyampotong), body: {
        'text_nama': nama,
        'text_alamat': alamat,
        'text_nomer_whatsapp': nomer_whatsapp,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          reason = 'Add ayam potong Berhasil';
        } else {
          reason = responBody['reason'];
        }
      } else {
        reason = "Request Gagal";
      }
    } catch (e) {
      print(e);
      reason = e.toString();
    }
    return reason;
  }

  static Future<void> UpdateAyampotong(
      String nama, String alamat, String nomer_whatsapp) async {
    try {
      var response = await http.post(Uri.parse(Api.updateAyampotong), body: {
        'text_nama': nama,
        'text_alamat': alamat,
        'text_nomer_whatsapp': nomer_whatsapp,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          info.snackbar('Berhasil Update Ayampotong');
        } else {
          info.snackbar('Berhasil Update Ayampotong');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> deleteAyampotong(String nama) async {
    try {
      var response = await http
          .post(Uri.parse(Api.deleteAyampotong), body: {'nama': nama});

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          info.snackbar('Berhasil Delete Ayam potong');
        } else {
          info.snackbar('Gagal Delete Ayam potong');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<User?> login(String username, String pass) async {
    User? user;

    try {
      var response = await http.post(Uri.parse(Api.login), body: {
        'text_username': username,
        'text_pass': pass,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);

        if (responBody['success']) {
          user = User.fromJson(responBody['user']);
          EventPref.saveUser(user);
          info.snackbar('Login Berhasil');
          Future.delayed(Duration(milliseconds: 1700), () {
            Get.off(
              DashboardAdmin(),
            );
          });
        } else {
          info.snackbar('Login Gagal');
        }
      } else {
        info.snackbar('Request Login Gagal');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }
}
