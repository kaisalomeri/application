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

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:math'; // تأكد من استيراد المكتبة للتوليد العشوائي

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDarkMode = false;
  // late Future<Map<String, dynamic>> futureData;
  final TextEditingController _searchController = TextEditingController();
  final ApiService apiService = ApiService();
  late Future<Map<String, dynamic>> searchResults; // لتخزين نتائج البحث

  @override
  void initState() {
    super.initState();
    searchResults = fetchAllData(); // استدعاء fetchAllData عند بدء الحالة
  }

//   // جلب جميع البيانات عند بدء الحالة
  Future<Map<String, dynamic>> fetchAllData() async {
    try {
      // استدعاء الدالة للحصول على جميع البيانات (بدون بحث)
      var data = await apiService.searchRealEstates(_searchController.text.trim());
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
      appBar: buildAppBar(),
      body: FutureBuilder<Map<String, dynamic>>(
        future: searchResults,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, color: Colors.red, size: 60),
                  const SizedBox(height: 16),
                  Text(
                    'Error: ${snapshot.error}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('Please try again later.'),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: Text(
                'No data available',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          List<RealEstateAll> realEstates = snapshot.data!['realEstates'];
          List<UserAll> users = snapshot.data!['users'];

          if (realEstates.isEmpty && users.isEmpty) {
            return const Center(
              child: Text(
                'No results found',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

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
          buildCarouselSlider(realEstates, users),
          buildSearchAndFilterRow(),
          buildCategoryButtons(context),
          buildNewLabel(),
          buildPostsList(realEstates, users),
        ],
      ),
    );
  }

  Widget buildSearchAndFilterRow() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          buildSearchField(),
          const SizedBox(width: 16.0),
          // يمكنك إضافة زر فلتر هنا إذا أردت
        ],
      ),
    );
  }

  Widget buildSearchField() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                                   icon: Icon(Icons.search),

                  hintText: 'البحث عن...',
                  border: InputBorder.none,
                ),
                onSubmitted: (value) {
                  _performSearch(value);
                },
              ),
            ),
            // Padding(
            //   padding:
            //       const EdgeInsets.only(right: 18.0), // إضافة مسافة قبل زر البحث
            //   child: IconButton(
            //     icon: Icon(Icons.search),
            //     onPressed: () {
            //       String searchValue = _searchController.text;
            //       _performSearch(searchValue);
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void _performSearch(String value) {
    if (value.isNotEmpty) {
      print('تم البحث عن: $value');
      searchResults = ApiService().searchRealEstates(value); // استدعاء دالة البحث
      searchResults.then((data) {
        if (data.isEmpty) {
          // لا توجد بيانات
          showNoDataMessage(value);
        } else {
          // عرض البيانات
          print('تم العثور على بيانات: ${data.length} نتيجة');
        }
      });
    } else {
      print('لم يتم إدخال نص للبحث.');
    }
    setState(() {}); // تحديث الحالة لإعادة بناء الواجهة
  }

  void showNoDataMessage(String searchValue) {
    // دالة لإظهار رسالة عدم العثور على بيانات
    final snackBar = SnackBar(
      content: Text(
        'لا توجد بيانات تطابق "$searchValue".',
        style: TextStyle(fontSize: 16.0),
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
    );

    // عرض Snackbar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget buildCarouselSlider(
      List<RealEstateAll> realEstates, List<UserAll> users) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 280,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: realEstates.map((estate) {
        return buildCarouselItem(estate, users); // تمرير المستخدمين
      }).toList(),
    );
  }

  Widget buildCarouselItem(RealEstateAll estate, List<UserAll> users) {
    // البحث عن المستخدم باستخدام userId
    UserAll? user = users.firstWhere((user) => user.id == estate.advertisement.providerId,
        orElse: () =>
            UserAll(name: 'مستخدم غير معروف')); // تعديل بناءً على هيكل بياناتك

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: buildCarouselImage(
                estate.attachments, estate.id), // تمرير id العقار
          ),
          Expanded(
            flex: 2,
            child: buildCarouselDetails(estate, user),
          ),
        ],
      ),
    );
  }

  Widget buildCarouselImage(List<Attachment> attachments, int estateId) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          navigateToDetails(estateId); // الانتقال إلى تفاصيل العقار عند الضغط
        },
        child: Container(
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(attachments.isNotEmpty
                  ? attachments[0].filePath
                  : 'https://example.com/default_image.jpg'), // استخدام الصورة الافتراضية
              fit: BoxFit.cover,
            ),
          ),
          child: buildCarouselOverlayText(),
        ),
      ),
    );
  }

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

  Widget buildCarouselDetails(RealEstateAll estate, UserAll user) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildCarouselProfileRow(user),
          buildCarouselButton(estate),
        ],
      ),
    );
  }

  Widget buildCarouselProfileRow(UserAll user) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(
              'assets/images/app1.jpeg'), // تأكد من أن لديك رابط صورة الملف الشخصي
        ),
        const SizedBox(width: 10),
        buildRatingAndLocation(user),
      ],
    );
  }

  Widget buildRatingAndLocation(UserAll user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildStarRating(),
        SizedBox(height: 4),
        Text(
          user.name,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildStarRating() {
    return Row(
      children: List.generate((1 + Random().nextInt(5 - 1 + 1)), (index) {
        return const Icon(Icons.star, color: Colors.yellow);
      }),
    );
  }

  Widget buildCarouselButton(RealEstateAll estate) {
    return ElevatedButton(
      onPressed: () {
        navigateToDetails(estate.id);
      },
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

          // عرض نتائج البحث
  //         Expanded(
  //           child: FutureBuilder<Map<String, dynamic>>(
  //             future: _searchResults,
  //             builder: (context, snapshot) {
  //               if (snapshot.connectionState == ConnectionState.waiting) {
  //                 return Center(child: CircularProgressIndicator());
  //               } else if (snapshot.hasError) {
  //                 return Center(child: Text('حدث خطأ: ${snapshot.error}'));
  //               } else if (!snapshot.hasData ||
  //                   (snapshot.data!['realEstates'] as List).isEmpty) {
  //                 return Center(child: Text('لا توجد عقارات متاحة'));
  //               }

  //               List<RealEstateAll> realEstates = snapshot.data!['realEstates'];
  //               List<UserAll> users = snapshot.data!['users'];

  //               return buildResultsList(realEstates, users);
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:application_aqars/view/widgets/PopupMenu.dart';
// import 'package:application_aqars/view/widgets/butfilter.dart';
// import 'package:application_aqars/view/widgets/rowproperties.dart';
// import '../../servers/server/ApiService.dart';
// import '../../../model/server/real-estates-all.dart';
// import '../../../model/server/users-all.dart';
// import 'package:share_plus/share_plus.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   bool isDarkMode = false;
//   late Future<Map<String, dynamic>> futureData;
//   final TextEditingController _searchController = TextEditingController();
//   final ApiService apiService = ApiService();
//   Future<Map<String, dynamic>>? _searchResults;

//   @override
//   void initState() {
//     super.initState();
//     futureData = fetchAllData();
//   }

//   Future<Map<String, dynamic>> fetchAllData() async {
//     try {
//       var data = await apiService.fetchAllRealEstates();
//       return data;
//     } catch (e) {
//       print('Error: $e');
//       throw Exception('Failed to load data');
//     }
//   }

//   void navigateToDetails(int id) {
//     Navigator.pushNamed(context, '/detailsproprty', arguments: id);
//   }

//   void _searchRealEstates(String searchTerm) {
//     setState(() {
//       _searchResults = apiService.searchRealEstates(searchTerm);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(),
//       body: FutureBuilder<Map<String, dynamic>>(
//         future: _searchResults ?? futureData,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data == null) {
//             return Center(child: Text('No data available'));
//           }

//           List<RealEstateAll> realEstates = snapshot.data!['realEstates'];
//           List<UserAll> users = snapshot.data!['users'];

//           return buildBody(context, realEstates, users);
//         },
//       ),
//     );
//   }

//   AppBar buildAppBar() {
//     return AppBar(
//       backgroundColor: Colors.transparent,
//       elevation: 4,
//       actions: [
//         buildNotificationIcon(),
//         buildPopupMenuButton(context, isDarkMode, (value) {
//           setState(() {
//             isDarkMode = value;
//           });
//         }),
//       ],
//       title: buildAppBarTitle(),
//       flexibleSpace: buildAppBarGradient(),
//     );
//   }

//   IconButton buildNotificationIcon() {
//     return IconButton(
//       icon: const Icon(Icons.notifications, color: Colors.white),
//       onPressed: () {
//         // Handle notification icon press
//       },
//     );
//   }

//   Padding buildAppBarTitle() {
//     return const Padding(
//       padding: EdgeInsets.only(right: 25.0),
//       child: Text(
//         'الرئيسية',
//         textAlign: TextAlign.right,
//         style: TextStyle(
//           fontFamily: 'Cairo',
//           fontWeight: FontWeight.bold,
//           fontSize: 18,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }

//   Container buildAppBarGradient() {
//     return Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Color(0xFF354B9F),
//             Color(0xFF25346E),
//             Color(0xFF25346E),
//             Color(0xFF131B39),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildBody(BuildContext context, List<RealEstateAll> realEstates,
//       List<UserAll> users) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           buildCarouselSlider(realEstates, users),
//           buildSearchAndFilterRow(),
//           buildCategoryButtons(context),
//           buildNewLabel(),
//           buildPostsList(realEstates, users),
//         ],
//       ),
//     );
//   }

//   Widget buildCarouselSlider(
//       List<RealEstateAll> realEstates, List<UserAll> users) {
//     return CarouselSlider(
//       options: CarouselOptions(
//         height: 280,
//         autoPlay: true,
//         enlargeCenterPage: true,
//       ),
//       items: realEstates.map((estate) {
//         return buildCarouselItem(estate, users);
//       }).toList(),
//     );
//   }

//   Widget buildCarouselItem(RealEstateAll estate, List<UserAll> users) {
//     UserAll? user = users.firstWhere((user) => user.id == estate.cityId,
//         orElse: () => UserAll(name: 'مستخدم غير معروف'));

//     return Container(
//       width: MediaQuery.of(context).size.width,
//       child: Column(
//         children: [
//           Expanded(
//               flex: 4,
//               child: buildCarouselImage(estate.attachments, estate.id)),
//           Expanded(flex: 2, child: buildCarouselDetails(estate, user)),
//         ],
//       ),
//     );
//   }

//   Widget buildCarouselImage(List<Attachment> attachments, int estateId) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: GestureDetector(
//         onTap: () {
//           navigateToDetails(estateId);
//         },
//         child: Container(
//           width: double.infinity,
//           clipBehavior: Clip.antiAlias,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             image: DecorationImage(
//               image: NetworkImage(attachments.isNotEmpty
//                   ? attachments[0].filePath
//                   : 'https://example.com/default_image.jpg'),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: buildCarouselOverlayText(),
//         ),
//       ),
//     );
//   }

//   Widget buildCarouselOverlayText() {
//     return Container(
//       margin: const EdgeInsets.all(6),
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: const Color(0xFF354B9F).withOpacity(0.7),
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: const Text(
//         'سينتهي العرض بعد 24 ساعة',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 16.0,
//           fontWeight: FontWeight.bold,
//         ),
//         textAlign: TextAlign.left,
//       ),
//     );
//   }

//   Widget buildCarouselDetails(RealEstateAll estate, UserAll user) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           buildCarouselProfileRow(user),
//           buildCarouselButton(estate),
//         ],
//       ),
//     );
//   }

//   Widget buildCarouselProfileRow(UserAll user) {
//     return Row(
//       children: [
//         CircleAvatar(
//           backgroundImage: AssetImage('assets/images/app1.jpeg'),
//         ),
//         const SizedBox(width: 10),
//         buildRatingAndLocation(user),
//       ],
//     );
//   }

//   Widget buildRatingAndLocation(UserAll user) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         buildStarRating(),
//         SizedBox(height: 4),
//         Text(
//           user.name,
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget buildStarRating() {
//     return Row(
//       children: List.generate(1 + Random().nextInt(5 - 1 + 1), (index) {
//         return const Icon(Icons.star, color: Colors.yellow);
//       }),
//     );
//   }

//   Widget buildCarouselButton(RealEstateAll estate) {
//     return ElevatedButton(
//       onPressed: () {
//         navigateToDetails(estate.id);
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: const Color(0xFF354B9F),
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
//       ),
//       child: const Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text('الانتقال للعرض', style: TextStyle(color: Colors.white)),
//           SizedBox(width: 5.0),
//           Icon(Icons.arrow_forward, color: Colors.white),
//         ],
//       ),
//     );
//   }

//   Widget buildSearchAndFilterRow() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Row(
//         children: [
//           buildSearchField(),
//           const SizedBox(width: 16.0),
//         ],
//       ),
//     );
//   }

//   Expanded buildSearchField() {
//     return Expanded(
//       child: TextFormField(
//         controller: _searchController,
//         decoration: const InputDecoration(
//           hintText: 'ابحث عن العقارات',
//           prefixIcon: Icon(Icons.search),
//           border: OutlineInputBorder(),
//         ),
//         onFieldSubmitted: (value) {
//           _searchRealEstates(value); // إجراء البحث عند تقديم الحقل
//         },
//       ),
//     );
//   }

//   Widget buildNewLabel() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: const Text(
//         'العقارات الجديدة',
//         style: TextStyle(
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }

//   Widget buildPostsList(List<RealEstateAll> realEstates, List<UserAll> users) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       itemCount: realEstates.length,
//       itemBuilder: (context, index) {
//         return buildPostItem(realEstates[index], users);
//       },
//     );
//   }

//   Widget buildPostItem(RealEstateAll estate, List<UserAll> users) {
//     UserAll? user = users.firstWhere((user) => user.id == estate.cityId,
//         orElse: () => UserAll(name: 'مستخدم غير معروف'));

//     return GestureDetector(
//       onTap: () => navigateToDetails(estate.id),
//       child: Card(
//         margin: const EdgeInsets.all(8.0),
//         child: ListTile(
//           leading: buildPostImage(estate),
//           title: buildPostTitle(estate),
//           subtitle: buildPostSubtitle(user),
//         ),
//       ),
//     );
//   }

//   Widget buildPostImage(RealEstateAll estate) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(8.0),
//       child: Image.network(
//         estate.attachments.isNotEmpty
//             ? estate.attachments[0].filePath
//             : 'https://example.com/default_image.jpg',
//         width: 100,
//         height: 100,
//         fit: BoxFit.cover,
//       ),
//     );
//   }

//   Widget buildPostTitle(RealEstateAll estate) {
//     return Text(
//       estate.location,
//       style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//     );
//   }

//   Widget buildPostSubtitle(UserAll user) {
//     return Text(
//       user.name,
//       style: const TextStyle(fontSize: 14),
//     );
//   }

//   Widget buildCategoryButtons(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         ElevatedButton(
//           onPressed: () {},
//           child: const Text('الأكثر مشاهدة'),
//         ),
//         ElevatedButton(
//           onPressed: () {},
//           child: const Text('الأكثر طلباً'),
//         ),
//         ElevatedButton(
//           onPressed: () {},
//           child: const Text('الجديد'),
//         ),
//       ],
//     );
//   }
// }
