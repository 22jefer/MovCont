class User{

  //crear constructor get y seters para la toma de datos en json, y contructor Empty
  var _name;
  var _gmail;
  var _password;

  User(this._name, this._gmail, this._password);

  get password => _password;

  set password(value) {
    _password = value;
  }

  get gmail => _gmail;

  set gmail(value) {
    _gmail = value;
  }

  get name => _name;

  set name(value) {
    _name = value;
  }

  // ignore: non_constant_identifier_names
  User.Empty();


  // Dos metodos para usar la informacion en formato Json
  User.fromJson(Map<String, dynamic> json)

    : _name = json["name"],
      _gmail = json["gmail"],
      _password =json["password"];


  Map<String, dynamic> toJson() => {
    "name" : _name,
    "gmail" : _gmail,
    "password" : _password
  };

}