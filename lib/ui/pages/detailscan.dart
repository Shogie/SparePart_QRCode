import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:skripsi/models/model_data_alat.dart';
import 'package:http/http.dart' as http;
import 'package:skripsi/models/model_get_scan.dart';
import 'package:skripsi/shared/theme,.dart';
import 'package:dropdown_search/dropdown_search.dart';

class DetailScan extends StatefulWidget {
  final String kode;
  DetailScan(this.kode);

  // const DetailScan({super.key});

  @override
  State<DetailScan> createState() => _DetailScanState();
}

class _DetailScanState extends State<DetailScan> {
  late String SelectName;
  List<Pesan> scandetailvalue = [];
  late String option1;
  late String option2;
  late String option3;

  List<String> dataDropdown = ["Normal", 'Tidak Normal/Rusak'];

  Future<void> get_data() async {
    try {
      var response = await http.get(
        Uri.parse(
          "https://skripsikdng.000webhostapp.com/tampil_data_scan.php?kode=${widget.kode}",
        ),
      );

      print("isinya ${response.body}");

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        setState(() {
          List scandetail = jsonData['pesan'];

          for (var item in scandetail) {
            scandetailvalue.add(
              Pesan.fromJson(item),
            );
          }
          // produk = Pesan.fromJson(jsonData);
          // print('Error Hasil: $produk');
        });
      } else {
        throw Exception('Gagal mengambil data');
      }
    } catch (error) {
      // print("Error haha : ${widget.kode}");
      print('Error kk: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    // print("Error haha : $widget.kode");
    get_data();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pengecekan Data Sparepart"),
          centerTitle: true,
          backgroundColor: navcolor,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: bgdefault,
        body: scandetailvalue.isEmpty
            ? Text(
                "Produk Tidak Ditemukan, ${widget.kode}",
                style: TextStyle(fontSize: 20),
              )
            : SingleChildScrollView(
                padding: EdgeInsets.all(20),
                // margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: <Widget>[
                    Text(
                      "${scandetailvalue[0].namaAlat}",
                      style: TextStyle(fontSize: 20),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                    ),
                    Image.network("${scandetailvalue[0].images}"),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                    ),
                    Text(
                      "No Material : ${scandetailvalue[0].noMaterial}",
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: cardlist,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${scandetailvalue[0].namaStatus}",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    DropdownSearch<String>(
                      items: dataDropdown,
                      dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(8)))),
                      selectedItem: dataDropdown[0],
                      onChanged: (value) {
                        // status = value!;
                        option1 = value!;
                      },
                      dropdownBuilder: (context, selectedItem) {
                        return selectedItem == null
                            ? Text(dataDropdown[0])
                            : Text(selectedItem);
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: cardlist,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${scandetailvalue[1].namaStatus}",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    DropdownSearch<String>(
                      items: dataDropdown,
                      dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(8)))),
                      selectedItem: dataDropdown[0],
                      onChanged: (value) {
                        // status = value!;
                        option1 = value!;
                      },
                      dropdownBuilder: (context, selectedItem) {
                        return selectedItem == null
                            ? Text(dataDropdown[0])
                            : Text(selectedItem);
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: cardlist,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${scandetailvalue[2].namaStatus}",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    DropdownSearch<String>(
                      items: dataDropdown,
                      dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(8)))),
                      selectedItem: dataDropdown[0],
                      onChanged: (value) {
                        // status = value!;
                        option1 = value!;
                      },
                      dropdownBuilder: (context, selectedItem) {
                        return selectedItem == null
                            ? Text(dataDropdown[0])
                            : Text(selectedItem);
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      width: 150,
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/homepage');
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: btngetstarted,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              defaultradius,
                            ),
                          ),
                        ),
                        child: Text(
                          'Update Data ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
