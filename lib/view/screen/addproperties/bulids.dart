import 'package:application_aqars/view/screen/addproperties/controlladdrealty.dart';
import 'package:flutter/material.dart';

class Bulids extends StatefulWidget {
  @override
  _BulidsState createState() => _BulidsState();
}

class _BulidsState extends State<Bulids> {
  bool oncePayment = true;
  bool rentCategory = true;
  bool waqfStatus = true;
  bool residentialType = false;
  bool agriculturalType = true;
  bool otherType = false;
  List<bool> nearbyLocations = List.filled(10, false);
  List<bool> availableServices = List.filled(5, false);
  int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBodyContent(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('اضافة عقار', style: TextStyle(color: Colors.white)),
      backgroundColor: Color(0xFF354B9F),
      actions: [buildCloseButton()],
      flexibleSpace: buildGradientBackground(),
    );
  }

  IconButton buildCloseButton() {
    return IconButton(
      icon: const Icon(Icons.close, color: Colors.white),
      onPressed: () {
        // Add navigation logic here if needed
      },
    );
  }

  Container buildGradientBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF354B9F), Color(0xFF25346E), Color(0xFF131B39)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Widget buildBodyContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildIntroText(),
          SizedBox(height: 16),
          buildPropertyTypeSelector(),
          SizedBox(height: 16),
          buildDetailsSection(),
          SizedBox(height: 50),
          buildActionButtons(),
          buildFooterImage(),
        ],
      ),
    );
  }

  Widget buildIntroText() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('مرحبا', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(
            'احرص على الوصف الدقيق والملائم والدقيق للعقار...',
            style: TextStyle(color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }




  Widget buildPropertyTypeSelector() {
    return Container(
      width: 375,
      height: 35,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // توسيط الأزرار
          children: [
            buildOptionButton('بيت', 0), // تمرير الـ index الصحيح
            buildOptionButton('شقة', 1, isSelected: true),
            buildOptionButton('مباني', 2),
            buildOptionButton('أراضي', 3), // Make "أراضي" selected by default
          ],
        ),
      ),
    );
  }
  BoxShadow buildBoxShadow() {
    return BoxShadow(
      color: Colors.black.withOpacity(0.15),
      blurRadius: 12,
      offset: Offset(0, 4),
    );
  }

  Widget buildDetailsSection() {
    return Container(
      width: 383,
      padding: const EdgeInsets.all(16.0),
      color: Color(0xFFE4E4E4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTextLabel('يتم الدفع:'),
          buildSwitchButton('مرة واحدة', 'بالتقسيط', oncePayment, (value) {
            setState(() {
              oncePayment = value;
            });
          }),
          SizedBox(height: 16),
          buildTextLabel('الفئة:'),
          buildSwitchButton('ايجار', 'شراء', rentCategory, (value) {
            setState(() {
              rentCategory = value;
            });
          }),
          SizedBox(height: 16),
          buildInputField('العنوان (الحي/ المنطقة):', 'شارع تعز'),
          buildInputField('المدينة:', 'إب'),
          buildInputField('عدد القصب (مساحة المنزل):', '4 قصب, 3 متر مربع'),
          buildTextLabel('حالة الأرض:'),
          buildSwitchButton('وقف', 'حر', waqfStatus, (value) {
            setState(() {
              waqfStatus = value;
            });
          }),
          SizedBox(height: 16),
          buildInputField('السعر:', '80000000 مليون'),
          buildTextLabel('نوع الأرض:'),
          buildTripleSwitchButton('سكنية', 'زراعية', 'أخرى'),
          SizedBox(height: 16),
          buildCheckboxSection('مواقع قريبة:', nearbyLocations, [
            'صالة رياضة / جيم',
            'بنك / صراف الي',
            'مسجد',
            'سوبر ماركت',
            'صيدلية',
            'مخبز',
            'مركز تسوق / مول',
            'مستشفى',
            'مدرسة',
            'موقف سيارات',
          ]),
          SizedBox(height: 16),
          buildCheckboxSection('خدمات متوفرة:', availableServices, [
            'ماء',
            'تغطية هاتف',
            'كهرباء',
            'وصول انترنت',
            'خزان أرضي',
          ]),
          SizedBox(height: 16),
          buildMultilineTextFieldWithLabel('وصف العقار:', 'اكتب وصف العقار هنا'),
          buildImageUploadFieldWithLabel(),
          buildMapFieldWithLabel(),
        ],
      ),
    );
  }

  Widget buildTextLabel(String text) {
    return Text(text, style: TextStyle(fontSize: 16));
  }

  Widget buildCheckboxSection(String title, List<bool> values, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextLabel(title),
        buildCheckboxList(items, values),
      ],
    );
  }

  Widget buildFooterImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 70, left: 30),
      child: Center(
        child: Image.asset(
          'assets/images/app1.jpeg',
          height: 100,
          width: 200,
        ),
      ),
    );
  }

  /// دالة لإنشاء قائمة مربعات الاختيار
  Widget buildCheckboxList(List<String> items, List<bool> values) {
    return Column(
      children: List.generate(items.length, (index) {
        return Row(
          children: [
            Checkbox(
              value: values[index],
              onChanged: (value) {
                setState(() {
                  values[index] = value!;
                });
              },
            ),
            Text(items[index], style: TextStyle(color: Colors.black54)),
          ],
        );
      }),
    );
  }

  /// دالة لإنشاء ثلاثة أزرار التبديل بين الأنواع
  Widget buildTripleSwitchButton(String text1, String text2, String text3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildTripleToggleButton(text1, residentialType, () {
          setState(() {
            residentialType = true;
            agriculturalType = false;
            otherType = false;
          });
        }),
        buildTripleToggleButton(text2, agriculturalType, () {
          setState(() {
            residentialType = false;
            agriculturalType = true;
            otherType = false;
          });
        }),
        buildTripleToggleButton(text3, otherType, () {
          setState(() {
            residentialType = false;
            agriculturalType = false;
            otherType = true;
          });
        }),
      ],
    );
  }

  Widget buildTripleToggleButton(
      String text, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isSelected ? 148 : 95,
        height: 35,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF354B9F) : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }





  Widget buildOptionButton(String text, int index, {bool isSelected = false}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        style: TextButton.styleFrom(
          backgroundColor: (_selectedIndex == index)
              ? const Color(0xFF354B9F)
              : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: (_selectedIndex == index) ? Colors.white : Colors.black),
        ),
      ),
    );
  }



  // Implement the remaining helper functions such as:
  // buildSwitchButton, buildOptionButton, buildInputField, buildActionButtons, etc.
}
