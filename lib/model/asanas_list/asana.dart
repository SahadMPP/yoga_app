import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pivot.dart';

part 'asana.g.dart';

@JsonSerializable()
class Asana extends Equatable {
  final int? id;
  final String? title;
  final String? duration;
  final String? difficulty;
  final int? type;
  final String? description;
  final String? benefits;
  @JsonKey(name: 'video_uri')
  final String? videoUri;
  @JsonKey(name: 'is_vimeo')
  final int? isVimeo;
  final String? photo;
  final int? status;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  final Pivot? pivot;

  const Asana({
    this.id,
    this.title,
    this.duration,
    this.difficulty,
    this.type,
    this.description,
    this.benefits,
    this.videoUri,
    this.isVimeo,
    this.photo,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory Asana.fromJson(Map<String, dynamic> json) => _$AsanaFromJson(json);

  Map<String, dynamic> toJson() => _$AsanaToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      title,
      duration,
      difficulty,
      type,
      description,
      benefits,
      videoUri,
      isVimeo,
      photo,
      status,
      createdAt,
      updatedAt,
      pivot,
    ];
  }
}
