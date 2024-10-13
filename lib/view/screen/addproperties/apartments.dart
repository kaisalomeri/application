import 'package:application_aqars/view/screen/addproperties/controlladdrealty.dart';
import 'package:flutter/material.dart';

class Apartment extends StatefulWidget {
  const Apartment({super.key});

  @override
  _ApartmentState createState() => _ApartmentState();
}

class _ApartmentState extends State<Apartment> {
  int _selectedFloor = 0;
  int _selectedSocialStatus = 2;
  bool oncePayment = true;
  bool rentCategory = true;
  bool waqfStatus = true;
  bool residentialType = false;
  int loorCount = 1;
  bool agriculturalType = true;
  bool otherType = false;
  List<bool> nearbyLocations = List.filled(10, false);
  List<bool> availableServices = List.filled(5, false);
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildIntroSection(),
            const SizedBox(height: 16),
            buildPropertyTypeSelector(),
            const SizedBox(height: 16),
            buildDetailsSection(),
            const SizedBox(height: 50),
            buildActionButtons(),
            const SizedBox(height: 16),
            buildFooterImage(),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('اضافة عقار', style: TextStyle(color: Colors.white)),
      backgroundColor: const Color(0xFF354B9F),
      actions: [
        IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF354B9F),
              Color(0xFF25346E),
              Color(0xFF25346E),
              Color(0xFF131B39),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }

  Widget buildIntroSection() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'مرحبا',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'احرص على الوصف الدقيق والملائم للعقار...',
            style: TextStyle(color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget buildDetailsSection() {
    return Container(
      width: 383,
      padding: const EdgeInsets.all(16.0),
      color: const Color(0xFFE4E4E4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          buildTextLabel(':الفئة'),
          buildSwitchButton('تأجير', 'بيع', rentCategory, (value) {
            setState(() {
              rentCategory = value;
            });
          }),
          const SizedBox(height: 16),
          buildInputField(':العنوان (الحي/ المنطقة)', 'شارع تعز'),
          buildInputField(':المدينة', 'إب'),
          buildInputField(':السعر', '80000000 مليون'),
          const SizedBox(height: 16),
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
          const SizedBox(height: 16),
          const Text(':خدمات متوفرة', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 10),
          buildCheckboxGrid([
            'ماء',
            'تغطية هاتف',
            'كهرباء',
            'وصول انترنت',
            'خزان أرضي',
          ], availableServices),
          const SizedBox(height: 16),
          buildTextLabel(':الطابق'),
          buildFloorRadioGroup(),
          const SizedBox(height: 16),
          buildTextLabel('الحالة الاجتماعية:'),
          buildSocialStatusButtons(),
          const SizedBox(height: 16),
          buildTextLabel('الأثاث:'),
          buildSwitchButton('مفروش', 'غير مفروش', oncePayment, (value) {
            setState(() {
              oncePayment = value;
            });
          }),
          const SizedBox(height: 16),
          BbuildFloorCountComponent(),
          const SizedBox(height: 16),
          buildTextLabel(':حالة العقار'),
          buildSwitchButton('شقة مستعملة', 'شقة جديدة', rentCategory, (value) {
            setState(() {
              rentCategory = value;
            });
          }),
          const SizedBox(height: 16),
          buildMultilineTextFieldWithLabel(
              ':وصف العقار', 'اكتب وصف العقار هنا'),
          const SizedBox(height: 16),
          buildImageUploadFieldWithLabel(),
          const SizedBox(height: 16),
          buildMapFieldWithLabel(),
          const SizedBox(height: 50),
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
            Text(items[index], style: const TextStyle(color: Colors.black54)),
          ],
        );
      }),
    );
  }

  Widget buildCheckboxGrid(List<String> items, List<bool> values) {
    return Wrap(
      spacing: 8, // المسافة الأفقية بين العناصر
      runSpacing: 8, // المسافة الرأسية بين الصفوف
      children: List.generate(items.length, (index) {
        return Row(
          mainAxisSize: MainAxisSize.min, // يجعل الصف يأخذ أقل مساحة ممكنة
          children: [
            Checkbox(
              value: values[index],
              onChanged: (value) {
                setState(() {
                  values[index] = value!;
                });
              },
            ),
            Text(items[index], style: const TextStyle(color: Colors.black54)),
          ],
        );
      }),
    );
  }

  Widget buildSocialStatusButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildTripleToggleButton('عزاب', _selectedSocialStatus == 0, () {
          setState(() {
            _selectedSocialStatus = 0;
          });
        }),
        buildTripleToggleButton('عوائل', _selectedSocialStatus == 1, () {
          setState(() {
            _selectedSocialStatus = 1;
          });
        }),
        buildTripleToggleButton(
          'الكل',
          _selectedSocialStatus == 2,
          () {
            setState(() {
              _selectedSocialStatus = 2;
            });
          }, // isSelected: true
        ), // Make "الكل" selected by default
      ],
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

  Widget buildCheckboxSection(
      String title, List<bool> values, List<String> labels) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        Column(
          children: List.generate(labels.length, (index) {
            return CheckboxListTile(
              value: values[index],
              onChanged: (bool? newValue) {
                setState(() {
                  values[index] = newValue ?? false;
                });
              },
              title: Text(labels[index]),
            );
          }),
        ),
      ],
    );
  }

  Widget buildFloorRadioGroup() {
    return Column(
      children: List.generate(4, (rowIndex) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(3, (columnIndex) {
            final index = rowIndex * 3 + columnIndex;
            final text = index == 9 ? 'المبنى كاملا' : '${index + 1}';
            return buildRadioButton(
              text,
              _selectedFloor == index,
              () {
                setState(() {
                  _selectedFloor = index;
                });
              },
            );
          }),
        );
      }),
    );
  }

  Widget BbuildFloorCountComponent() {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(':عدد الغرف'),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  if (loorCount > 1) loorCount--;
                });
              },
            ),
            Container(
              width: 50,
              alignment: Alignment.center,
              child: Text(
                '$loorCount',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  if (loorCount < 360) loorCount++;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
