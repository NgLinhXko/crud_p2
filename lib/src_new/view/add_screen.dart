import 'package:cruddemo_2/src_new/api/Api_presenter.dart';
import 'package:cruddemo_2/src_new/model/Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController fullname_ctrl=TextEditingController();
  TextEditingController mobile_ctrl=TextEditingController();
  TextEditingController email_ctrl=TextEditingController();
  ApiPresenter presenter=ApiPresenter();
  bool ?check;
  @override
  void initState() {
    check=true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: check==true?Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormFieldWidget(
              controller: email_ctrl ,
              lableText: 'Email',
              icon: Icons.email,
              enable: true,
              ),
            TextFormFieldWidget(
              controller: fullname_ctrl,
              lableText: 'Fullname',
              icon: Icons.person,
              enable: true,
            ),
            TextFormFieldWidget(
              controller: mobile_ctrl,
              lableText: 'Mobile',
              icon: Icons.phone,
              enable: true,
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (){
                setState(() {
                  check=true;
                });
                Data data=Data(email: email_ctrl.text.trim(),fullname: fullname_ctrl.text.trim(),mobile: mobile_ctrl.text.trim());
                presenter.postData(data).then((value) {
                  setState(() {
                    check=value;
                  });
                });
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Text('Add Data'),
              ),
            )
          ],
        ),
      ):Center(child: CircularProgressIndicator(),)
    );
  }

  Widget TextFormFieldWidget(
      {required TextEditingController controller,
      required String lableText,
      required IconData icon,
      required bool enable,
       String ?type}) {
    return TextFormField(
      enabled: enable,
      controller: controller,
      keyboardType: (type != null) ? TextInputType.number : TextInputType.text,
      cursorColor: Theme.of(context).cursorColor,
      decoration: InputDecoration(
        icon: Icon(icon),
        labelText: lableText,
      ),
    );
  }
}
