import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum extends Equatable {
  final int? id;
  final String? name;
  final String? photo;
  final int? count;

  const Datum({
    this.id,
    this.name,
    this.photo,
    this.count,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      name,
      photo,
      count,
    ];
  }
}
