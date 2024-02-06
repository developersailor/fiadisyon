// {
//   "ok": true
// }

import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'forgot_password_response.g.dart';

@JsonSerializable()
class ForgotPasswordResponse extends INetworkModel<ForgotPasswordResponse> {
  //ForgotPasswordResponse class'ı dışarıdan değer almayacak şekilde oluşturuldu.
  ForgotPasswordResponse({this.ok});

  @JsonKey(defaultValue: false)
  final bool? ok;

  @override
  ForgotPasswordResponse fromJson(Map<String, dynamic> json) {
    return _$ForgotPasswordResponseFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$ForgotPasswordResponseToJson(this);
  }
}
