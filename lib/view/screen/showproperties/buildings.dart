import 'package:application_aqars/function/chingpages.dart';
import 'package:application_aqars/model/client/real-estateandusers.dart';
import 'package:flutter/material.dart';
import '../../../servers/server/ApiService.dart';
import 'package:cached_network_image/cached_network_image.dart';  

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:application_aqars/view/widgets/PopupMenu.dart';
import 'package:application_aqars/view/widgets/butfilter.dart';
import 'package:application_aqars/view/widgets/rowproperties.dart';
import 'package:application_aqars/servers/server/LikeButton.dart';
import 'package:application_aqars/servers/server/follbutton.dart';

import '../../../model/server/apartmentall.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:math';

class BuildingsPage extends StatefulWidget {
  const BuildingsPage({super.key});

  @override
  _BuildingsPageState createState() => _BuildingsPageState();
}

class _BuildingsPageState extends State<BuildingsPage> {
  bool isDarkMode = false;
  int _currentIndex = 2;
  bool isLiked = false;

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: buildAppBar(context),
  //     body: buildBody(),
  //     bottomNavigationBar: buildBottomNavigationBar(
  //         context, _currentIndex), // استدعاء الدالة لبناء الشريط السفلي
  //   );
  // }

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
      var data = await apiService.getRealEstateDataBuilding();
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
        'المبنى',
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
      body: FutureBuilder<Map<String, dynamic>>(
        future: futureData, // البيانات المنتظرة من دالة جلب البيانات
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child:
                    CircularProgressIndicator()); // مؤشر التحميل أثناء جلب البيانات
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
                    'خطأ: ${snapshot.error}')); // عرض رسالة خطأ إذا حدثت مشكلة
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
                child: Text(
                    'لا توجد بيانات متاحة')); // عرض رسالة عند عدم وجود بيانات
          }

          // بيانات العقارات والمستخدمين
          List<RealEstateApartment> realEstates = snapshot.data!['realEstates'];
          List<UserApartment> users = snapshot.data!['users'];

          return buildBody(
              context, realEstates, users); // بناء الجسم الرئيسي لواجهة التطبيق
        },
      ),
    );
  }

  Widget buildBody(BuildContext context, List<RealEstateApartment> realEstate,
      List<UserApartment> users) {
    return Scaffold(
      appBar: buildAppBar(), // استدعاء دالة بناء الـ AppBar
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            buildCategoryButtons(context), // استدعاء دالة بناء الأزرار العلوية
            const SizedBox(height: 16.0),
            buildFilterButtons(),
            const SizedBox(height: 16.0),
            buildActionButtons(), // استدعاء دالة بناء أزرار "عشوائي" و "متابعة"
            buildNewSectionTitle(), // استدعاء دالة بناء عنوان قسم "الجديد"
            buildPostsList(realEstate,
                users), // قائمة العقارات (تأكد من تمرير البيانات الصحيحة)
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(
          context, _currentIndex), // استدعاء الدالة لبناء الشريط السفلي
    );
  }

  Widget buildNewSectionTitle() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          'الجديد',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF000000).withOpacity(0.67),
          ),
        ),
      ),
    );
  }

  // بناء قائمة العقارات
  // بناء قائمة العقارات
  Widget buildPostsList(
      List<RealEstateApartment> realEstates, List<UserApartment> users) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // منع التمرير الداخلي
      itemCount: realEstates.length,
      itemBuilder: (context, index) {
        return buildPostItem(
            realEstates[index], users[index]); // بناء عنصر العقار الواحد
      },
    );
  }

// دالة لبناء عنصر منشور واحد
  Widget buildPostItem(RealEstateApartment estate, UserApartment user) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  // استدعاء الدالة مع تمرير رقم العقار
                  navigateToDetails(estate.id);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SizedBox(
                    width: 100, // عرض الصورة
                    height: 100, // ارتفاع الصورة
                    child: Image.network(
                      estate.attachments.isNotEmpty
                          ? estate.attachments[0].filePath
                          : 'assets/images/default_image.jpg', // صورة افتراضية
                      fit: BoxFit.cover, // جعل الصورة تغطي المساحة المحددة
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              // العمود الذي يحتوي على النصوص
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // السعر
                    Text(
                      '${estate.price}', // السعر
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    // العنوان والتفاصيل الأخرى
                    Text(
                      estate.boundaries, // العنوان
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text('المساحة: ${estate.status}'), // المساحة
                    Text('${estate.location}'), // الموقع
                  ],
                ),
              ),
              LikeButton(
                  advertisementId: estate.id, userId: user.id), // زر الإعجاب
            ],
          ),
          const SizedBox(height: 15.0),
          // تفاصيل المزود وأزرار الإجراءات
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // معلومات المزود (صورة، تقييم، موقع)
              Flexible(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          const AssetImage('assets/images/app1.jpeg'),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 15,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 18, 82, 135),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 10,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              SizedBox(width: 4.0),
                              Text(estate.advertisement.likesCount.toString()),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            user.name, // استخدام اسم المستخدم
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.share, color: Colors.blue),
                onPressed: () {
                  Share.share(
                    'ا��تراكك في العقار ${estate.boundaries}',
                   // url للعقار
                  );
                },
              ),
              // زر المتابعة
              FollowButton(
                userId: user.id, // userId من قائمة المستخدمين
                providerId: estate
                    .advertisement.providerId, // providerId من بيانات العقار
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'يوليو 5',
              style: TextStyle(color: Color(0xFF6A7380)),
            ),
          ),
        ],
      ),
    );
  }
}
