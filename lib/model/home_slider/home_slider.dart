import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'home_slider.g.dart';

@JsonSerializable()
class HomeSlider extends Equatable {
  final bool? success;
  final List<Datum>? data;

  const HomeSlider({this.success, this.data});

  factory HomeSlider.fromJson(Map<String, dynamic> json) {
    return _$HomeSliderFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HomeSliderToJson(this);

  @override
  List<Object?> get props => [success, data];
}
