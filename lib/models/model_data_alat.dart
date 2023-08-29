import 'package:flutter/material.dart';

class cDataAlat {
  String cid;
  // String cnama;
  // String cavatar;
  String carea;
  String ctagging;
  String cmaterial;
  String calat;
  String cket;
  String csensor;
  String cstock;
  String charga;
  String cgambar;
  // String cstatus;

  cDataAlat({
    required this.cid,
    // required this.cnama,
    // required this.cavatar,
    required this.carea,
    required this.ctagging,
    required this.cmaterial,
    required this.calat,
    required this.cket,
    required this.csensor,
    required this.cstock,
    required this.charga,
    required this.cgambar,
    // required this.cstatus,
  });

  factory cDataAlat.fromJson(Map<String, dynamic> json) {
    return cDataAlat(
      cid: json['id_plant5'],
      // cnama: json['nama'],
      // cavatar: json['avatar'],
      carea: json['area'],
      ctagging: json['tagging'],
      cmaterial: json['no_material'],
      calat: json['nama_alat'],
      cket: json['keterangan'],
      csensor: json['tipe_sensor'],
      cstock: json['stock'],
      charga: json['harga'],
      cgambar: json['images'],
      // cstatus: json['nama_status'],
    );
  }
}
