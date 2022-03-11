import 'package:cruddemo_2/src_new/api/Api_presenter.dart';
import 'package:cruddemo_2/src_new/model/Data.dart';
import 'package:cruddemo_2/src_new/view/add_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiPresenter presenter=ApiPresenter();
  List<Data> ?data;
  @override
  void initState() {
    // TODO: implement initState
    presenter.getData().then((value) {
      setState(() {
        data=value;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body:Container(

        child:data!=null ?ListView.builder(
          itemCount: data?.length,
          itemBuilder: (context,int){
            return Container(
              margin: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${data?[int].fullname}'),
                  Text('${data?[int].mobile}'),
                  Text('${data?[int].email}'),
                ],
              ),
            );
          },
        ):Center(
          child: CircularProgressIndicator(),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  AddScreen()),
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),
      ),
    );
  }
}
