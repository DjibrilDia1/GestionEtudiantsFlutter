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


  Map<String, dynamic> toMap() => {
    "usrId": usrId,
    "usrName": usrName,
    "usrPassword": usrPassword,
    "usrEmail": usrEmail,
  };
}
