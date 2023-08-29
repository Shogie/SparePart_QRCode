import 'package:flutter/material.dart';
import 'package:skripsi/api/apistatus.dart';
import 'package:skripsi/models/model_status.dart';
import 'package:skripsi/shared/theme,.dart';
import 'package:skripsi/ui/pages/detaildatasparepart.dart';

class DataStatus extends StatefulWidget {
  const DataStatus({super.key});

  @override
  State<DataStatus> createState() => _DataSparepartState();
}

class _DataSparepartState extends State<DataStatus> {
  Servicestatus serviceAPI = Servicestatus();
  late Future<List<cStatus>> ListData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ListData = serviceAPI.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Status Data"),
          centerTitle: true,
          backgroundColor: navcolor,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: bgdefault,
        body: Container(
          padding: EdgeInsets.all(15),
          child: FutureBuilder<List<cStatus>>(
            future: ListData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<cStatus> isidata = snapshot.data!;
                return ListView.builder(
                  itemCount: isidata.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      color: cardlist,
                      child: ListTile(
                        title: Text(isidata[index].cnamastatus),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
