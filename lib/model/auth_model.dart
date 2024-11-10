class AuthModel {
  late final String? fullName;
  late final String? mobileNumber;
  late final String eMail;
  late final String passWord;
  late final String? role;

  AuthModel({
    this.fullName,
    this.mobileNumber,
    required this.eMail,
    required this.passWord,
    this.role,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      fullName: json['fullName'],
      mobileNumber: json['mobileNumber'],
      eMail: json['eMail'],
      passWord: json['passWord'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Fullname': fullName,
      'MobileNo': mobileNumber,
      'Email': eMail,
      'Password': passWord,
      'Role': role,
    };
  }
}
