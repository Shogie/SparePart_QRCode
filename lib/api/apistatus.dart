import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:skripsi/models/model_status.dart';

class Servicestatus {
  Future<List<cStatus>> getAllData() async {
    final response = await http.get(
      // Uri.parse("https://6283762138279cef71d77f41.mockapi.io/api/v1/Data"),
      Uri.parse("https://skripsikdng.000webhostapp.com/tampil_data_status.php"),
    );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => cStatus.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load Data');
    }
  }
}