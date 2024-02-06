import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'auth_response.g.dart';

/// Represents the response received after a Auth request.
/// This class is responsible for deserializing the JSON response into a [AuthResponse] object.
@JsonSerializable()
class AuthResponse extends INetworkModel<AuthResponse> {
  /// Creates a [AuthResponse] object.
  AuthResponse({this.jwt, this.user});
  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  /// The JSON Web Token (JWT) received after a successful Auth.

  final String? jwt;

  final User? user;

  @override
  AuthResponse fromJson(Map<String, dynamic> json) {
    return _$AuthResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$AuthResponseToJson(this);
  }
}

@JsonSerializable()
class User extends INetworkModel<User> {
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.provider,
    required this.confirmed,
    required this.blocked,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'username')
  String username;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'provider')
  String provider;
  @JsonKey(name: 'confirmed')
  bool confirmed;
  @JsonKey(name: 'blocked')
  bool blocked;
  @JsonKey(name: 'createdAt')
  DateTime createdAt;
  @JsonKey(name: 'updatedAt')
  DateTime updatedAt;

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  User fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }
}
