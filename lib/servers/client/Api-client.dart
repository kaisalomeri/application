// import 'package:dio/dio.dart';
// class ApiClient {
//   final Dio _dio = Dio();
//   Future<Response> registerUser(Map<String, dynamic>? userData) async {
//     // تأكد من أن endpoint والرابط صحيحان
//     String apiUrl = 'http://127.0.0.1:8000/api/register'; // رابط API
//     try {
//       // إرسال الطلب باستخدام Dio
//       Response response = await _dio.post(
//         apiUrl,
//         data: userData, // جسم الطلب
//         options: Options(
//           contentType: Headers.jsonContentType, // نوع المحتوى
//         ),
//       );

//       // التحقق من حالة الاستجابة
//       if (response.statusCode == 201) {
//         return response; // إعادة الاستجابة الناجحة
//       } else {
//         return Future.error('فشل في إنشاء الحساب: ${response.data}');
//       }
//     } on DioError catch (e) {
//       // معالجة الأخطاء من Dio
//       return Future.error(e.response?.data ?? 'خطأ في الاتصال');
//     }
//   }

//  Future<Response> login(String email, String password) async {
//   try {
//     Response response = await _dio.post(
//       'http://127.0.0.1:8000/api/login',
//       data: {'email': email, 'password': password},
//     );
//     return response;
//   } on DioError catch (e) {
//     return e.response!;
//   }
// }

//   Future<Response> getUserProfileData(String accesstoken) async {
//     try {
//       Response response = await _dio.get(
//         'https://api.loginradius.com/identity/v2/auth/account',
//         queryParameters: {'apikey': 'YOUR_API_KEY'},
//         options: Options(
//           headers: {
//             // 'Authorization': 'Bearer ${YOUR_ACCESS_TOKEN}',
//           },
//         ),
//       );
//       return response.data;
//     } on DioError catch (e) {
//       return e.response!.data;
//     }
//   }

//   Future<Response> logout(String accessToken) async {
//     try {
//       Response response = await _dio.get(
//         'https://api.loginradius.com/identity/v2/auth/access_token/InValidate',
//         // queryParameters: {'apikey': ApiSecret.apiKey},
//         options: Options(
//           headers: {'Authorization': 'Bearer $accessToken'},
//         ),
//       );
//       return response.data;
//     } on DioError catch (e) {
//       return e.response!.data;
//     }
//   }
// }
import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();

  final String baseUrl = 'http://127.0.0.1:8000/api';

  // دالة للتسجيل
  Future<Response?> registerUser(Map<String, dynamic>? userData) async {
    try {
      Response response = await _dio.post(
        '$baseUrl/register',
        data: {userData
       
        },
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );
      return response;
    } on DioError catch (e) {
      return e.response ?? Future.error('خطأ في الاتصال');
    }
  }

  // دالة لتسجيل الدخول
  Future<Response?> loginUser(String email, String password) async {
    try {
      Response response = await _dio.post(
        '$baseUrl/login',
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );
      return response;
    } on DioError catch (e) {
      return e.response ?? Future.error('خطأ في الاتصال');
    }
  }

  // جلب بيانات المستخدم بعد تسجيل الدخول
  Future<Response?> getUserProfileData(String accessToken) async {
    try {
      Response response = await _dio.get(
        '$baseUrl/user',
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
      );
      return response;
    } on DioError catch (e) {
      return e.response ?? Future.error('خطأ في الاتصال');
    }
  }

  // دالة لتسجيل الخروج
  Future<Response?> logout(String accessToken) async {
    try {
      Response response = await _dio.post(
        '$baseUrl/logout',
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
      );
      return response;
    } on DioError catch (e) {
      return e.response ?? Future.error('خطأ في الاتصال');
    }
  }
}
