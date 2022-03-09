class Data {
  Data({
      this.id, 
      this.fullname, 
      this.email, 
      this.mobile,});

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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['fullname'] = fullname;
    map['email'] = email;
    map['mobile'] = mobile;
    return map;
  }

}