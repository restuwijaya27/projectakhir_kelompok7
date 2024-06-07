import 'package:flutter/material.dart';
import 'package:project_if22a/config/asset.dart';
import 'package:project_if22a/event/event_db.dart';
import 'package:project_if22a/model/ayam_kampung.dart';
import 'package:project_if22a/screen/admin/add_update_ayamkampung.dart';
import 'package:get/get.dart';

class ListAyamkampung extends StatefulWidget {
  const ListAyamkampung({super.key});

  @override
  State<ListAyamkampung> createState() => _ListAyamkampungState();
}

class _ListAyamkampungState extends State<ListAyamkampung> {
  List<Ayamkampung> _listayamkampung = [];

  void getAyamkampung() async {
    _listayamkampung = await EventDb.getAyamkampung();

    setState(() {});
  }

  @override
  void initState() {
    getAyamkampung();
    super.initState();
  }

  void showOption(Ayamkampung? ayamkampung) async {
    var result = await Get.dialog(
        SimpleDialog(
          children: [
            ListTile(
              onTap: () => Get.back(result: 'update'),
              title: Text('Update'),
            ),
            ListTile(
              onTap: () => Get.back(result: 'delete'),
              title: Text('Delete'),
            ),
            ListTile(
              onTap: () => Get.back(),
              title: Text('Close'),
            )
          ],
        ),
        barrierDismissible: false);
    switch (result) {
      case 'update':
        Get.to(AddupdateAyamkampung(
          ayamkampung: ayamkampung,
        ))?.then((value) => getAyamkampung());
        break;
      case 'delete':
        EventDb.deleteAyamkampung(ayamkampung!.nama!)
            .then((Value) => getAyamkampung());
        break;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Data Ayamkampung",
        ),
        backgroundColor: asset.colorPrimary,
      ),
      body: Stack(
        children: [
          _listayamkampung.length > 0
              ? ListView.builder(
                  itemCount: _listayamkampung.length,
                  itemBuilder: (context, index) {
                    Ayamkampung ayamkampung = _listayamkampung[index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                        backgroundColor: Colors.white,
                      ),
                      title: Text(ayamkampung.nama ?? ''),
                      subtitle: Text(ayamkampung.nomer_whatsapp ?? ''),
                      trailing: IconButton(
                          onPressed: () {
                            showOption(ayamkampung);
                          },
                          icon: Icon(Icons.more_vert)),
                    );
                  },
                )
              : Center(
                  child: Text("Data Kosong"),
                ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () => Get.to(AddupdateAyamkampung())
                  ?.then((Value) => getAyamkampung()),
              child: Icon(Icons.add),
              backgroundColor: asset.colorAccent,
            ),
          )
        ],
      ),
    );
  }
}
