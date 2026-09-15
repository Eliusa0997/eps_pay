// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history_pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionHistoryPaginationModel _$TransactionHistoryPaginationModelFromJson(
  Map<String, dynamic> json,
) => TransactionHistoryPaginationModel(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map(
        (e) =>
            TransactionHistoryResponseModel.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$TransactionHistoryPaginationModelToJson(
  TransactionHistoryPaginationModel instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};
