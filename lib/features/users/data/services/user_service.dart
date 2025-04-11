import 'package:dio/dio.dart';
import '../models/user_model.dart';
import '../models/created_user_model.dart';

class UserService {
  late Dio dio;
  final String baseUrl = 'https://reqres.in/api';

  UserService() {
    dio = Dio();
    dio.options.baseUrl = baseUrl;
  }

  Future<PaginatedUsersResponse> getUsers({int page = 1}) async {
    try {
      final response = await dio.get('/users', queryParameters: {'page': page});
      return PaginatedUsersResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load users');
    }
  }

  Future<UserModel> getUserById(int id) async {
    try {
      final response = await dio.get('/users/$id');
      return UserModel.fromJson(response.data['data']);
    } catch (e) {
      throw Exception('Failed to load user');
    }
  }

  Future<CreatedUserModel> createUser({
    required String name,
    required String job,
  }) async {
    try {
      final response = await dio.post(
        '/users',
        data: {
          'name': name,
          'job': job,
        },
      );
      return CreatedUserModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to create user');
    }
  }
} 