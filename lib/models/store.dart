class Store {
  var _id;
  var _name;
  var _phone;
  var _address;
  var _urlPicture;
  var _lactitude;
  var _longitude;

  Store();

  get longitude => _longitude;

  set longitude(value) {
    _longitude = value;
  }

  get lactitude => _lactitude;

  set lactitude(value) {
    _lactitude = value;
  }

  get urlPicture => _urlPicture;

  set urlPicture(value) {
    _urlPicture = value;
  }

  get address => _address;

  set address(value) {
    _address = value;
  }

  get phone => _phone;

  set phone(value) {
    _phone = value;
  }

  get name => _name;

  set name(value) {
    _name = value;
  }

  get id => _id;

  set id(value) {
    _id = value;
  }
}