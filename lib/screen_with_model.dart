import 'package:flutter/material.dart';
import 'package:list_data_api/api_services.dart';
import 'package:list_data_api/list_post_model.dart';

class ScreenWithModel extends StatefulWidget {
  const ScreenWithModel({super.key});
  @override
  State<ScreenWithModel> createState() => _ScreenWithModelState();
}

List<ListPostApi> postApi = [];
bool isReady = false;

class _ScreenWithModelState extends State<ScreenWithModel> {
  _getModel() {
    isReady = true;
    ApiServices().getPostWithModel().then((value) => {
          setState(() {
            postApi = value!;
            isReady = false;
          })
        });
  }

  @override
  void initState() {
    _getModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text("List Without Model"),
        centerTitle: true,
      ),
      body: isReady == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: postApi.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.deepOrange,
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Text(postApi[index].id.toString()),
                    title: Text(postApi[index].title!.toUpperCase().toString()),
                    subtitle: Text(postApi[index].body.toString()),
                  ),
                );
              },
            ),
    );
  }
}
