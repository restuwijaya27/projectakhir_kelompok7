class Ayamkampung {
  String? nama;
  String? alamat;
  String? nomer_whatsapp;

  Ayamkampung({
    this.nama,
    this.alamat,
    this.nomer_whatsapp,
  });

  factory Ayamkampung.fromJson(Map<String, dynamic> json) => Ayamkampung(
        nama: json['nama'],
        alamat: json['alamat'],
       nomer_whatsapp: json['nomer_whatsapp'],
      );

  Map<String, dynamic> tolJson() => {
        'nama': this.nama,
        'alamat': this.alamat,
        'nomer_whatsapp': this.nomer_whatsapp,
      };
}
