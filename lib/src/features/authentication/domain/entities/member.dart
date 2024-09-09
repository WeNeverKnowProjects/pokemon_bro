import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon/src/features/pokemon/domain/entities/pokemon.dart';

part 'member.freezed.dart';
part 'member.g.dart';

@Freezed()
class Member with _$Member {
  const Member._();

  const factory Member({
    final String? uid,
    final String? email,
    final int? pokeball,
    final int? numbers, //numbers of pokemon
    // ignore: invalid_annotation_target
    @JsonKey(name: "login_at") final DateTime? loginAt,
    final List<Pokemon>? pokemons,
  }) = _Member;

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}
