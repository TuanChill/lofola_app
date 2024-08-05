import 'package:lofola_app/service/api_service.dart';

class UserInstance {
  // Private constructor
  UserInstance._privateConstructor();

  // Static private instance
  static final UserInstance _instance = UserInstance._privateConstructor();

  // Static method to provide access to the instance
  static UserInstance get instance => _instance;

  int? id;
  String? username;
  String? email;
  String? phone;
  String? fullName;
  DateTime? birthday;
  String? avatar;
  bool? gender;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? accessToken;
  String? refreshToken;

  // login method
  Future<void> login(String identifier, String password) async {
    try {
      final response = await ApiService().post(
        "/auth/login",
        data: {"identifier": identifier, "password": password},
      );

      // Parse response data
      final data = response.data['data'];
      id = data['id'];
      username = data['username'];
      email = data['email'];
      phone = data['phone'];
      fullName = data['full_name'];
      birthday = DateTime.parse(data['birthday']);
      avatar = data['avatar'];
      gender = data['gender'] as bool?;
      createdAt = DateTime.parse(data['created_at']);
      updatedAt = DateTime.parse(data['updated_at']);

      // Save access token and refresh token
      accessToken = response.headers.value('authorization');
      refreshToken = response.headers.value('refreshtoken');
    } catch (e) {
      print('Error occurred during login: $e');
    }
  }

  // logout method
  Future<void> logout() async {
    try {
      if (accessToken == null || refreshToken == null) {
        throw Exception('Access token or refresh token is missing');
      }

      await ApiService().post(
        "/auth/logout",
        headers: {
          "Authorization": accessToken!,
          "Refreshtoken": refreshToken!,
        },
      );
    } catch (e) {
      print('Error occurred during logout: $e');
    } finally {
      // Reset user data
      _reset();
    }
  }

  Future<void> register(String username, email, phone, password) async {
    // Reset user data
    _reset();

    try {
      await ApiService().post("/auth/register", data: {
        "username": username,
        "email": email,
        "phone": phone,
        "password": password,
      });
    } catch (e) {
      print('Error occurred during logout: $e');
    } finally {
      // Reset user data
      _reset();
    }
  }

  Future<void> sendOTP(String email) async {
    try {
      await ApiService().post("/auth/send-otp", data: {
        "email": email,
      });
    } catch (e) {
      print('Error occurred during logout: $e');
    }
  }

  Future<void> verifyOTP(String email, String otp) async {
    try {
      await ApiService().post("/auth/verify-otp", data: {
        "email": email,
        "otp": otp,
      });
    } catch (e) {
      print('Error occurred during logout: $e');
    }
  }

  Future<void> resetPassword(
      String email, password, confirmPassword, otp) async {
    try {
      await ApiService().post("/auth/reset-password", data: {
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
        "otp": otp,
      });
    } catch (e) {
      print('Error occurred during logout: $e');
    }
  }

  // Private method to reset user data
  void _reset() {
    id = null;
    username = null;
    email = null;
    phone = null;
    fullName = null;
    birthday = null;
    avatar = null;
    gender = null;
    createdAt = null;
    updatedAt = null;
    accessToken = null;
    refreshToken = null;
  }
}
