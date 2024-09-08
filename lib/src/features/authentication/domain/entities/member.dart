import 'package:freezed_annotation/freezed_annotation.dart';

part 'member.freezed.dart';
part 'member.g.dart';

@Freezed()
class Member with _$Member {
  const Member._();

  const factory Member({
    final String? uid,
    final String? email,
    final int? pokeball,
    // ignore: invalid_annotation_target
    @JsonKey(name: "login_at") final DateTime? loginAt,
  }) = _Member;

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}
