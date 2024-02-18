import 'package:core/core.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

final class TokenCacheModel with CacheModel {
  TokenCacheModel({required this.token});
  TokenCacheModel.empty() : token = AuthResponse();
  final AuthResponse? token;
  @override
  TokenCacheModel fromDynamicJson(dynamic json) {
    final jsonMap = json as Map<String, dynamic>?;
    if (jsonMap == null) {
      CustomLogger.showError<AuthResponse>('Json cannot be null');
      return this;
    }
    return copyWith(
      token: AuthResponse.fromJson(jsonMap),
    );
  }

  TokenCacheModel fromAuthResponse(AuthResponse authResponse) {
    return TokenCacheModel(token: authResponse);
  }

  @override
  Map<String, dynamic>? toJson() {
    return token?.toJson();
  }

  TokenCacheModel copyWith({
    AuthResponse? token,
  }) {
    return TokenCacheModel(
      token: token ?? this.token,
    );
  }

  @override
  // TODO: implement id
  String get id => token?.user?.username ?? '';
}
