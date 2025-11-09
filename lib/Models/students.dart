class Students {
  final int? usrId;
  final String? usrName;
  final String usrPassword;
  final String usrEmail;

  Students({
    this.usrId,
    this.usrName,
    required this.usrPassword,
    required this.usrEmail,
  });

  factory Students.fromMap(Map<String, dynamic> json) => Students(
        usrId: json["usrId"],
        usrName: json["usrName"],
        usrPassword: json["usrPassword"],
        usrEmail: json["usrEmail"],
      );

  Map<String, dynamic> toMap() => {
        "usrId": usrId,
        "usrName": usrName,
        "usrPassword": usrPassword,
        "usrEmail": usrEmail,
      };
}