import 'package:flutter/material.dart';
import 'package:skripsi/api/apiservices.dart';
import 'package:skripsi/models/model_data_alat.dart';
import 'package:skripsi/shared/theme,.dart';
import 'package:skripsi/ui/pages/detaildatasparepart.dart';

class DataSparepart extends StatefulWidget {
  const DataSparepart({super.key});

  @override
  State<DataSparepart> createState() => _DataSparepartState();
}

class _DataSparepartState extends State<DataSparepart> {
  Service serviceAPI = Service();
  late Future<List<cDataAlat>> ListData;
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
          title: Text("Data SparePart"),
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
          child: FutureBuilder<List<cDataAlat>>(
            future: ListData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<cDataAlat> isidata = snapshot.data!;
                return ListView.builder(
                  itemCount: isidata.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      color: cardlist,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailDataSparepart(
                                    dataalat: isidata[index]);
                              },
                            ),
                          );
                        },
                        title: Text(isidata[index].calat),
                        leading: Image(
                          image: NetworkImage(isidata[index].cgambar),
                        ),
                        subtitle: Text(isidata[index].cgambar),
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
