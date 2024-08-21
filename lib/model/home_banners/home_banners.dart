import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'home_banners.g.dart';

@JsonSerializable()
class HomeBanners extends Equatable {
  final bool? success;
  final List<Datum>? data;

  const HomeBanners({this.success, this.data});

  factory HomeBanners.fromJson(Map<String, dynamic> json) {
    return _$HomeBannersFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HomeBannersToJson(this);

  @override
  List<Object?> get props => [success, data];
}
