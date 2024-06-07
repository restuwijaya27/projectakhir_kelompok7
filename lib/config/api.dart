class Api {
  static const _host = "http://192.168.56.1/api_project";

  static String _ayamkampung = "$_host/ayamkampung";
  static String _ayampotong = "$_host/ayampotong";
  static String login = "$_host/login.php";

  // ayamkampung
  static String getAyamkampung = "$_ayamkampung/view.php";
  static String addAyamkampung = "$_ayamkampung/add.php";
  static String updateAyamkampung = "$_ayamkampung/update.php";
  static String deleteAyamkampung = "$_ayamkampung/delete.php";

  // ayampotong
  static String getAyampotong = "$_ayampotong/view.php";
  static String addAyampotong = "$_ayampotong/add.php";
  static String updateAyampotong = "$_ayampotong/update.php";
  static String deleteAyampotong = "$_ayampotong/delete.php";
}