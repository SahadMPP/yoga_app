// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_slider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeSlider _$HomeSliderFromJson(Map<String, dynamic> json) => HomeSlider(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeSliderToJson(HomeSlider instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
