import 'package:cruddemo_2/src/model/Data.dart';
import 'package:flutter/material.dart';

import '../../service/api.dart';
var _scaffoldState = GlobalKey<ScaffoldState>();

class FormScreen extends StatefulWidget {
  int? id;
  String? fullname;
  String? email;
  String? mobile;

  FormScreen({this.id, this.fullname,this.email,this.mobile});
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController _controllerFullName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerMobile = TextEditingController();
  @override
  void initState(){
    _controllerFullName.text = widget.fullname.toString();
    _controllerEmail.text = widget.email.toString();
    _controllerMobile.text = widget.mobile.toString();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text("Form"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: "FullName"),
                keyboardType: TextInputType.text,
                controller: _controllerFullName,
              ),
              Padding(padding: const EdgeInsets.only(top: 8.0),
              ),
              TextField(
                decoration: InputDecoration(hintText: "Email"),
                keyboardType: TextInputType.emailAddress,
                controller: _controllerEmail,
              ),
              Padding(padding: const EdgeInsets.only(top: 8.0),
              ),
              TextField(
                decoration: InputDecoration(hintText: "Mobile"),
                keyboardType: TextInputType.number,
                controller: _controllerMobile,
              ),
              Padding(padding: const EdgeInsets.only(top: 8.0),
              ),
              widget.id == null
                  ?RaisedButton(child: Text("Submit"),onPressed: (){
                    String fullname = _controllerFullName.text.toString().trim();
                    String email = _controllerEmail.text.toString().trim();
                    String mobile = _controllerMobile.text.toString().trim();
                    if(fullname.isEmpty){
                      showSnackbarMessage('Name empty');

                    }else if(email.isEmpty){
                      showSnackbarMessage('Email empty');
                    }else if(mobile.isEmpty){
                      showSnackbarMessage('Mobile empty');

                    }else{
                      showSnackbarMessage("validation success");
                      Data data=Data(mobile:mobile,email: email,fullname: fullname,id: '0' );
                      API.createPost(data);

                    }

              })
                  : RaisedButton(child: Text('Update Changes'),
              onPressed: (){
                    print('run');

              },
              ),
            ],
          ),
        ),
      ),
    );
  }
  void showSnackbarMessage(String message){
    _scaffoldState.currentState!.showSnackBar(SnackBar(content: Text(message)));
  }
}
