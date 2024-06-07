import 'package:flutter/material.dart';
import 'package:project_if22a/event/event_db.dart';
import 'package:project_if22a/model/ayam_pototng.dart';
import 'package:project_if22a/screen/admin/list_ayampotong.dart';
import 'package:get/get.dart';
import 'package:project_if22a/config/asset.dart';
import 'package:project_if22a/widget/info.dart';

class AddupdateAyampotong extends StatefulWidget {
  final Ayampotong? ayampotong;
  AddupdateAyampotong({this.ayampotong});
  @override
  State<AddupdateAyampotong> createState() => _AddupdateAyampotongState();
}

class _AddupdateAyampotongState extends State<AddupdateAyampotong> {
  var _formKey = GlobalKey<FormState>();
  var _controllerNama = TextEditingController();
  var _controllerAlamat = TextEditingController();
  var _controllerNomer_whatsapp = TextEditingController();

  bool _isHidden = true;
  @override
  void initState() {
    // TODO: implement initState
    if (widget.ayampotong != null) {
      _controllerNama.text = widget.ayampotong!.nama!;
      _controllerAlamat.text = widget.ayampotong!.alamat!;
      _controllerNomer_whatsapp.text = widget.ayampotong!.nomer_whatsapp!;
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // titleSpacing: 0,
        title: widget.ayampotong != null
            ? Text('Update Ayampotong ')
            : Text('Tambah Ayampotong '),
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
                  enabled: widget.ayampotong == null ? true : false,
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
                      if (widget.ayampotong == null) {
                        String message = await EventDb.AddAyampotong(
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
                            ListAyampotong(),
                          );
                        }
                      } else {
                        EventDb.UpdateAyampotong(
                          _controllerNama.text,
                          _controllerAlamat.text,
                          _controllerNomer_whatsapp.text,
                        );
                        Get.off(
                          ListAyampotong(),
                        );
                      }
                    }
                  },
                  child: Text(
                    widget.ayampotong == null ? 'Simpan' : 'Ubah',
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
