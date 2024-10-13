import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../../model/server/about.dart';
class Aboutus extends StatelessWidget {
  final Dio dio = Dio(); // تأكد من إعداد Dio هنا
  final String apiUrl = 'http://127.0.0.1:8000/api/about';

  Aboutus({super.key});

  Future<List<About>> fetchAbout() async {
    try {
      final response = await dio.get(apiUrl);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('نبذة عنا'),
      ),
      body: FutureBuilder<List<About>>(
        future: fetchAbout(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('حدث خطأ: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final aboutList = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: aboutList.length,
              itemBuilder: (context, index) {
                final about = aboutList[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          about.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          about.content,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('لا توجد معلومات لعرضها.'));
          }
        },
      ),
    );
  }
}
