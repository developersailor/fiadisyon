// {
//   "username": "foobar",
//   "email": "foo.bar@strapi.io",
//   "password": "Test1234"
// }
// request model

import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'register_request.g.dart';

@JsonSerializable()

/// Represents the request to register a new user.
/// This class is responsible for serializing the [RegisterRequest] object into a JSON object.
/// This class is also responsible for deserializing the JSON response into a [RegisterRequest] object.
class RegisterRequest extends INetworkModel<RegisterRequest> {
  /// Creates a [RegisterRequest] object.
  RegisterRequest({
    required this.username,
    required this.email,
    required this.password,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  /// The username of the user to be registered.
  final String username;

  /// The email of the user to be registered.
  final String email;

  /// The password of the user to be registered.
  final String password;

  @override
  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);

  @override
  RegisterRequest fromJson(Map<String, dynamic> json) {
    return _$RegisterRequestFromJson(json);
  }
}
