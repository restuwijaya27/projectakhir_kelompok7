import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_if22a/config/asset.dart';
import 'package:project_if22a/screen/admin/list_ayampotong.dart';
import 'package:project_if22a/screen/admin/list_ayamkampung.dart';
import 'package:project_if22a/screen/login.dart';
import 'package:get/get.dart';
import 'package:project_if22a/event/event_pref.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: asset.colorPrimary,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image(
                  image: AssetImage('../asset/image/Banner.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 25, bottom: 10),
              child: Column(
                children: [],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "Testimoni",
                style: TextStyle(
                  color: asset.colorPrimaryDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              alignment: Alignment.topLeft,
            ),
            SizedBox(
              height: 170,
              child: ListView(
                children: [
                  CarouselSlider(
                    items: [
                      Testimoni(
                        'https://img.lazcdn.com/g/ff/kf/See9ba8c8aa4b40b4b21dbc18a4da74fdK.jpg_720x720q80.jpg',
                        'Bersih, sehat, dan harga terjangkau. Sangat direkomendasikan!',
                        'Jumat, 2 Februari 2024',
                      ),
                      Testimoni(
                        'https://i0.wp.com/wasiswa.com/wp-content/uploads/2019/01/Panduan-Umum-Cara-Ternak-Ayam-Kampung.jpg?fit=1015%2C751&ssl=1',
                        'Ayam-ayamnya berkualitas tinggi dan tidak berbau amis.',
                        'Minggu, 28 April 2024',
                      ),
                      Testimoni(
                        'https://qph.cf2.quoracdn.net/main-qimg-3e18a1b6fd26c5738a946b1802680c18-lq',
                        'Ayamnya selalu segar dan siap untuk dimasak.',
                        'Jumat, 2 Mei 2024',
                      ),
                      Testimoni(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRklO0pthXwsaYU_OlXPFVQzOavcMTFvizLjAVZPpuyleY19ZImM5EkaDIxZMQMAUvlWcw&usqp=CAU',
                        'Ayamnya autentik dan membuat masakan jadi istimewa.',
                        'Sabtu, 4 Mei 2024',
                      ),
                      Testimoni(
                        'https://png.pngtree.com/thumb_back/fw800/background/20220603/pngtree-countryside-roosters-asian-rooster-cock-fighting-cock-and-gamecock-photo-image_30866518.jpg',
                        'Kualitas ayam yang baik dengan harga yang bersahabat.',
                        'Senin, 13 Mei 2024',
                      ),
                    ],
                    options: CarouselOptions(
                        height: 170,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.8),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class IconButton extends StatelessWidget {
  final String nameLabel;
  final IconData iconLabel;
  final int index;

  IconButton(this.nameLabel, this.iconLabel, this.index);

  List<Map> _fragment = [
    {'title': 'Data Ayam  kampung', 'view': ListAyamkampung()},
    {'title': 'Data Ayam  potong', 'view': ListAyampotong()},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // margin: EdgeInsets.only(bottom: 5),
            child: Material(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
                onTap: () {
                  if (index == 99) {
                    EventPref.clear();
                    Get.off(Login());
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => _fragment[index]['view']),
                    );
                  }
                },
                child: Container(
                  // margin: EdgeInsets.all(5),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: asset.colorPrimaryDark,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        Icon(
                          iconLabel,
                          color: Colors.white,
                          size: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              nameLabel,
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}

class Testimoni extends StatelessWidget {
  final String img;
  final String judul;
  final String tanggal;

  Testimoni(this.img, this.judul, this.tanggal);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: NetworkImage(img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  colors: [
                    asset.colorPrimaryDark,
                    Colors.transparent,
                  ],
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                  stops: [0.1, 0.9],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    judul,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    tanggal,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      // alignment: Alignment(1, 1),
    );
  }
}
