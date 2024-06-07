import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_if22a/config/url_launcher.dart';

class Product {
  final String name;
  final String imageUrl;

  Product({required this.name, required this.imageUrl});
}

class Marketplace2 extends StatefulWidget {
  const Marketplace2({Key? key}) : super(key: key);

  @override
  State<Marketplace2> createState() => _Marketplace2State();
}

class _Marketplace2State extends State<Marketplace2> {
  final List<Product> products = [
    Product(
      name: 'Ayam Potong Segar  Rp 50.000/kg',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqfzZ_nKgB1U6PpGLibyymzV5fs6hsFBuofg&s',
    ),
    Product(
      name: 'Ayam Potong Premium  Rp 70.000/kg',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKB_KltOYN11i_BLVv0hv6KLiTAIJbFPEbMA&s',
    ),
    Product(
      name: 'Ayam Potong Organik Rp 40.000/kg',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgbWNlGBP1dlAzwNtESuhqYUWjC3IiaT2mXg&s',
    ),
    Product(
      name: 'Ayam Potong Kualitas Terbaik Rp 70.000/kg',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdDzk6ksDXsWwIDSm7tq8fzzMPD4BarQBA7g&s',
    ),
    Product(
      name: 'Ayam Potong Super Rp 50.000/kg',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvl-yc53nfxhwjVujSZR3aRe9Bk-5FSRrtLA&s',
    ),
    Product(
      name: 'Ayam Potong Segar Rp 50.000/kg',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqfzZ_nKgB1U6PpGLibyymzV5fs6hsFBuofg&s',
    ),
    Product(
      name: 'Ayam Potong Premium Rp 50.000/kg',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKB_KltOYN11i_BLVv0hv6KLiTAIJbFPEbMA&s',
    ),
    Product(
      name: 'Ayam Potong Organik Rp 50.000/kg',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgbWNlGBP1dlAzwNtESuhqYUWjC3IiaT2mXg&s',
    ),
    Product(
      name: 'Ayam Potong Kualitas Terbaik Rp 50.000/kg',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdDzk6ksDXsWwIDSm7tq8fzzMPD4BarQBA7g&s',
    ),
    Product(
      name: 'Ayam Potong Super Rp 50.000/kg',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvl-yc53nfxhwjVujSZR3aRe9Bk-5FSRrtLA&s',
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

void main() {
  runApp(MaterialApp(
    home: Marketplace2(),
  ));
}
