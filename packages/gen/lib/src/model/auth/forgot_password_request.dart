// {
//   "email": "foo.bar@strapi.io"
// }

import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'forgot_password_request.g.dart';

@JsonSerializable()
class ForgotPasswordRequest extends INetworkModel<ForgotPasswordRequest> {
  ForgotPasswordRequest({
    required this.email,
  });

  @JsonKey(name: 'email')
  final String email;

  @override
  ForgotPasswordRequest fromJson(Map<String, dynamic> json) {
    return _$ForgotPasswordRequestFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$ForgotPasswordRequestToJson(this);
  }
}
