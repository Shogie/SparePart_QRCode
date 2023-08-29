import 'package:flutter/material.dart';

class cStatus {
  String cid;
  String cidpengecekan;
  String cnamastatus;
  String cstatus;
 

  cStatus({
    required this.cid,
    required this.cidpengecekan,
    required this.cnamastatus,
    required this.cstatus,

  });

  factory cStatus.fromJson(Map<String, dynamic> json) {
    return cStatus(
      cid: json['id_status'],
      cidpengecekan: json['id_pengecekan'],
      cnamastatus: json['nama_status'],
      cstatus: json['status'],
    );
  }
}
