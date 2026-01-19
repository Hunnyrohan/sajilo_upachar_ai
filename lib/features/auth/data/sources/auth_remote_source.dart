class AuthRemoteSource {
  Future<Map<String, dynamic>> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return {"id": "1", "email": email};
  }
}
