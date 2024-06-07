import 'package:flutter/material.dart';
import 'package:project_if22a/event/event_db.dart';
import 'package:project_if22a/model/ayam_kampung.dart';
import 'package:project_if22a/screen/admin/list_ayamkampung.dart';
import 'package:get/get.dart';
import 'package:project_if22a/config/asset.dart';
import 'package:project_if22a/widget/info.dart';

class AddupdateAyamkampung extends StatefulWidget {
  final Ayamkampung? ayamkampung;
  AddupdateAyamkampung({this.ayamkampung});
  @override
  State<AddupdateAyamkampung> createState() => _AddupdateAyamkampungState();
}

class _AddupdateAyamkampungState extends State<AddupdateAyamkampung> {
  var _formKey = GlobalKey<FormState>();
  var _controllerNama = TextEditingController();
  var _controllerAlamat = TextEditingController();
  var _controllerNomer_whatsapp = TextEditingController();

  bool _isHidden = true;
  @override
  void initState() {
    // TODO: implement initState
    if (widget.ayamkampung != null) {
      _controllerNama.text = widget.ayamkampung!.nama!;
      _controllerAlamat.text = widget.ayamkampung!.alamat!;
      _controllerNomer_whatsapp.text = widget.ayamkampung!.nomer_whatsapp!;
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // titleSpacing: 0,
        title: widget.ayamkampung != null
            ? Text('Update Ayam kampung')
            : Text('Tambah Ayam kampung'),
        backgroundColor: asset.colorPrimary,
      ),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                TextFormField(
                  enabled: widget.ayamkampung == null ? true : false,
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerNama,
                  decoration: InputDecoration(
                      labelText: "Nama",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerAlamat,
                  decoration: InputDecoration(
                      labelText: "Alamat",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerNomer_whatsapp,
                  decoration: InputDecoration(
                      labelText: "Nomer whatsapp",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (widget.ayamkampung == null) {
                        String message = await EventDb.AddAyamkampung(
                          _controllerNama.text,
                          _controllerAlamat.text,
                          _controllerNomer_whatsapp.text,
                        );
                        info.snackbar(message);
                        if (message.contains('Berhasil')) {
                          _controllerNama.clear();
                          _controllerAlamat.clear();
                          _controllerNomer_whatsapp.clear();
                          Get.off(
                            ListAyamkampung(),
                          );
                        }
                      } else {
                        EventDb.UpdateAyamkampung(
                          _controllerNama.text,
                          _controllerAlamat.text,
                          _controllerNomer_whatsapp.text,
                        );
                        Get.off(
                          ListAyamkampung(),
                        );
                      }
                    }
                  },
                  child: Text(
                    widget.ayamkampung == null ? 'Simpan' : 'Ubah',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: asset.colorAccent,
                      fixedSize: Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
