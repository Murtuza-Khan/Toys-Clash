import '../../resources/exports/index.dart';

class Session {
  String? tokenID;
  User? user;
  DateTime? lastSignIn;

  Session({
    this.tokenID,
    this.user,
    this.lastSignIn,
  });

  Map<String, dynamic> toJson() {
    return {
      'tokenID': tokenID,
      'userDetails': user?.toJson(),
      'lastSignIn': lastSignIn.toString(),
    };
  }

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      tokenID: json['tokenID'] as String?,
      user: json['userDetails'] != null
          ? User.fromJson(json['userDetails'])
          : null,
      lastSignIn: json['lastSignIn'] != null
          ? DateTime.parse(json['lastSignIn'])
          : null,
    );
  }

  Session copyWith({
    String? tokenID,
    User? user,
    DateTime? lastSignIn,
  }) {
    return Session(
      tokenID: tokenID ?? this.tokenID,
      user: user ?? this.user,
      lastSignIn: lastSignIn ?? this.lastSignIn,
    );
  }
}
