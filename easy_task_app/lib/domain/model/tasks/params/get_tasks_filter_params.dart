class GetTasksFiltersParams {
  const GetTasksFiltersParams({
    this.query = '',
    this.limit = 10,
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
}
