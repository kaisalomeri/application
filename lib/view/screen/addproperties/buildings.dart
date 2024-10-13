import 'package:application_aqars/view/screen/addproperties/controlladdrealty.dart';
import 'package:flutter/material.dart';

class Buildings extends StatefulWidget {
  const Buildings({super.key});

  @override
  _BuildingsState createState() => _BuildingsState();
}

class _BuildingsState extends State<Buildings> {
  int _selectedFloor = 0;
  int _selectedSocialStatus = 2;
  bool oncePayment = true;
  bool rentCategory = true;
  bool waqfStatus = true;
  bool residentialType = false;
  bool agriculturalType = true;
  bool otherType = false;
  List<bool> nearbyLocations = List.filled(10, false);
  List<bool> availableServices = List.filled(5, false);
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildGreetingSection(),
            const SizedBox(height: 16),
            buildPropertyTypeSelector(),
            const SizedBox(height: 16),
            buildPropertyForm(),
            buildActionButtons(),
            buildFooterImage(),
          ],
        ),
      ),
    );
  }

  // 1. بناء AppBar
  AppBar buildAppBar() {
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

  // 2. بناء الجزء الترحيبي
  Widget buildGreetingSection() {
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
            'احرص على الوصف الدقيق للعقار لضمان ثقة عملائك',
            style: TextStyle(color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // 3. بناء خيارات نوع العقار (بيت، شقة، مباني، أراضي)
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildOptionButton('بيت', 0),
            buildOptionButton('شقة', 1),
            buildOptionButton('مباني', 2, isSelected: true),
            buildOptionButton('أراضي', 3),
          ],
        ),
      ),
    );
  }

  // 4. بناء استمارة العقار
  Widget buildPropertyForm() {
    return Container(
      width: 383,
      padding: const EdgeInsets.all(16.0),
      color: const Color(0xFFE4E4E4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSwitchSection('يتم الدفع:', 'مرة واحدة', 'بالتقسيط', oncePayment,
              (value) {
            setState(() {
              oncePayment = value;
            });
          }),
          buildSwitchSection('الفئة:', 'ايجار', 'شراء', rentCategory, (value) {
            setState(() {
              rentCategory = value;
            });
          }),
          buildSwitchSection(
              'نوع العقار:', 'مبنى تجاري', 'مبنى سكني', rentCategory, (value) {
            setState(() {
              rentCategory = value;
            });
          }),
          buildInputField('العنوان (الحي/ المنطقة):', 'شارع تعز'),
          buildInputField('المدينة:', 'إب'),
          buildInputField('السعر:', '80000000 مليون'),
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
            'موقف سيارات'
          ]),
          buildCheckboxSection('خدمات متوفرة:', availableServices,
              ['ماء', 'تغطية هاتف', 'كهرباء', 'وصول انترنت', 'خزان أرضي']),
          buildFloorRadioGroup(),
          buildSocialStatusButtons(),
          buildSwitchSection(
              'حالة المبنى:', 'مبنى قديم', 'مبنى جديد', rentCategory, (value) {
            setState(() {
              rentCategory = value;
            });
          }),
          buildMultilineTextFieldWithLabel(
              'وصف العقار :', 'اكتب وصف العقار هنا '),
          buildImageUploadFieldWithLabel(),
          buildMapFieldWithLabel(),
        ],
      ),
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


  // 5. بناء أزرار الخيارات
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



  // 7. بناء أزرار التحكم
  Widget buildActionButtons() {
    // بناء زر حفظ أو نشر أو ما إلى ذلك
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            // فعل الحفظ
          },
          child: const Text('حفظ'),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: () {
            // فعل النشر
          },
          child: const Text('نشر'),
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



Widget buildSwitchSection(String label, String option1, String option2, bool value, Function(bool) onChanged) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              option1,
              style: TextStyle(
                fontSize: 14,
                color: value ? Colors.black : Colors.grey,
              ),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
          ),
          Expanded(
            child: Text(
              option2,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 14,
                color: value ? Colors.grey : Colors.black,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 8),
    ],
  );
}





}
