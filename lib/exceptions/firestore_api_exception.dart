class FirestoreApiException implements Exception {
  late final String message;
  late final String? devDetails;
  late final String? prettyDetails;

  FirestoreApiException({
    required this.message,
    this.devDetails,
    this.prettyDetails,
  });

  @override
  String toString(){
    return
      'FirestoreApiException: $message ${devDetails != null ? '- $devDetails' : ''}';
  }
}
