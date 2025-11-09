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

  factory Students.fromMap(Map<String, dynamic> tab) => Students(
        usrId: tab["usrId"],
        usrName: tab["usrName"],
        usrPassword: tab["usrPassword"],
        usrEmail: tab["usrEmail"],
      );

  Map<String, dynamic> toMap() => {
        "usrId": usrId,
        "usrName": usrName,
        "usrPassword": usrPassword,
        "usrEmail": usrEmail,
      };
}