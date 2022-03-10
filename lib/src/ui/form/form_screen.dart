import 'package:cruddemo_2/src/model/Data.dart';
import 'package:flutter/material.dart';

import '../../service/api.dart';

var _scaffoldState = GlobalKey<ScaffoldState>();

class FormScreen extends StatefulWidget {
  int? id;
  String? fullname;
  String? email;
  String? mobile;

  FormScreen({this.id, this.fullname, this.email, this.mobile});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final TextEditingController _controllerFullName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerMobile = TextEditingController();
  Data? dataPost;
  bool check = false;

  @override
  void initState() {
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
        body: check == false
            ? SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: const InputDecoration(hintText: "FullName"),
                        keyboardType: TextInputType.text,
                        controller: _controllerFullName,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                      ),
                      TextField(
                        decoration: const InputDecoration(hintText: "Email"),
                        keyboardType: TextInputType.emailAddress,
                        controller: _controllerEmail,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                      ),
                      TextField(
                        decoration: const InputDecoration(hintText: "Mobile"),
                        keyboardType: TextInputType.number,
                        controller: _controllerMobile,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                      ),
                      widget.id == null
                          ? RaisedButton(
                              child: Text("Submit"),
                              onPressed: () {
                                String fullname =
                                    _controllerFullName.text.toString().trim();
                                String email =
                                    _controllerEmail.text.toString().trim();
                                String mobile =
                                    _controllerMobile.text.toString().trim();
                                if (fullname.isEmpty) {
                                  showSnackbarMessage('Name empty');
                                } else if (email.isEmpty) {
                                  showSnackbarMessage('Email empty');
                                } else if (mobile.isEmpty) {
                                  showSnackbarMessage('Mobile empty');
                                } else {
                                  showSnackbarMessage("validation success");
                                }
                              })
                          : RaisedButton(
                              child: Text('Update Changes'),
                              onPressed: () async {
                                print('run');
                                setState(() {
                                  check = true;
                                });
                                dataPost = Data(
                                    mobile: _controllerMobile.text.trim(),
                                    email: _controllerEmail.text.trim(),
                                    fullname: _controllerFullName.text.trim(),
                                    id: '0');
                                await API.createPost(dataPost!).then((value) {
                                  print(value);
                                  setState(() {
                                    ///thay đổi trạng thái biến check hiện CircularProgressIndicator
                                    check = value;
                                  });
                                });
                              },
                            ),
                    ],
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }

  void showSnackbarMessage(String message) {
    _scaffoldState.currentState!.showSnackBar(SnackBar(content: Text(message)));
  }
}
