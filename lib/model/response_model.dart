class ResponseModel {
  final String message;
  final bool status;

  ResponseModel({
    required this.message,
    required this.status,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      message: json['message'],
      status: json['status'],
    );
  }
}
