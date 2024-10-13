import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../servers/server/LikeButton.dart'; // تأكد من تضمين ملف زر المفضلة

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<Map<String, dynamic>> favoriteProperties = [];
  bool isLoading = true;
  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    fetchFavoriteProperties();
  }

  // دالة لجلب العقارات المفضلة
  Future<void> fetchFavoriteProperties() async {
    setState(() {
      isLoading = true;
    });

    var url = 'http://127.0.0.1:8000/api/favorites'; // رابط API Laravel

    try {
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        setState(() {
          favoriteProperties = List<Map<String, dynamic>>.from(response.data);
        });
      } else {
        print('Failed to load favorite properties');
      }
    } catch (error) {
      print('Error: $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // دالة لتحديث حالة المفضلة
  void updateFavoriteStatus(bool isFavorited, int advertisementId) {
    setState(() {
      if (isFavorited) {
        favoriteProperties.add({'id': advertisementId}); // إضافة العقار للمفضلة
      } else {
        favoriteProperties.removeWhere((property) => property['id'] == advertisementId); // إزالة العقار من المفضلة
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('العقارات المفضلة'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: favoriteProperties.length,
              itemBuilder: (context, index) {
                final property = favoriteProperties[index];
                return ListTile(
                  title: Text(property['name']),
                  subtitle: Text('السعر: ${property['price']}'),
                  trailing: LikeButton(
                    advertisementId: property['id'],
                    userId: 1,
                  ),
                );
              },
            ),
    );
  }
}
