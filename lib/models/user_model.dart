class UserModel {
  final String uid;
  final String name;
  final String email;

  UserModel(this.uid, this.name, this.email);

//-------bind json data to user model
  UserModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        name = json['name'],
        email = json['email'];

//--------convert user model into a json object
  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'email': email,
      };
}
