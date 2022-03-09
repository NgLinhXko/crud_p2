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
var _scaffoldState = GlobalKey<ScaffoldState>();
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Crud"),
        actions:<Widget> [
          GestureDetector(
            onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return FormScreen();

                }));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: API.getPosts(),
          builder: (context, snapshot){
            if(snapshot.hasError){
              return Center(
                child: Text(snapshot.error.toString()),
              );

            }
            else if(snapshot.connectionState == ConnectionState.done){
              var response = snapshot.data as List<Data>;
             return ListView.builder(
               itemCount: response.length,
               itemBuilder: (context,position){
                 var postItem = response[position];
                 return
                  response!=null? Padding(
                     padding: const EdgeInsets.all(16.0),
                     child: Card(
                     child: Padding(
                       padding: const EdgeInsets.all(12.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.stretch,
                         children: <Widget>[
                           Text(
                             postItem.fullname.toString(),
                             style: Theme.of(context).textTheme.titleLarge,
                           ),
                           Text(
                             postItem.email.toString(),
                             style: Theme.of(context).textTheme.subtitle1,
                           ),
                           Text(
                              postItem.mobile.toString(),
                             style: Theme.of(context).textTheme.subtitle1,
                           )
                         ],
                       ),
                     ),
                 ),
                   ):Container();

               },
             );

            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
