import 'package:flutter/material.dart';

import 'dart:convert';

DetailScan detailScanFromJson(String str) => DetailScan.fromJson(json.decode(str));

String detailScanToJson(DetailScan data) => json.encode(data.toJson());

class DetailScan {
    List<Pesan> pesan;

    DetailScan({
        required this.pesan,
    });

    factory DetailScan.fromJson(Map<String, dynamic> json) => DetailScan(
        pesan: List<Pesan>.from(json["pesan"].map((x) => Pesan.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pesan": List<dynamic>.from(pesan.map((x) => x.toJson())),
    };
}

class Pesan {
    String idPengecekan;
    String idPlant5;
    String idStatus;
    String noMaterial;
    String namaAlat;
    String namaStatus;
    // DateTime tglPengecekan;
    String images;

    Pesan({
        required this.idPengecekan,
        required this.idPlant5,
        required this.idStatus,
        required this.noMaterial,
        required this.namaAlat,
        required this.namaStatus,
        // required this.tglPengecekan,
        required this.images,
    });

    factory Pesan.fromJson(Map<String, dynamic> json) => Pesan(
        idPengecekan: json["id_pengecekan"],
        idPlant5: json["id_plant5"],
        idStatus: json["id_status"],
        noMaterial: json["no_material"],
        namaAlat: json["nama_alat"],
        namaStatus: json["nama_status"],
        // tglPengecekan: DateTime.parse(json["tgl_pengecekan"]),
        images: json["images"],
    );

    Map<String, dynamic> toJson() => {
        "id_pengecekan": idPengecekan,
        "id_plant5": idPlant5,
        "id_status": idStatus,
        "no_material": noMaterial,
        "nama_alat": namaAlat,
        "nama_status": namaStatus,
        // "tgl_pengecekan": tglPengecekan.toIso8601String(),
        "images": images,
    };
}


// class cGetScan {
//   String cid;
//   // String cnama;
//   // String cavatar;
//   String carea;
//   String ctagging;
//   String cmaterial;
//   String calat;
//   String cket;
//   String csensor;
//   String cstock;
//   String charga;
//   String cgambar;
//   String cstatus;

//   cGetScan({
//     required this.cid,
//     // required this.cnama,
//     // required this.cavatar,
//     required this.carea,
//     required this.ctagging,
//     required this.cmaterial,
//     required this.calat,
//     required this.cket,
//     required this.csensor,
//     required this.cstock,
//     required this.charga,
//     required this.cgambar,
//     required this.cstatus,
//   });

//   factory cGetScan.fromJson(Map<String, dynamic> json) {
//     return cGetScan(
//       cid: json['id_plant5'],
//       // cnama: json['nama'],
//       // cavatar: json['avatar'],
//       carea: json['area'],
//       ctagging: json['tagging'],
//       cmaterial: json['no_material'],
//       calat: json['nama_alat'],
//       cket: json['keterangan'],
//       csensor: json['tipe_sensor'],
//       cstock: json['stock'],
//       charga: json['harga'],
//       cgambar: json['images'],
//       cstatus: json['nama_status'],
//     );
//   }
// }
