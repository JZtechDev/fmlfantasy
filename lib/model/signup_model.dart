class SignUpLiveDTO {
  final String email;
  final String password;
  final String confirmPassword;
  final String firstName;
  final String lastName;
  final String mobile;
  final String country;
  final String twSid;
  final List<String> codes;
  final String pid;

  SignUpLiveDTO({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.country,
    required this.twSid,
    required this.codes,
    required this.pid,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "country": country,
      "twSid": twSid,
      "codes": codes,
      "pid": pid,
    };
  }
}
