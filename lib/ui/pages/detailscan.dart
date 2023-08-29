import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:skripsi/models/model_data_alat.dart';
import 'package:http/http.dart' as http;
import 'package:skripsi/models/model_get_scan.dart';
import 'package:skripsi/shared/theme,.dart';

class DetailScan extends StatefulWidget {
  final String kode;
  DetailScan(this.kode);

  // const DetailScan({super.key});

  @override
  State<DetailScan> createState() => _DetailScanState();
}

class _DetailScanState extends State<DetailScan> {
  // late cDataAlat produk;

  // Future<cDataAlat> get_data() async {
  //   await http.get(
  //     Uri.parse("http://10.153.17.118/Skripsi/get_data.php?kode=${widget.kode}")
  //         .then((resoponse) {
  //       var response;
  //       if (jsonDecode(response.body) != null) {
  //         setState(() {
  //           produk = cDataAlat.fromJson(jsonDecode(response.body));
  //         });
  //       }
  //     }),
  //     // Uri.parse("http://127.0.0.1/Skripsi/tampil_alat.php"),
  //     // Uri.parse("http://192.168.42.12/Skripsi/tampil_alat.php"),
  //   );
  // }
  late String SelectName;
  late cGetScan produk;
  // var produk;
  // late Map<String, dynamic> produk;

  Future<void> get_data() async {
    try {
      var response = await http.get(
        Uri.parse(
          "https://skripsikdng.000webhostapp.com/tampil_data_scan.php?kode=${widget.kode}",
        ),
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        setState(() {
          produk = cGetScan.fromJson(jsonData);
          print('Error Hasil: $produk');
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
        body: produk == null
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
                      "${produk.calat}",
                      style: TextStyle(fontSize: 20),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                    ),
                    Image.network("${produk.cgambar}"),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                    ),
                    Text(
                      "No Material : ${produk.cmaterial}",
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: cardlist,
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${produk.cstatus}",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Masukkan Status Alat',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(top: 15),
                    //   width: double.infinity,
                    //   height: 40,
                    //   decoration: BoxDecoration(
                    //     color: cardlist,
                    //   ),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Text(
                    //         "${produk.cstatus}",
                    //         style: TextStyle(fontSize: 20),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       TextFormField(
                    //         decoration: InputDecoration(
                    //           hintText: 'Masukkan Status Alat',
                    //           border: OutlineInputBorder(),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   margin: EdgeInsets.only(top: 15),
                    //   width: double.infinity,
                    //   height: 40,
                    //   decoration: BoxDecoration(
                    //     color: cardlist,
                    //   ),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Text(
                    //         "${produk.cstatus}",
                    //         style: TextStyle(fontSize: 20),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       TextFormField(
                    //         decoration: InputDecoration(
                    //           hintText: 'Masukkan Status Alat',
                    //           border: OutlineInputBorder(),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
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
