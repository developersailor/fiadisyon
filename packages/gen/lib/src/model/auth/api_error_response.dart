import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'api_error_response.g.dart';

@JsonSerializable()

/// Represents an error model that implements the INetworkModel interface.
class ApiErrorResponse extends INetworkModel<ApiErrorResponse> {
  /// Creates an error model.
  ApiErrorResponse({
    required this.data,
    this.error,
  });

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorResponseFromJson(json);

  /// The data received after a successful request.
  final Data data;

  /// The error received after a failed request.
  @JsonKey(
    name: 'error',
  )
  final ErrorModel? error;

  @override
  ApiErrorResponse fromJson(Map<String, dynamic> json) {
    return _$ApiErrorResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ApiErrorResponseToJson(this);
  }
}

@JsonSerializable()

/// Represents a data object.
class Data {
  /// Creates a data object.
  Data();

  /// Creates a data object from JSON data.
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  /// Converts a data object to JSON data.
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()

/// Represents an error object.
class ErrorModel {
  /// Creates an error object.
  ErrorModel({
    required this.status,
    required this.name,
    required this.message,
    required this.details,
  });

  /// Represents an error response from an API.
  ///
  /// This model class is used to deserialize JSON error responses into Dart objects.
  /// It contains properties for the status code, error name, error message, and additional details.

  /// Creates a new instance of [ErrorModel] from a JSON map.
  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);

  /// The status code of the error response.
  @JsonKey(name: 'status')
  int status;

  /// The name of the error.
  @JsonKey(name: 'name')
  String name;

  /// The error message.
  @JsonKey(name: 'message')
  String message;

  /// Additional details about the error.
  @JsonKey(name: 'details')
  Data details;

  /// Converts this [ErrorModel] instance to a JSON map.
  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}
