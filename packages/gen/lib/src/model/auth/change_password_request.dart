// {
//   "password": "string",
//   "currentPassword": "string",
//   "passwordConfirmation": "string"
// }

//vexana ile model oluşturulacak

import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'change_password_request.g.dart';

@JsonSerializable()
class ChangePasswordRequest extends INetworkModel<ChangePasswordRequest> {
  ChangePasswordRequest({
    required this.password,
    required this.currentPassword,
    required this.passwordConfirmation,
  });

  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'currentPassword')
  final String currentPassword;
  @JsonKey(name: 'passwordConfirmation')
  final String passwordConfirmation;

  @override
  ChangePasswordRequest fromJson(Map<String, dynamic> json) {
    return _$ChangePasswordRequestFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$ChangePasswordRequestToJson(this);
  }
}
