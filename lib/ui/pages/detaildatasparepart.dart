import 'package:flutter/material.dart';
import 'package:skripsi/models/model_data_alat.dart';
import 'package:skripsi/shared/theme,.dart';

class DetailDataSparepart extends StatefulWidget {
  final cDataAlat dataalat;
  const DetailDataSparepart({super.key, required this.dataalat});

  @override
  State<DetailDataSparepart> createState() => _DetailDataSparepartState();
}

class _DetailDataSparepartState extends State<DetailDataSparepart> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Detail Data Sparepart"),
          centerTitle: true,
          backgroundColor: navcolor,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 20)),
            Image.network(widget.dataalat.cgambar),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.dataalat.calat,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(widget.dataalat.cket),
            ),
            ElevatedButton(
              onPressed: Navigator.of(context).pop,
              child: Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}
