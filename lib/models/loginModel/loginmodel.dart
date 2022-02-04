class LoginModel {
  late String id;
  late String uid;
  late String fullName;
  late String contact;
  late String email;
  late String password;
  late String bankName;
  late String bankAccNo;
  late String ifscCode;
  late String bankBranch;
  late String location;
  late String panNo;
  LoginModel(
      {this.id = "14",
      this.uid = "VIBSC008",
      this.fullName = "KALYAN",
      this.contact = "889988999889",
      this.email = "xyz@gmail.com",
      this.password = "123456",
      this.bankName = "State Bank Of India",
      this.bankAccNo = "kkdlae273913",
      this.bankBranch = "LOhia",
      this.ifscCode = "ddaljnla",
      this.location = "kajdoas",
      this.panNo = "dajoa"});

  factory LoginModel.fromMap(Map json) {
    return LoginModel(
      id: json['id'],
      uid: json['uid'],
      fullName: json['fullname'],
      contact: json['contact'],
      email: json['email'],
      password: json['password'],
      bankName: json['bank_name'],
      bankAccNo: json['bank_acc_no'],
      bankBranch: json['bank_branch'],
      ifscCode: json['ifsc_code'],
      location: json['kalyan'],
      panNo: json['DTDPP3809H'],
    );
  }
}
