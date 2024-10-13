import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../../model/server/help.dart';
class SupportPage extends StatelessWidget {
  final Dio dio = Dio(); // تأكد من إعداد Dio هنا
  final String apiUrl = 'http://127.0.0.1:8000/api/help';

  SupportPage({super.key});

  Future<List<Help>> fetchHelp() async {
    try {
      final response = await dio.get(apiUrl);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مساعدة ودعم'),
      ),
      body: FutureBuilder<List<Help>>(
        future: fetchHelp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('حدث خطأ: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final helpList = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: helpList.length,
              itemBuilder: (context, index) {
                final help = helpList[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          help.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          help.content,
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
