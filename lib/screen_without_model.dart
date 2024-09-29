import 'package:flutter/material.dart';
import 'package:list_data_api/api_services.dart';

class ScreenWithoutModel extends StatefulWidget {
  const ScreenWithoutModel({super.key});

  @override
  State<ScreenWithoutModel> createState() => _ScreenWithoutModelState();
}

class _ScreenWithoutModelState extends State<ScreenWithoutModel> {
  // bool isReady = false;
  // dynamic postList = [];
  // _getPost() {
  //   isReady = true;
  //   ApiServices().getPostWithoutModel().then((value) {
  //     setState(() {
  //       postList = value;
  //       isReady = false;
  //     });
  //   });
  // }

  // @override
  // void initState() {
  //   _getPost();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text("List With Model"),
        centerTitle: true,
      ),
      // body: isReady == true
      //     ? const Center(
      //         child: CircularProgressIndicator(),
      //       )
      //     : ListView.builder(
      //         itemCount: postList.length,
      //         itemBuilder: (context, index) {
      //           return Card(
      //             color: Colors.deepOrange,
      //             margin: const EdgeInsets.all(10),
      //             child: ListTile(
      //               leading: Text(postList[index]["id"].toString()),
      //               title:
      //                   Text(postList[index]["title"].toUpperCase().toString()),
      //               subtitle: Text(postList[index]["body"].toString()),
      //             ),
      //           );
      //         },
      //       ),

      //Future builder
      body: FutureBuilder(
          future: ApiServices().getPostWithoutModel(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        leading: Text(
                          snapshot.data[index]["id"].toString(),
                          style: const TextStyle(color: Colors.redAccent),
                        ),
                        title: Text(
                          snapshot.data[index]["title"]
                              .toString()
                              .toUpperCase(),
                          style: const TextStyle(color: Colors.black),
                        ),
                        subtitle: Text(
                          snapshot.data[index]["body"].toString(),
                          style: const TextStyle(color: Colors.purpleAccent),
                        ),
                      ),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
