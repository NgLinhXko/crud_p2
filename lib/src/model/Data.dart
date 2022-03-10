class Data {
  Data({
      this.id, 
      this.fullname, 
      this.email, 
      this.mobile,});

  //đoạn này dùng khi parse json to object
  ///TODO
  ///dynamic json={"id":1,"fullname":"fullname","email":"email",mobile:"0323243434"}
  ///-->>Sau khi fromjson ->>> Data(id:1,fullname:fullname,email:email,mobile:0323243434);
  Data.fromJson(dynamic json) {
    id = json['id'];
    fullname = json['fullname'];
    email = json['email'];
    mobile = json['mobile'];
  }
  String? id;
  String? fullname;
  String? email;
  String? mobile;

  ///Đoạn này biến object truyền lên sang kiểu map<String,dynamic>
  ///Data(id:1,fullname:"fullname",email:"email,mobile:"mobile)
  ///-->> {"id":1,"fullname":"fullname","email":"email,"mobile":"mobile}
  ///json to post data to server
  ///
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['fullname'] = fullname;
    map['email'] = email;
    map['mobile'] = mobile;
    return map;
  }

}