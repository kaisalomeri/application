import '../../../model/server/real-estates.dart';


import '../../../model/server/users.dart';
import 'package:flutter/material.dart';
// import '../../../../core/function/getDate.dart';

import 'package:share_plus/share_plus.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import '../../../../cservers/ApiService.dart';
// import '../../../../core/servers/server/ApiService.dart';
// import '../../../../core/servers/CommentSection.dart';
// import '../../../../core/class/CallButton.dart';
// import '../../../../core/servers/FavoriteButton.dart';
import '../../../constant/share/CallButton.dart';
import '../../../servers/server/ApiService.dart';
import '../../../servers/server/CommentSection.dart';
import '../../../servers/server/FavoriteButton.dart';


class RealEstateScreen extends StatefulWidget {
  @override
  _RealEstateScreenState createState() => _RealEstateScreenState();
}

class _RealEstateScreenState extends State<RealEstateScreen> {
  late Future<Map<String, dynamic>> futureData;
  late int propertyId; // معرف العقار

  bool isLoading = true;

  bool isDescriptionExpanded = false;

  late RealEstate realEstate;
  late User user;
 @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // استلام الرقم من الأرجومنت في didChangeDependencies بدلاً من initState
    propertyId = ModalRoute.of(context)!.settings.arguments as int;
    // تحميل بيانات العقار باستخدام الـ ID
    futureData = ApiService().fetchRealEstate(propertyId);
  }
// استدعاء الدالة هنا
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('التفاصيل', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0XFF354B9F),
                Color(0XFF25346E),
                Color(0XFF25346E),
                Color(0XFF131B39),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            icon:
                const Icon(Icons.close, color: Color.fromARGB(255, 22, 22, 22)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('خطأ: ${snapshot.error}'));
          } else {
            final realEstate = snapshot.data!['realEstate'] as RealEstate;
            final user = snapshot.data!['user'] as User;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Carousel for Images
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 250,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                      ),
                      items: realEstate.attachments.map((attachment) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(13),
                                child: Image.network(
                                  attachment.filePath,
                                  fit: BoxFit.cover,
                                  width: 1300,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  color:
                                      const Color.fromARGB(137, 131, 129, 129),
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        realEstate.price.toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        realEstate.status,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),

                    // Buttons Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Call Button

                        // Save Button
                        // FavoriteButton(propertyId: 1),
                        CallButton(phoneNumber: '123456789'),

                        // Share Button
                        IconButton(
                          icon: const Icon(Icons.share, color: Colors.black),
                          onPressed: () {
                            // النص أو الرابط الذي ترغب في مشاركته
                            final String textToShare =
                                'تحقق من هذا المحتوى الرائع!';
                            Share.share(textToShare);
                          },
                        )
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Chat Button (Full width)
                    // ElevatedButton.icon(
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: const Color(0XFF354B9F),
                    //     minimumSize: const Size(double.infinity, 40),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //     elevation: 4,
                    //   ),
                    //   onPressed: () {
                    //     // Implement chat function
                    //   },
                    //   icon: const Icon(Icons.mic, color: Colors.white),
                    //   label: const Text('دردشة مع الذكاء الاصطناعي',
                    //       style: TextStyle(color: Colors.white)),
                    // ),

                    const SizedBox(height: 20),

                    // Location RowGoogle Maps API Key.

                    const Row(
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(width: 5),
                        Text('عرض الخريطة (اب , الظهار)',
                            style: TextStyle(fontSize: 18)),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Comment Section
                    CommentSection(
                        advertisementId: 1), // استدعاء الكلاس هنا مع ID الإعلان

                    const SizedBox(height: 20),
                    const Text('المعلومات:',
                        style: TextStyle(color: Color.fromARGB(255, 7, 7, 7))),
                    const SizedBox(height: 10),
                    buildInfoTable(realEstate),
                    const SizedBox(height: 20),
                    const Text('وصف العقار:',
                        style:
                            TextStyle(color: Color.fromARGB(255, 10, 10, 10))),
                    const SizedBox(height: 10),
                    buildDescriptionBox(
                      realEstate.description, // تمرير وصف العقار
                      isDescriptionExpanded, // تمرير حالة التوسيع
                      () {
                        // دالة لتبديل حالة التوسيع
                        setState(() {
                          isDescriptionExpanded = !isDescriptionExpanded;
                        });
                      },
                    ), // تأكد من أن هذه الميزة معرفّة
                    const SizedBox(height: 20),
                    const Text('مواقع قريبة:',
                        style: TextStyle(
                            color: Color.fromARGB(255, 235, 230, 230))),
                    const SizedBox(height: 10),
                    buildNearbyTable(), // تأكد من أن هذه الميزة معرفّة
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerRight,
                      child:
                          Text('خدمات متوفرة:', style: TextStyle(fontSize: 18)),
                    ),
                    const SizedBox(height: 10),
                    buildServicesGrid(
                        realEstate), // تأكد من أن هذه الميزة معرفّة
                    const SizedBox(height: 20),
                    buildUserProfile(user), // استخدم المستخدم هنا
                    const SizedBox(height: 20),
                    buildContactButtons(), // تأكد من أن هذه الميزة معرفّة
                    const SizedBox(height: 20),
                    Divider(
                      color: Colors.black.withOpacity(0.31),
                      thickness: 3,
                    ),
                    const SizedBox(height: 20),
                    buildGeneralTips(), // تأكد من أن هذه الميزة معرفّة
                    const SizedBox(height: 20),
                    Divider(
                      color: Colors.black.withOpacity(0.31),
                      thickness: 3,
                    ),
                    buildLoadingAnimation(), // تأكد من أن هذه الميزة معرفّة
                    buildPostItem(), // تأكد من أن هذه الميزة معرفّة
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  // تعديل الدالة لتقبل كائن RealEstate
  Widget buildInfoTable(RealEstate realEstate) {
    return Table(
      children: [
        // buildTableRow('يتم الدفع:', realEstate.paymentMethod, true),
        buildTableRow('نوع العقار:', realEstate.realEstateableType, false),
        buildTableRow('الحي / المنطقة :', realEstate.location, true),
        buildTableRow('الرقم التجاري:', realEstate.commercialNumber, true),
        buildTableRow('احالة العقار', realEstate.advertisement.status, true),
        buildTableRow('ايتوفر:', realEstate.realEstateable.sewage.toString(), true),

        buildTableRow('المدينة :', realEstate.boundaries, false),
        buildTableRow('عدد الطوابق :',
            realEstate.realEstateable.floorsNumber.toString(), true),
        // realEstate.realEstateable. .toString(), true),
        buildTableRow('الشقق :',
            realEstate.realEstateable.apartmentsCount.toString(), false),
        buildTableRow(
            'الحالة:', realEstate.status == 'rent' ? 'للإيجار' : 'للبيع', true),
        // buildTableRow('الأثاث :', realEstate.furnitureStatus, false),
        // buildTableRow('عدد الطوابق:',
        //     realEstate.realEstateable.floorsNumber.toString(), false),

        // buildTableRow('نوع العقار:', getPropertyType(realEstate.real_estateable_type), true),
      ],
    );
  }

  TableRow buildTableRow(String text1, String text2, bool isOddRow) {
    return TableRow(
      decoration: BoxDecoration(
        color: isOddRow ? const Color(0xFF8087a2) : const Color(0xFFc1c4c3),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text1,
              style: TextStyle(color: isOddRow ? Colors.white : Colors.black)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text2,
              style: TextStyle(color: isOddRow ? Colors.white : Colors.black)),
        ),
      ],
    );
  }

  Widget buildDescriptionBox(
      String description, bool isExpanded, Function toggleExpand) {
    // تحديد طول النص الذي سيظهر في البداية
    const int maxDescriptionLength = 100;

    // إذا كان النص طويلًا ولم يتم توسيعه، نقوم بعرض جزء منه فقط
    String displayText = description;
    if (!isExpanded && description.length > maxDescriptionLength) {
      displayText = description.substring(0, maxDescriptionLength) + '...';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            displayText, // عرض النص سواء كان مختصرًا أو كاملاً بناءً على isExpanded
            style: TextStyle(fontSize: 16),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              toggleExpand(); // دالة لتبديل حالة "قراءة المزيد"
            },
            child: Text(
              isExpanded
                  ? 'قراءة أقل'
                  : 'قراءة المزيد', // التبديل بين "قراءة المزيد" و "قراءة أقل"
              style: TextStyle(color: Color(0XFF354B9F)),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildNearbyTable() {
    return Table(
      children: [
        buildNearbyRow(Icons.fitness_center, 'صالة رياضية/ جيم',
            Icons.account_balance, 'بنك/ صراف الي'),
        buildNearbyRow(Icons.mosque, 'مسجد', Icons.store, 'سوبر ماركت'),
        buildNearbyRow(Icons.school, 'مدرسة', Icons.abc_sharp, 'مخبز'),
        buildNearbyRow(Icons.shopping_cart, 'مركزتسوق / مول',
            Icons.local_hospital, 'مستشفى'),
        buildNearbyRow(
            Icons.local_pharmacy, 'صيدلية', Icons.local_parking, 'موقف سيارات'),
      ],
    );
  }

  TableRow buildNearbyRow(
      IconData icon1, String text1, IconData icon2, String text2) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(icon1,
                  color: const Color(0xFF909090)), // Set icon color here
              const SizedBox(width: 5),
              Text(
                text1,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(icon2,
                  color: const Color(0xFF909090)), // Set icon color here
              const SizedBox(width: 5),
              Text(text2,
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildServicesGrid(RealEstate realEstate) {
    return Row(
      children: realEstate.features.map((feature) {
        return Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: buildServiceItem(Icons.check, feature.name),
        );
      }).toList(),
    );
  }

  Widget buildServiceItem(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: const Color(0xFF909090)),
        const SizedBox(width: 5),
        Text(text, style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget buildUserProfile(User user) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10), // إضافة هامش من اليمين
          child: const Stack(
            // استخدام Stack لوضع الأيقونة فوق CircleAvatar
            alignment:
                Alignment.bottomRight, // محاذاة الأيقونة في الأسفل يمينًا
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage('assets/images/profile.png'),
              ),
              Icon(Icons.verified,
                  color: Color(0XFF354B9F), size: 25), // ضبط الحجم حسب الحاجة
            ],
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('d'), // عرض اسم المستخدم من بيانات الإعلان
                const SizedBox(width: 5),
                Row(
                  children: List.generate(
                      5,
                      (index) => const Icon(Icons.star,
                          color: Colors.yellow, size: 16)),
                ),
                const Text(('k'), style: TextStyle(fontSize: 16)),
              ],
            ),
            Text('مدينة: ${user.city.name}, اليمن'),
            Text('عضو منذ: ${(user.createdAt)}'),
            const SizedBox(height: 5), // إضافة مسافة بين العناصر
          ],
        ),
      ],
    );
  }

  Widget buildContactButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Center the Row content
      children: [
        CallButton(phoneNumber: 'تواصل'),
        // ElevatedButton(
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: const Color(0XFF354B9F),
        //     fixedSize: const Size(138, 32),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //   ),
        //   onPressed: () {
        //     // Implement contact
        //   },
        //   child: const Text('تواصل', style: TextStyle(color: Colors.white)),
        // ),
        const SizedBox(width: 35), // Add some space between the buttons
        CallButton(phoneNumber: 'تابع'),

// OutlinedButton(
        //   style: OutlinedButton.styleFrom(
        //     fixedSize: const Size(135, 32),
        //     side: const BorderSide(color: Colors.black),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //   ),
        //   onPressed: () {
        //     // Implement follow
        //   },
        //   child: const Text('تابع',
        //       style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
        // ),
      ],
    );
  }

  Widget buildGeneralTips() {
    return const Center(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // جعل العناصر محاذية لليسار
        children: <Widget>[
          Text(
            'نصائح عامة',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            '• قم بتفقد البيانات جيداً قبل الشراء',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            '• لا تقم بإرسال المال مسبقاً',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            '• تعامل مع التطبيق فقط',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget buildLoadingAnimation() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50), // مسافة بين النقاط والنص
          // النقاط المتحركة
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAnimatedDot(1),
              _buildAnimatedDot(2),
              _buildAnimatedDot(3),
              _buildAnimatedDot(4),
            ],
          ),

          const SizedBox(height: 50), // مسافة بين النقاط والنص

          // النص
          const Text(
            'تم إرسال طلب الجولة',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 50),
          Divider(
            color: Colors.black.withOpacity(0.31),
            thickness: 3,
          ),
        ],
      ),
    );
  }

// دالة مساعدة لإنشاء نقطة متحركة
  Widget _buildAnimatedDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: 10,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == 2 // النقطة الثانية زرقاء، البقية بنفسجي فاتح
            ? Colors.blue
            : const Color(0xFFCBC3E3),
      ),
    );
  }

  Widget buildCategoryButton(String label, IconData icon) {
    return Column(
      children: [
        Container(
          width: 73,
          height: 71,
          decoration: BoxDecoration(
            color: const Color(0xFF000000).withOpacity(0.4),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(height: 8.0),
              Text(
                label,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }

///////////////////////////////////////////////////////////////////////////////////
  Widget _buildFormItem(IconData icon, String label, Widget inputField) {
    return Expanded(
      // استخدم Expanded لتوزيع المساحة بالتساوي
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon),
              const SizedBox(width: 8),
              Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          inputField,
        ],
      ),
    );
  }

  Widget buildPostItem() {
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
              // صورة المنشور
              Container(
                width: 100,
                height: 105,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(width: 16.0),
              const SizedBox(height: 50),
              // Expanded لجعل المحتوى يأخذ المساحة المتبقية المتاحة
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // السعر
                    Text(
                      '30,500,000',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    // العنوان والتفاصيل الأخرى
                    Text(
                      'مبنى طابقين للبيع',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text('المساحة: 4 لبن'),
                    Text('شارع المحافظة, أب'),
                  ],
                ),
              ),

              // زر القلب
              IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {
                  // Handle favorite icon press
                },
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          // تفاصيل المزود وأزرار الإجراءات
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // معلومات المزود (صورة، تقييم، موقع)
              // Flexible لجعل هذه المنطقة تتقلص إذا لزم الأمر
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // صورة المزود وعلامة التوثيق (استبدل بالصورة الفعلية)
                    CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          const NetworkImage('https://via.placeholder.com/150'),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 15,
                          height: 15,
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
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // التقييمات
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow),
                            SizedBox(width: 4.0),
                            Text('5'),
                          ],
                        ),
                        SizedBox(
                            height:
                                4.0), // Add some spacing between rating and location
                        // الموقع
                        Text(
                          'اليمن , اب', // <-- Display only the country on the next line
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // أزرار الإجراءات
              Row(
                children: [
                  // زر الانتقال للعرض
                  ConstrainedBox(
                    // Constrain button width
                    constraints:
                        const BoxConstraints(minWidth: 100, maxWidth: 150),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF354B9F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'الانتقال للعرض',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          ),
                          SizedBox(width: 4.0),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  // زر المتابعة
                  ConstrainedBox(
                    // Constrain button width
                    constraints:
                        const BoxConstraints(minWidth: 80, maxWidth: 120),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF354B9F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'متابعة',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          Container(
                            width: 16,
                            height: 16,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Color(0xFF354B9F),
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 8.0),
          // تاريخ النشر
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '3 مايو',
              style: TextStyle(color: Color(0xFF6A7380)),
            ),
          ),
        ],
      ),
    );
  }
}
