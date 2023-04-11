class ApiError {
  int? status;
  String? message;

  ApiError({
    this.status,
    this.message,
  });

  ApiError copyWith({
    int? status,
    String? message,
  }) =>
      ApiError(
        status: status ?? this.status,
        message: message ?? this.message,
      );
}
