// ignore_for_file: override_on_non_overriding_member

import 'package:json_annotation/json_annotation.dart';
part 'signin_model.g.dart';

@JsonSerializable()
class SigninModel {
  final String email;
  final String password;

  SigninModel(this.email, this.password);

  @override
  SigninModel fromJson(Map<String, Object?> json) {
    return _$SigninModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$SigninModelToJson(this);
  }
}
