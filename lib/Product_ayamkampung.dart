import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_if22a/config/url_launcher.dart';
import 'package:project_if22a/config/url_launcher.dart';

class Product {
  final String name;
  final String imageUrl;

  Product({required this.name, required this.imageUrl});
}

class Marketplace1 extends StatefulWidget {
  const Marketplace1({Key? key}) : super(key: key);

  @override
  State<Marketplace1> createState() => _Marketplace1State();
}

class _Marketplace1State extends State<Marketplace1> {
  final List<Product> products = [
    Product(
      name: 'Ayam Kampung Segar Rp 80.000/kg',
      imageUrl:
          'https://i0.wp.com/wasiswa.com/wp-content/uploads/2019/01/Panduan-Umum-Cara-Ternak-Ayam-Kampung.jpg?fit=1015%2C751&ssl=1',
    ),
    Product(
      name: 'Ayam Kampung Premium Rp 80.000/kg',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSd9pXVbBnIrI_dnSW57bjG7ZogMRecvzOw&s',
    ),
    Product(
      name: 'Ayam Kampung Organik Rp 80.000/kg',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB6ZplT1Z0bYG-E9XghEe7Ty3wNJzvT56nrQ&s',
    ),
    Product(
      name: 'Ayam Kampung Kualitas Terbaik Rp 100.000/kg',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7P0zOyi_pLis5UaXMEDsCmbfdpatNva1WDA&s',
    ),
    Product(
      name: 'Ayam Kampung Super Rp 100.000/kg',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB6ZplT1Z0bYG-E9XghEe7Ty3wNJzvT56nrQ&s',
    ),
    Product(
      name: 'Ayam Kampung Segar Rp 65.000/kg',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2tgoi2XwpkVcdnGyHoAeHyapRXA-20Gb8Ag&s',
    ),
    Product(
      name: 'Ayam Kampung Premium Rp 87.000/kg',
      imageUrl:
          'https://png.pngtree.com/thumb_back/fw800/background/20230928/pngtree-rooster-with-wings-down-image_13359968.jpg',
    ),
    Product(
      name: 'Ayam Kampung Organik Rp 100.000/kg',
      imageUrl:
          'https://png.pngtree.com/thumb_back/fw800/background/20220603/pngtree-countryside-roosters-asian-rooster-cock-fighting-cock-and-gamecock-photo-image_30866518.jpg',
    ),
    Product(
      name: 'Ayam Kampung Kualitas Terbaik Rp 100.000/kg',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2tgoi2XwpkVcdnGyHoAeHyapRXA-20Gb8Ag&s',
    ),
    Product(
      name: 'Ayam Kampung Super Rp 100.000/kg',
      imageUrl:
          'https://png.pngtree.com/thumb_back/fw800/background/20230928/pngtree-rooster-with-wings-down-image_13359968.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Produk Terbaru',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
            items: products.map((product) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      openWhatsApp(
                          '6282183295557'); // Ganti dengan nomor WhatsApp Anda
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          product.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Semua Produk',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    openWhatsApp(
                        '6282183295557'); // Ganti dengan nomor WhatsApp Anda
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.network(
                              product.imageUrl,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.imageUrl,
              width: double.infinity,
              height: 500,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                product.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            // Informasi tambahan tentang produk
            // Deskripsi, Harga, dll.
          ],
        ),
      ),
    );
  }
}
