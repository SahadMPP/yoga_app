import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'faq.g.dart';

@JsonSerializable()
class Faq extends Equatable {
  final bool? success;
  final List<Datum>? data;

  const Faq({this.success, this.data});

  factory Faq.fromJson(Map<String, dynamic> json) => _$FaqFromJson(json);

  Map<String, dynamic> toJson() => _$FaqToJson(this);

  @override
  List<Object?> get props => [success, data];
}
