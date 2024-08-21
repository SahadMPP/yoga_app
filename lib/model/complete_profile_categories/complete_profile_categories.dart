import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'complete_profile_categories.g.dart';

@JsonSerializable()
class CompleteProfileCategories extends Equatable {
  final bool? success;
  final List<Datum>? data;

  const CompleteProfileCategories({this.success, this.data});

  factory CompleteProfileCategories.fromJson(Map<String, dynamic> json) {
    return _$CompleteProfileCategoriesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CompleteProfileCategoriesToJson(this);

  @override
  List<Object?> get props => [success, data];
}
