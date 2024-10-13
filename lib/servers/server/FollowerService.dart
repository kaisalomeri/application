import 'package:dio/dio.dart';

class FollowerService {
  final Dio _dio;

  FollowerService()
      : _dio = Dio(BaseOptions(
          baseUrl: 'http://127.0.0.1:8000/api/',
          headers: {
            'Content-Type': 'application/json',
          },
        ));

  Future<bool> isFollowing(int userId, int providerId) async {
    try {
      final response = await _dio.get('is-following', queryParameters: {
        'user_id': userId,
        'provider_id': providerId,
      });
      return response.data['is_following'] ?? false;
    } catch (e) {
      print('Error checking following status: $e');
      return false;
    }
  }

  Future<bool> followProvider(int userId, int providerId) async {
    try {
      final response = await _dio.post('follow', data: {
        'user_id': userId,
        'provider_id': providerId,
      });

      if (response.statusCode == 201) {
        return true;
      } else {
        print('Follow request failed with status: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      if (e is DioException) {
        print('Dio error: ${e.message}');
        if (e.response != null) {
          print('Error response: ${e.response?.data}');
          print('Status code: ${e.response?.statusCode}');
        }
      } else {
        print('Unexpected error: $e');
      }
      return false;
    }
  }

  Future<bool> unfollowProvider(int userId, int providerId) async {
    try {
      final response = await _dio.delete('unfollow', queryParameters: {
        'user_id': userId,
        'provider_id': providerId,
      });
      return response.statusCode == 200;
    } catch (e) {
      print('Error unfollowing provider: $e');
      return false;
    }
  }
}
