import 'package:flutter/material.dart';
import 'package:project_if22a/config/asset.dart';
import 'package:project_if22a/event/event_db.dart';
import 'package:project_if22a/model/ayam_pototng.dart';
import 'package:project_if22a/screen/admin/add_update_ayampotong.dart';
import 'package:get/get.dart';

class ListAyampotong extends StatefulWidget {
  const ListAyampotong({super.key});

  @override
  State<ListAyampotong> createState() => _ListAyampotongState();
}

class _ListAyampotongState extends State<ListAyampotong> {
  List<Ayampotong> _listayampotong = [];

  void getAyampotong() async {
    _listayampotong = await EventDb.getAyampotong();

    setState(() {});
  }

  @override
  void initState() {
    getAyampotong();
    super.initState();
  }

  void showOption(Ayampotong? ayampotong) async {
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
        Get.to(AddupdateAyampotong(ayampotong: ayampotong))
            ?.then((value) => getAyampotong());
        break;
      case 'delete':
        EventDb.deleteAyampotong(ayampotong!.nama!)
            .then((value) => getAyampotong());
        break;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Ayampotong"),
        backgroundColor: asset.colorPrimary,
      ),
      body: Stack(
        children: [
          _listayampotong.length > 0
              ? ListView.builder(
                  itemCount: _listayampotong.length,
                  itemBuilder: (context, index) {
                    Ayampotong ayampotong = _listayampotong[index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                        backgroundColor: Colors.white,
                      ),
                      title: Text(ayampotong.nama ?? ''),
                      subtitle: Text(ayampotong.nomer_whatsapp ?? ''),
                      trailing: IconButton(
                          onPressed: () {
                            showOption(ayampotong);
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
              onPressed: () => Get.to(AddupdateAyampotong())
                  ?.then((value) => getAyampotong()),
              child: Icon(Icons.add),
              backgroundColor: asset.colorAccent,
            ),
          )
        ],
      ),
    );
  }
}
