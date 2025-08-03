import 'package:equatable/equatable.dart';

class GetTasksFiltersParams extends Equatable {
  const GetTasksFiltersParams({
    this.query = '',
    this.limit = 25,
    this.offset = 0,
  });

  final String query;
  final int? limit;
  final int? offset;

  Map<String, dynamic> toMap(String userId) {
    final rawFilter = query.trim();
    final filter = rawFilter.replaceAll("'", "''");
    final result = <String, dynamic>{
      'filter': filter,
      'user_id_param': userId,
    };
    if (limit != null) {
      result['limit_param'] = limit;
    }
    if (offset != null) {
      result['offset_param'] = offset;
    }
    return result;
  }

  @override
  List<Object?> get props => [query, limit, offset];
}
