import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skripsi/shared/theme,.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:skripsi/ui/pages/detailscan.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // var getResult = "QR Code Result";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgdefault,
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text("Spart Part PT. Semen Tonasa"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 5,
        leading: Container(
          width: 150,
          height: 150,
          padding: EdgeInsets.only(left: 20),
          child: Image.asset("assets/images/logotonasa.png"),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 175, 171, 171),
                const Color.fromARGB(255, 214, 187, 196)
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ),
      body: GridView.count(
        padding: EdgeInsets.all(25),
        crossAxisCount: 2,
        children: [
          Card(
            margin: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/dataalat');
              },
              splashColor: Color.fromARGB(255, 160, 152, 228),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/sparepart.png"), // Ganti dengan path gambar Anda
                          fit: BoxFit.cover, // Sesuaikan dengan kebutuhan Anda
                        ),
                      ),
                    ),
                    Text(
                      "Data Sparepart",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Card(
          //   margin: EdgeInsets.all(8),
          //   child: InkWell(
          //     onTap: () {},
          //     splashColor: Color.fromARGB(255, 160, 152, 228),
          //     child: Center(
          //       child: Column(
          //         children: [
          //           Container(
          //             width: 75,
          //             height: 75,
          //             margin: EdgeInsets.all(15),
          //             decoration: BoxDecoration(
          //               image: DecorationImage(
          //                 image: AssetImage(
          //                     "assets/images/create-qr.png"), // Ganti dengan path gambar Anda
          //                 fit: BoxFit.cover, // Sesuaikan dengan kebutuhan Anda
          //               ),
          //             ),
          //           ),
          //           Text(
          //             "Buat QRCode",
          //             style: TextStyle(fontSize: 15),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          Card(
            margin: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                scanQRCode();
              },
              splashColor: Color.fromARGB(255, 160, 152, 228),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/scan-qr.png"), // Ganti dengan path gambar Anda
                          fit: BoxFit.cover, // Sesuaikan dengan kebutuhan Anda
                        ),
                      ),
                    ),
                    Text(
                      "Scan QRCode",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/datastatus');
              },
              splashColor: Color.fromARGB(255, 160, 152, 228),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/list-alat.png"), // Ganti dengan path gambar Anda
                          fit: BoxFit.cover, // Sesuaikan dengan kebutuhan Anda
                        ),
                      ),
                    ),
                    Text(
                      "Status Alat",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {},
              splashColor: Color.fromARGB(255, 160, 152, 228),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/list-alat.png"), // Ganti dengan path gambar Anda
                          fit: BoxFit.cover, // Sesuaikan dengan kebutuhan Anda
                        ),
                      ),
                    ),
                    Text(
                      "Riwayat",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {},
              splashColor: Color.fromARGB(255, 160, 152, 228),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/list-alat.png"), // Ganti dengan path gambar Anda
                          fit: BoxFit.cover, // Sesuaikan dengan kebutuhan Anda
                        ),
                      ),
                    ),
                    Text(
                      "Jadwal Pengecekan",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future scanQRCode() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#009922", "Cancel", true, ScanMode.BARCODE)
        .then((String kode) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScan(kode),
        ),
      );
    });
  }

  // void scanQRCode() async {
  //   try {
  //     final qrCode = await FlutterBarcodeScanner.scanBarcode(
  //         "#009922", "Cancel", true, ScanMode.BARCODE);

  //     if (!mounted) return;

  //     setState(() {
  //       getResult = qrCode;
  //     });

  //     print("QRCode Result");
  //     print(qrCode);
  //   } on PlatformException {
  //     getResult = "Failed to Scan QR Code";
  //   }
  // }
}
