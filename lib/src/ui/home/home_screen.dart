import 'package:cruddemo_2/src/service/api.dart';
import 'package:cruddemo_2/src/ui/form/form_screen.dart';
import 'package:flutter/material.dart';

//import '../../domain/Post.dart' show Post;
import 'package:http/http.dart' as http;
import 'package:flutter/src/material/scaffold.dart';
import '../../domain/Post.dart';
import '../../model/Data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Data>? data = [];

  ///Tương tự hàm onCreate trong android
  @override
  void initState() {
    API.getPosts().then((value) => data = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Crud"),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FormScreen(
                  email: '',
                  fullname: '',
                  id: 0,
                  mobile: '',
                );
              }));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: data != null
              ? ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: (context, int) {
                    return Container(
                        child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                data?[int].fullname ?? '',
                                // style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                data?[int].email ?? '',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Text(
                                data?[int].mobile ?? '',
                                style: Theme.of(context).textTheme.subtitle1,
                              )
                            ],
                          ),
                        ),
                      ),
                    ));
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                )

          // FutureBuilder(
          //   future: API.getPosts(),
          //   builder: (context, snapshot){
          //     if(snapshot.hasError){
          //       return Center(
          //         child: Text(snapshot.error.toString()),
          //       );
          //
          //     }
          //     else if(snapshot.connectionState == ConnectionState.done){
          //       var response = snapshot.data as List<Data>;
          //      return ListView.builder(
          //        itemCount: response.length,
          //        itemBuilder: (context,position){
          //          var postItem = response[position];
          //          return
          //           response!=null? Padding(
          //              padding: const EdgeInsets.all(16.0),
          //              child: Card(
          //              child: Padding(
          //                padding: const EdgeInsets.all(12.0),
          //                child: Column(
          //                  crossAxisAlignment: CrossAxisAlignment.stretch,
          //                  children: <Widget>[
          //                    Text(
          //                      postItem.fullname.toString(),
          //                      // style: Theme.of(context).textTheme.titleLarge,
          //                    ),
          //                    Text(
          //                      postItem.email.toString(),
          //                      style: Theme.of(context).textTheme.subtitle1,
          //                    ),
          //                    Text(
          //                       postItem.mobile.toString(),
          //                      style: Theme.of(context).textTheme.subtitle1,
          //                    )
          //                  ],
          //                ),
          //              ),
          //          ),
          //            ):Container();
          //
          //        },
          //      );
          //
          //     }else{
          //       return Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //   },
          // ),
          ),
    );
  }
}
