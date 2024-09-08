// import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'area.freezed.dart';
part 'area.g.dart';

@Freezed()
class Area with _$Area {
  const Area._();
  const factory Area({
    final String? name,
    final String? url,
  }) = _Area;

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);
}
// class Area extends Equatable {
//   final String? name;
//   const Area({this.name});
//   factory Area.fromJson(Map<String, dynamic> json) => Area(name: json['name']);
//   @override
//   List<Object?> get props => [name];
// }
