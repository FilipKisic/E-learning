abstract interface class AuthRepository {
  Future<void> login(String username, String password);
}
