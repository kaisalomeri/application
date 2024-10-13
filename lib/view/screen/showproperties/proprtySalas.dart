import 'package:application_aqars/function/chingpages.dart';
import 'package:flutter/material.dart';
import '../../../servers/server/ApiService.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:application_aqars/view/widgets/PopupMenu.dart';
import 'package:application_aqars/view/widgets/butfilter.dart';
import 'package:application_aqars/view/widgets/rowproperties.dart';
import '../../../model/server/apartmentall.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:math';
import 'package:application_aqars/model/server/real-estates-all.dart';
import 'package:application_aqars/model/server/users-all.dart';

import 'package:application_aqars/servers/server/follbutton.dart';

import 'package:application_aqars/servers/server/LikeButton.dart';
import 'package:application_aqars/view/screen/showproperties/apartments.dart';

class ProprtySalas extends StatefulWidget {
  ProprtySalas();

  @override
  _ProprtySalasState createState() => _ProprtySalasState();
}

class _ProprtySalasState extends State<ProprtySalas> {
  bool isDarkMode = false; // متغير للتحكم في المظهر
  // تعريف futureData كـ Future<Map<String, dynamic>>
  late Future<Map<String, dynamic>> futureData;
  final ApiService _apiService = ApiService();
  @override
  void initState() {
    super.initState();
    futureData = fetchAllData(); // استدعاء fetchAllData عند بدء الحالة
  }

  // دالة البحث
 
  Future<Map<String, dynamic>> fetchAllData() async {
    ApiService apiService = ApiService();
    try {
      var data = await apiService.getProprtySala();
      return data;
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load data');
    }
  }

  void navigateToDetails(int id) {
    Navigator.pushNamed(context, '/detailsproprty', arguments: id);
  }
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 4,
      actions: [
        buildNotificationIcon(),
        buildPopupMenuButton(context, isDarkMode, (value) {
          setState(() {
            isDarkMode = value;
          });
        }),
      ],
      title: buildAppBarTitle(),
      flexibleSpace: buildAppBarGradient(),
    );
  }

  IconButton buildNotificationIcon() {
    return IconButton(
      icon: const Icon(Icons.notifications, color: Colors.white),
      onPressed: () {
        // Handle notification icon press
      },
    );
  }

  Padding buildAppBarTitle() {
    return const Padding(
      padding: EdgeInsets.only(right: 25.0),
      child: Text(
        'بيع',
        textAlign: TextAlign.right,
        style: TextStyle(
          fontFamily: 'Cairo',
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }

  Container buildAppBarGradient() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF354B9F),
            Color(0xFF25346E),
            Color(0xFF25346E),
            Color(0xFF131B39),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<Map<String, dynamic>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data available'));
          }

          List<RealEstateAll> realEstates = snapshot.data!['realEstates'];
          List<UserAll> users = snapshot.data!['users'];

          return buildBody(context, realEstates, users);
        },
      ),
    );
  }

  Widget buildBody(BuildContext context, List<RealEstateAll> realEstates,
      List<UserAll> users) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildCategoryButtons(context),
          buildPostsList(realEstates, users),
        ],
      ),
    );
  }
}
