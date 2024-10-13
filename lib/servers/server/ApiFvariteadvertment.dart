import '../../model/server/favriteandadvertment.dart';
import 'package:dio/dio.dart';
import '../../model/server/users.dart';
import '../../model/server/about.dart';
import '../../model/server/help.dart';
import '../../model/server/seting.dart';
class ApiServices {
  final Dio dio = Dio();
  Future<List<Advertisement>> fetchAdvertisements(int userId) async {
    try {
      var dio = Dio();
      final response =
          await dio.get('http://127.0.0.1:8000/api/favorites/$userId');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((advert) => Advertisement.fromJson(advert)).toList();
      } else {
        throw Exception('Failed to load advertisements');
      }
    } catch (e) {
      print(e);
      throw Exception('Error fetching advertisements');
    }
  }

  Future<User?> fetchUserProfile(int userId) async {
    try {
      final response =
          await dio.get('http://127.0.0.1:8000/api/profleuser/$userId');

      print(
          'Response data: ${response.data}'); // طباعة البيانات التي تم استلامها

      if (response.statusCode == 200) {
        // الوصول إلى البيانات داخل كائن "user"
        Map<String, dynamic> data = response.data['user'];
        return User.fromJson(data);
      } else {
        throw Exception('Failed to load user profile');
      }
    } catch (e) {
      print('Error details: $e'); // طباعة تفاصيل الخطأ بشكل أوضح
      return null; // يجب إرجاع null في حالة حدوث خطأ
    }
  }

  Future<List<About>> fetchAbout() async {
    try {
      final response = await dio
          .get('http://127.0.0.1:8000/api/about'); // تأكد من أن الرابط صحيح
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];
        return data.map((json) => About.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load About data');
      }
    } catch (e) {
      print('Error: $e');
      return []; // إرجاع قائمة فارغة في حالة الخطأ
    }
  }

  Future<List<Help>> fetchHelp() async {
    try {
      final response = await dio
          .get('http://127.0.0.1:8000/api/help'); // تأكد من أن الرابط صحيح
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];
        return data.map((json) => Help.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load Help data');
      }
    } catch (e) {
      print('Error: $e');
      return []; // إرجاع قائمة فارغة في حالة الخطأ
    }
  }

  Future<List<Setting>> fetchSettings() async {
    try {
      final response = await dio
          .get('http://127.0.0.1:8000/api/settings'); // تأكد من أن الرابط صحيح
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];
        return data.map((json) => Setting.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load settings data');
      }
    } catch (e) {
      print('Error: $e');
      return []; // إرجاع قائمة فارغة في حالة الخطأ
    }
  }
}
