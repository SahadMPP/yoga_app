// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_banners.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBanners _$HomeBannersFromJson(Map<String, dynamic> json) => HomeBanners(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeBannersToJson(HomeBanners instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
