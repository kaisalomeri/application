import 'package:application_aqars/model/server/apartmentall.dart';
import 'package:dio/dio.dart';
import '../../model/server/real-estates-all.dart';
import '../../model/server/real-estates.dart';

import '../../model/server/users-all.dart';

import '../../model/server/users.dart';

class ApiService {
  final Dio dio = Dio();

  ApiService() {
    dio.options.headers['Accept'] = '*/*';
    dio.options.headers['User-Agent'] =
        'Thunder Client (https://www.thunderclient.com)';
  }
  // Function to fetch real estate by ID
  Future<Map<String, dynamic>> fetchRealEstate(int id) async {
    try {
      // Sending a GET request using Dio
      final response =
          await dio.get('http://127.0.0.1:8000/api/real-estates/$id');

      // Checking response status
      if (response.statusCode == 200) {
        print(response.data); // Print response for verification

        // Assuming the response contains both realEstate and user objects
        var jsonData = response.data;
        return {
          'realEstate': RealEstate.fromJson(jsonData['realEstate']),
          'user': User.fromJson(jsonData['user']),
        };
      } else {
        throw Exception('Failed to load data: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      throw Exception('Connection error: ${e.message}');
    }
  }

  Future<Map<String, dynamic>> Profile(int id) async {
    try {
      // Sending a GET request using Dio
      final response = await dio.get('http://127.0.0.1:8000/api/profile/$id');

      // Checking response status
      if (response.statusCode == 200) {
        print(response.data); // Print response for verification

        // Assuming the response contains both realEstate and user objects
        var jsonData = response.data;
        return {
          'realEstate': RealEstate.fromJson(jsonData['realEstate']),
          'user': User.fromJson(jsonData['user']),
        };
      } else {
        throw Exception('Failed to load data: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      throw Exception('Connection error: ${e.message}');
    }
  }

  Future<Map<String, dynamic>> fetchRealEstateFavrite(int id) async {
    try {
      // Sending a GET request using Dio
      final response = await dio.get('http://127.0.0.1:8000/api/like/$id');

      // Checking response status
      if (response.statusCode == 200) {
        print(response.data); // Print response for verification

        // Assuming the response contains both realEstate and user objects
        var jsonData = response.data;
        return {
          'realEstate': RealEstate.fromJson(jsonData['realEstate']),
          'user': User.fromJson(jsonData['user']),
        };
      } else {
        throw Exception('Failed to load data: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      throw Exception('Connection error: ${e.message}');
    }
  }

  Future<Map<String, dynamic>> fetchAllRealEstates() async {
    try {
      // إرسال طلب GET باستخدام Dio لجلب كل البيانات
      final response = await dio.get('http://127.0.0.1:8000/api/real-estates');

      // التحقق من حالة الاستجابة
      if (response.statusCode == 200) {
        print(response.data); // طباعة الاستجابة للتأكد

        // افتراض أن الاستجابة تحتوي على كائنات realEstates و users
        var jsonData = response.data;

        // التحقق من وجود المفاتيح في jsonData
        if (jsonData.containsKey('realEstates') &&
            jsonData.containsKey('users')) {
          // تحويل بيانات العقارات والمستخدمين إلى كائنات Dart
          List<RealEstateAll> realEstates = (jsonData['realEstates'] as List)
              .map((realEstateJson) => RealEstateAll.fromJson(realEstateJson))
              .toList();

          List<UserAll> users = (jsonData['users'] as List)
              .map((userJson) => UserAll.fromJson(userJson))
              .toList();

          // إرجاع قائمة العقارات والمستخدمين
          return {
            'realEstates': realEstates,
            'users': users,
          };
        } else {
          throw Exception('Invalid JSON structure: Missing keys');
        }
      } else {
        throw Exception('Failed to load data: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      throw Exception('Connection error: ${e.message}');
    }
  }

  Future<void> sendRealEstateData(Map<String, dynamic> data) async {
    try {
      final response = await dio.post(
        'http://127.0.0.1:8000/api/real-estates', // رابط API الخاص بك
        data: data,
      );
      if (response.statusCode == 200) {
        print('Data sent successfully');
      } else {
        print('Failed to send data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending data: $e');
    }
  }

  // Future<List<RealEstateAll>> searchProperties(String searchQuery) async {
  //   try {
  //     // استدعاء API وإرسال استعلام البحث
  //     Response response = await dio.get(
  //       'http://127.0.0.1:8000/api/search-real-estates',
  //       queryParameters: {'search': searchQuery},
  //     );
  //     // تأكد من أن الحالة 200 (نجاح)
  //     if (response.statusCode == 200) {
  //       // تحويل البيانات المستلمة إلى قائمة من العقارات
  //       List<RealEstateAll> properties = (response.data['data'] as List)
  //           .map((property) => RealEstateAll.fromJson(property))
  //           .toList();
  //       return properties;
  //     } else {
  //       throw Exception('فشل في استدعاء البيانات: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('خطأ: $e');
  //     throw e; // قد ترغب في تحسين إدارة الأخطاء هنا
  //   }
  // }

  Future<Map<String, List<dynamic>>> getRealEstateDataApartment() async {
    try {
      final response =
          await Dio().get('http://127.0.0.1:8000/api/indexapartment');

      if (response.statusCode == 200) {
        print(response.data); // طباعة الاستجابة للتأكد من البيانات

        var jsonData = response.data;

        // التحقق من أن jsonData يحتوي على البيانات المطلوبة
        if (jsonData.containsKey('realEstates') &&
            jsonData.containsKey('users')) {
          // تحويل بيانات العقارات والمستخدمين إلى كائنات Dart
          List<RealEstateApartment> realEstates =
              (jsonData['realEstates'] as List)
                  .map((realEstateJson) =>
                      RealEstateApartment.fromJson(realEstateJson))
                  .toList();

          List<UserApartment> users = (jsonData['users'] as List)
              .map((userJson) => UserApartment.fromJson(userJson))
              .toList();

          // إرجاع البيانات على شكل خريطة
          return {
            'realEstates': realEstates,
            'users': users,
          };
        } else {
          throw Exception('Missing required data in response');
        }
      } else {
        throw Exception('Failed to load data: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      throw Exception('Connection error: ${e.message}');
    }
  }

  Future<Map<String, dynamic>> getRealEstateDataLand() async {
    try {
      final response = await Dio().get('http://127.0.0.1:8000/api/indexland');

      if (response.statusCode == 200) {
        print(response.data); // طباعة الاستجابة للتأكد من البيانات

        var jsonData = response.data;

        // التحقق من أن jsonData يحتوي على البيانات المطلوبة
        if (jsonData.containsKey('realEstates') &&
            jsonData.containsKey('users')) {
          // تحويل بيانات العقارات والمستخدمين إلى كائنات Dart
          List<RealEstateApartment> realEstates =
              (jsonData['realEstates'] as List)
                  .map((realEstateJson) =>
                      RealEstateApartment.fromJson(realEstateJson))
                  .toList();

          List<UserApartment> users = (jsonData['users'] as List)
              .map((userJson) => UserApartment.fromJson(userJson))
              .toList();

          // إرجاع البيانات على شكل خريطة
          return {
            'realEstates': realEstates,
            'users': users,
          };
        } else {
          throw Exception('Missing required data in response');
        }
      } else {
        throw Exception('Failed to load data: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      throw Exception('Connection error: ${e.message}');
    }
  }

  Future<Map<String, dynamic>> getRealEstateDataBuilding() async {
    try {
      // إرسال طلب GET لجلب بيانات المباني
      final response = await dio.get('http://127.0.0.1:8000/api/indexbuilding');

      // التحقق من حالة الاستجابة
      if (response.statusCode == 200) {
        print(response.data); // طباعة الاستجابة للتأكد

        // افتراض أن الاستجابة تحتوي على كائنات realEstates و users
        var jsonData = response.data;

        // تحويل بيانات العقارات والمستخدمين إلى كائنات Dart
        List<RealEstateApartment> realEstates =
            (jsonData['realEstates'] as List)
                .map((realEstateJson) =>
                    RealEstateApartment.fromJson(realEstateJson))
                .toList();

        List<UserApartment> users = (jsonData['users'] as List)
            .map((userJson) => UserApartment.fromJson(userJson))
            .toList();

        // إرجاع قائمة العقارات والمستخدمين
        return {
          'realEstates': realEstates,
          'users': users,
        };
      } else {
        throw Exception('Failed to load data: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      throw Exception('Connection error: ${e.message}');
    }
  }

  Future<Map<String, dynamic>> getProprtyRent() async {
    try {
      // إرسال طلب GET لجلب بيانات المباني
      final response =
          await dio.get('http://127.0.0.1:8000/api/showAllRentals');

      // التحقق من حالة الاستجابة
      if (response.statusCode == 200) {
        print(response.data); // طباعة الاستجابة للتأكد

        // افتراض أن الاستجابة تحتوي على كائنات realEstates و users
        var jsonData = response.data;

        // تحويل بيانات العقارات والمستخدمين إلى كائنات Dart
        List<RealEstateAll> realEstates = (jsonData['realEstates'] as List)
            .map((realEstateJson) => RealEstateAll.fromJson(realEstateJson))
            .toList();

        List<UserAll> users = (jsonData['users'] as List)
            .map((userJson) => UserAll.fromJson(userJson))
            .toList();

        // إرجاع قائمة العقارات والمستخدمين
        return {
          'realEstates': realEstates,
          'users': users,
        };
      } else {
        throw Exception('Failed to load data: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      throw Exception('Connection error: ${e.message}');
    }
  }

  Future<Map<String, dynamic>> getProprtySala() async {
    try {
      // إرسال طلب GET لجلب بيانات المباني
      final response = await dio.get('http://127.0.0.1:8000/api/showAllSalas');

      // التحقق من حالة الاستجابة
      if (response.statusCode == 200) {
        print(response.data); // طباعة الاستجابة للتأكد

        // افتراض أن الاستجابة تحتوي على كائنات realEstates و users
        var jsonData = response.data;

        // تحويل بيانات العقارات والمستخدمين إلى كائنات Dart
        List<RealEstateAll> realEstates = (jsonData['realEstates'] as List)
            .map((realEstateJson) => RealEstateAll.fromJson(realEstateJson))
            .toList();

        List<UserAll> users = (jsonData['users'] as List)
            .map((userJson) => UserAll.fromJson(userJson))
            .toList();

        // إرجاع قائمة العقارات والمستخدمين
        return {
          'realEstates': realEstates,
          'users': users,
        };
      } else {
        throw Exception('Failed to load data: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      throw Exception('Connection error: ${e.message}');
    }
  }
  // Future<List<dynamic>> searchRealEstates(String searchQuery) async {
  //   try {
  //     final response = await dio.get('http://127.0.0.1:8000/api/searchrealestates', queryParameters: {
  //       'search': searchQuery,
  //     });
  //     return response.data; // استرجاع البيانات من الاستجابة
  //   } catch (e) {
  //     print('Error: $e');
  //     return [];
  //   }
  // }

//   Future<List<RealEstateAll>> fetchRealEstatessearch() async {
//   try {
//     // استبدل بـ API الخاص بك
//     final response = await dio.get('http://127.0.0.1:8000/api/searchrealestates');

//     if (response.statusCode == 200) {
//       // إذا كانت الاستجابة ناجحة، نقوم بتحويلها إلى قائمة من الكائنات
//       List<dynamic> jsonData = response.data;
//       return jsonData.map((item) => RealEstateAll.fromJson(item)).toList();
//     } else {
//       // إذا كان هناك خطأ، نرمي استثناء
//       throw Exception('فشل في جلب بيانات العقارات: ${response.statusCode}');
//     }
//   } on DioError catch (e) {
//     // في حال حدوث خطأ في Dio، نقوم بإدارة الخطأ
//     throw Exception('فشل في جلب بيانات العقارات: ${e.message}');
//   }
// }

  Future<Map<String, dynamic>> searchRealEstates(String query) async {
    // تأكد من تشفير query لتجنب مشاكل في تنسيق URL
    final encodedQuery = Uri.encodeQueryComponent(query);
    final response = await dio
        .get('http://127.0.0.1:8000/api/searchrealestates?query=$encodedQuery');

    // التحقق من حالة الاستجابة
    if (response.statusCode == 200) {
      print(response.data); // طباعة الاستجابة للتأكد

      // افتراض أن الاستجابة تحتوي على كائنات realEstates و users
      var jsonData = response.data;

      // تحويل بيانات العقارات والمستخدمين إلى كائنات Dart
      List<RealEstateAll> realEstates = (jsonData['realEstates'] as List)
          .map((realEstateJson) => RealEstateAll.fromJson(realEstateJson))
          .toList();

      List<UserAll> users = (jsonData['users'] as List)
          .map((userJson) => UserAll.fromJson(userJson))
          .toList();

      // إرجاع قائمة العقارات والمستخدمين
      return {
        'realEstates': realEstates,
        'users': users,
      };
    } else {
      throw Exception('Failed to load data: ${response.statusMessage}');
    }
  }

  Future<User?> fetchUserProfile(int userId) async {
    final Dio dio = Dio(); // إنشاء مثيل من Dio

    try {
      final response =
          await dio.get('http://127.0.0.1:8000/api/user-profile/$userId');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data =
            response.data; // الحصول على البيانات من الاستجابة
        return User.fromJson(data['user']);
      } else {
        throw Exception('Failed to load user profile');
      }
    } catch (e) {
      print('Error: $e'); // تسجيل الخطأ
      return null; // يمكن إرجاع null إذا حدث خطأ
    }
  }

  // Future<Map<String, dynamic>> fetchProfileall() async {
  //   try {
  //     // إرسال طلب GET باستخدام Dio لجلب كل البيانات
  //     final response = await dio.get('http://127.0.0.1:8000/api/real-estates');

  //     // التحقق من حالة الاستجابة
  //     if (response.statusCode == 200) {
  //       print(response.data); // طباعة الاستجابة للتأكد

  //       // افتراض أن الاستجابة تحتوي على كائنات realEstates و users
  //       var jsonData = response.data;

  //       // تحويل بيانات العقارات والمستخدمين إلى كائنات Dart
  //       List<RealEstateAll> realEstates = (jsonData['realEstates'] as List)
  //           .map((realEstateJson) => RealEstateAll.fromJson(realEstateJson))
  //           .toList();

  //       List<UserAll> users = (jsonData['users'] as List)
  //           .map((userJson) => UserAll.fromJson(userJson))
  //           .toList();

  //       // إرجاع قائمة العقارات والمستخدمين
  //       return {
  //         'realEstates': realEstates,
  //         'users': users,
  //       };
  //     } else {
  //       throw Exception('Failed to load data: ${response.statusMessage}');
  //     }
  //   } on DioError catch (e) {
  //     throw Exception('Connection error: ${e.message}');
  //   }
  // }

  Future<Map<String, dynamic>> fetchprofileuserandprovider(int id) async {
    try {
      // Sending a GET request using Dio
      final response =
          await dio.get('http://127.0.0.1:8000/api/profileuser/$id');

      // Checking response status
      if (response.statusCode == 200) {
        print(response.data); // Print response for verification

        // Assuming the response contains both realEstate and user objects
        var jsonData = response.data;
        return {
          'realEstate': RealEstate.fromJson(jsonData['realEstate']),
          'user': User.fromJson(jsonData['user']),
        };
      } else {
        throw Exception('Failed to load data: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      throw Exception('Connection error: ${e.message}');
    }
  }

  Future<List<dynamic>> getFavorites(int userId) async {
    try {
      final response =
          await dio.get('http://127.0.0.1:8000/api/favorites/$userId');

      if (response.statusCode == 200) {
        return response.data; // إرجاع بيانات المفضلات
      } else {
        print('Error: ${response.statusCode} - ${response.data}');
        return [];
      }
    } catch (e) {
      print('Exception: $e');
      return [];
    }
  }

  //  Future<void> toggleLike(int advertisementId, int userId) async {
  //   try {
  //     final response = await dio.post('http://127.0.0.1:8000/api/favorites/toggle', data: {
  //       'advertisement_id': advertisementId,
  //       'user_id': userId,
  //     });

  //     if (response.statusCode == 200) {
  //       print(response.data); // طباعة النتيجة
  //     } else {
  //       print('Error: ${response.statusCode} - ${response.data}');
  //     }
  //   } catch (e) {
  //     print('Exception: $e');
  //   }
  // }
}
