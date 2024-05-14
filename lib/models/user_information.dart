
class UserNumberInformation{
  final String usernumber;

  UserNumberInformation({
    required this.usernumber
  });

  factory UserNumberInformation.fromJson(Map<String, dynamic> json){
    return UserNumberInformation(usernumber: json["numbers"]);
  }


}

class UserEmailInformation{
  var useremail;

  UserEmailInformation({
    required this.useremail
  });

  factory UserEmailInformation.fromJson(Map<String, dynamic> json){
    return UserEmailInformation(useremail: json["email"]);
  }


}