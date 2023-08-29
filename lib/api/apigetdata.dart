import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:skripsi/models/model_data_alat.dart';
import 'package:skripsi/models/model_get_scan.dart';

class Service {
  Future<List<cGetScan>> getAllData() async {
    final response = await http.get(
      // Uri.parse("https://6283762138279cef71d77f41.mockapi.io/api/v1/Data"),
      Uri.parse(
          "https://skripsikdng.000webhostapp.com/tampil_data_pengecekan.php"),
    );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => cGetScan.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load Data');
    }
  }
}

// class Service {
//   Future<List<cDataAlat>> getAllData() async {
//     try {
//       final response = await http.get(
//         // Uri.parse("http://127.0.0.1/Skripsi/tampil_alat.php"),
//         // Uri.parse("https://6283762138279cef71d77f41.mockapi.io/api/v1/Data"),
//         Uri.parse("https://skripsikdng.000webhostapp.com/tampil_alat.php"),
//         // Uri.parse("http://10.153.39.250/Skripsi/tampil_alat.php"),
//       );

//       if (response.statusCode == 200) {
//         List jsonResponse = json.decode(response.body);
//         return jsonResponse
//             .map((data) => cDataAlat.fromJson(data))
//             .cast<cDataAlat>()
//             .toList(); // Menambahkan .cast<cDataAlat>() untuk memastikan tipe data yang dikembalikan sesuai dengan Future<List<cDataAlat>>
//       } else {
//         throw Exception('Gagal memuat data');
//       }
//     } catch (error) {
//       throw Exception('Terjadi kesalahan: $error');
//     }
//   }
// }
