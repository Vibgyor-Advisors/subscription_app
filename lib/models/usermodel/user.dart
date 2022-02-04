//Creating a class user to store the data;
class User {
  final String name;
  final String contact;
  final String email;
  final String bankName;
  final String bankAccNum;

  User(
      {this.name="NAME",
      this.contact="0802807427",
      this.email = "DNKJD@HKD",
      this.bankName="DFKADJFN",
      this.bankAccNum='2'});

  factory User.fromMap(Map json) {
    return User(
        name: json["fullname"] as String,
        contact: json["contact"] as String,
        email: json["email"] as String,
        bankName: json["bank_name"] as String,
        bankAccNum: json["bank_acc_no"] as String);
  }
}
