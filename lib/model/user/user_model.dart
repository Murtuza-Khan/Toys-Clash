class User {
  int? userID;
  String? emailAddress;
  String? firstName;
  String? lastName;
  String? address;
  String? city;
  String? zipCode;
  String? stateCode;
  String? photo;
  String? phoneNo;
  String? token;
  String? preferredLanguage;
  String? lastProVersion;

  User({
    this.userID,
    this.emailAddress,
    this.phoneNo,
    this.firstName,
    this.lastName,
    this.address,
    this.city,
    this.zipCode,
    this.stateCode,
    this.photo,
    this.token,
    this.preferredLanguage,
    this.lastProVersion,
  });

  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'emailAddress': emailAddress,
      'phoneNo': phoneNo,
      'firstName': firstName,
      'lastName': lastName,
      'address': address,
      'city': city,
      'zipCode': zipCode,
      'stateCode': stateCode,
      'photo': photo,
      'token': token,
      'preferredLanguage': preferredLanguage,
      'lastProVersion': lastProVersion,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userID: json['userID'] as int?,
      emailAddress: json['emailAddress'] as String?,
      phoneNo: json['phoneNo'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      zipCode: json['zipCode'] as String?,
      stateCode: json['stateCode'] as String?,
      photo: json['photo'] as String?,
      token: json['token'] as String?,
      preferredLanguage: json['preferredLanguage'] as String?,
      lastProVersion: json['lastProVersion'] as String?,
    );
  }

  String get fullName => '${firstName ?? ''} ${lastName ?? ''}';

  User copyWith({
    int? userID,
    String? emailAddress,
    String? phoneNo,
    String? firstName,
    String? lastName,
    String? address,
    String? city,
    String? zipCode,
    String? stateCode,
    String? photo,
    String? token,
    String? preferredLanguage,
    String? lastProVersion,
  }) {
    return User(
      userID: userID ?? this.userID,
      emailAddress: emailAddress ?? this.emailAddress,
      phoneNo: phoneNo ?? this.phoneNo,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      address: address ?? this.address,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
      stateCode: stateCode ?? this.stateCode,
      photo: photo ?? this.photo,
      token: token ?? this.token,
      preferredLanguage: preferredLanguage ?? this.preferredLanguage,
      lastProVersion: lastProVersion ?? this.lastProVersion,
    );
  }
}
