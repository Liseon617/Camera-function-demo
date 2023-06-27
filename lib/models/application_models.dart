import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_models.freezed.dart';
part 'application_models.g.dart';

@freezed
class CurrentUser with _$CurrentUser {

  factory CurrentUser({
    required String id,
    String? displayName,
    String? email,
  }) = _CurrentUser;

  factory CurrentUser.fromJson(Map<String, dynamic> json) => _$CurrentUserFromJson(json);
}


