
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:application_aqars/view/widgets/PopupMenu.dart';
import 'package:application_aqars/view/widgets/butfilter.dart';
import 'package:application_aqars/view/widgets/rowproperties.dart';
import '../../servers/server/ApiService.dart';
import '../../../model/server/real-estates-all.dart';
import '../../../model/server/users-all.dart';
import 'package:share_plus/share_plus.dart'; 

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 4,
      actions: [
        buildNotificationIcon(), // أيقونة الإشعارات
        buildPopupMenuButton(context, isDarkMode, (value) {
          setState(() {
            isDarkMode = value;
          });
        }),
      ],
      title: buildAppBarTitle(), // عنوان الشريط العلوي
      flexibleSpace: buildAppBarGradient(), // خلفية الشريط العلوي مع تدرج لوني
    );
  }

  // دالة لبناء أيقونة الإشعارات
  IconButton buildNotificationIcon() {
    return IconButton(
      icon: const Icon(Icons.notifications, color: Colors.white),
      onPressed: () {
        // Handle notification icon press
      },
    );
  }

///////////////////////////////////////////////////////

  // دالة لبناء عنوان الـ AppBar
  Padding buildAppBarTitle() {
    return const Padding(
      padding: EdgeInsets.only(right: 25.0),
      child: Text(
        'الرئيسية',
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

  // دالة لبناء خلفية الـ AppBar المتدرجة
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

/////////////////////////////////////////////////////////

  // دالة لبناء الـ Body
  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildCarouselSlider(),
          buildSearchAndFilterRow(),
          buildCategoryButtons(context),
          buildNewLabel(),
          // buildPostsList(),
        ],
      ),
    );
  }

/////////////////////////////CarouselSlider/////////////////////

// دالة لبناء الـ CarouselSlider
  Widget buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 280, // يمكن التحكم في الارتفاع هنا
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: [1, 2, 3].map((i) {
        return buildCarouselItem();
      }).toList(),
    );
  }

// دالة لبناء عناصر الـ Carousel
  Widget buildCarouselItem() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
            flex: 4, // حدد التمدد للصورة
            child: buildCarouselImage(),
          ),
          Expanded(
            flex: 2, // حدد التمدد للتفاصيل
            child: buildCarouselDetails(),
          ),
        ],
      ),
    );
  }

// دالة لبناء صورة الـ Carousel
  Widget buildCarouselImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: const DecorationImage(
            image: AssetImage('assets/images/app1.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: buildCarouselOverlayText(), // النص المتراكب على الصورة
      ),
    );
  }

// دالة لبناء النص المتراكب على صورة الـ Carousel
  Widget buildCarouselOverlayText() {
    return Container(
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF354B9F).withOpacity(0.7),
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Text(
        'سينتهي العرض بعد 24 ساعة',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

// دالة لبناء تفاصيل الـ Carousel
  Widget buildCarouselDetails() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildCarouselProfileRow(), // صف يضم صورة شخصية وتفاصيل
          buildCarouselButton(), // زر أو إجراء معين)
        ],
      ),
    );
  }

  // دالة لبناء صف يحتوي على صورة الملف الشخصي والتقييم
  Widget buildCarouselProfileRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/app1.jpeg'),
          ),
          const SizedBox(width: 10),
          buildRatingAndLocation(),
        ],
      ),
    );
  }

  // دالة لبناء التقييم والموقع في الـ Carousel
  Widget buildRatingAndLocation() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildStarRating(),
            const Text('فرع اليمن'),
          ],
        ),
      ],
    );
  }

  // دالة لبناء التقييم النجمي
  Widget buildStarRating() {
    return Row(
      children: List.generate((1 + Random().nextInt(5 - 1 + 1)), (index) {
        return const Icon(Icons.star, color: Colors.yellow);
      }),
    );
  }

//   // دالة لبناء زر الانتقال للعرض
  Widget buildCarouselButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF354B9F),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('الانتقال للعرض', style: TextStyle(color: Colors.white)),
          SizedBox(width: 5.0),
          Icon(Icons.arrow_forward, color: Colors.white),
        ],
      ),
    );
  }

/////////////////////////////endCarouselSlider/////////////////////

///////////////sherch/////////////////////////////////////////

  // دالة لبناء صف البحث والتصفية
  Widget buildSearchAndFilterRow() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          buildSearchField(),
          const SizedBox(width: 16.0),
          buildFilterIcon(),
        ],
      ),
    );
  }

  // دالة لبناء مربع البحث
  Widget buildSearchField() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: 'البحث عن...',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }

  // دالة لبناء أيقونة التصفية
  IconButton buildFilterIcon() {
    return IconButton(
      icon: const Icon(Icons.filter_list),
      onPressed: () {
        // Handle filter icon press
      },
    );
  }

//////////////////////////////end////////

  // دالة لبناء عنوان "أحدث الإعلانات"
  Padding buildNewLabel() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
      child: Text(
        'أحدث الإعلانات',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
          fontFamily: 'Cairo',
        ),
      ),
    );
  }
}