class User {
  String address;
  String avatar;
  String department;
  String email;
  String fullName;
  int id;
  bool isLdapUser;
  int isRootUser;
  bool isSwitchUser;
  String phone;
  String position;
  String settings;
  String thumbnailPhoto;
  String token;
  String username;

  User(
      {this.address,
      this.avatar,
      this.department,
      this.email,
      this.fullName,
      this.id,
      this.isLdapUser,
      this.isRootUser,
      this.isSwitchUser,
      this.phone,
      this.position,
      this.settings,
      this.thumbnailPhoto,
      this.token,
      this.username});

  User.map(dynamic obj) {
    this.address = obj["address"];
    this.avatar = obj["avatar"];
    this.department = obj["department"];
    this.email = obj["email"];
    this.fullName = obj["fullName"];
    this.id = obj["id"];
    this.isLdapUser = obj["isLdapUser"];
    this.isRootUser = obj["isRootUser"];
    this.isSwitchUser = obj["isSwitchUser"];
    this.phone = obj["phone"];
    this.position = obj["position"];
    this.settings = obj["settings"];
    this.thumbnailPhoto = obj["thumbnailPhoto"];
    this.token = obj["token"];
    this.username = obj["username"];
  }

  Map<String, dynamic> toMap() => {
        "address": this.address,
        "avatar": this.avatar,
        "department": this.department,
        "email": this.email,
        "fullName": this.fullName,
        "id": this.id,
        "isLdapUser": this.isLdapUser,
        "isRootUser": this.isRootUser,
        "isSwitchUser": this.isSwitchUser,
        "phone": this.phone,
        "position": this.position,
        "settings": this.settings,
        "thumbnailPhoto": this.thumbnailPhoto,
        "token": this.token,
        "username": this.username,
      };
}
