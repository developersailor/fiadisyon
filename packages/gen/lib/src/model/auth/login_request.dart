import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest extends INetworkModel<LoginRequest> {
  LoginRequest(this.email, this.password);
  final String email;
  final String password;

  @override
  LoginRequest fromJson(Map<String, dynamic> json) {
    return _$LoginRequestFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$LoginRequestToJson(this);
  }
}
