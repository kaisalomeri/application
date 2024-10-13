import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: PropertyRequestPage(),
      ),
    );
  }
}

class PropertyRequestPage extends StatefulWidget {
  const PropertyRequestPage({super.key});

  @override
  _PropertyRequestPageState createState() => _PropertyRequestPageState();
}

class _PropertyRequestPageState extends State<PropertyRequestPage> {
  // ... (المتغيرات الأخرى)

  int _selectedFloor = 0; // لتتبع الطابق المحدد
  int _selectedSocialStatus = 2; // لتتبع الحالة الاجتماعية المحددة

  bool oncePayment = true;
  bool rentCategory = true;
  bool waqfStatus = true;
  bool residentialType = false;

  // int loorCount = 1;
  bool agriculturalType = true;
  bool otherType = false;
  List<bool> nearbyLocations = List.filled(10, false);
  List<bool> availableServices = List.filled(5, false);
  int _selectedIndex = 2; // To keep track of the selected button
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اضافة عقار', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF354B9F),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {
              Navigator.pop(context); // للرجوع إلى الصفحة السابقة
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
        // ... (AppBar كما هو في الكود السابق)
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ... (الأجزاء الأولى من الكود كما هي في الكود السابق)
            Center(
              child: Column(
                // استخدم Column لترتيب النصوص رأسيًا
                mainAxisSize:
                    MainAxisSize.min, // لجعل Column يأخذ أقل مساحة ممكنة
                children: [
                  Text(
                    'مرحبا',
                    style: TextStyle(
                      fontSize: 18, // يمكنك تعديل حجم الخط حسب الحاجة
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8), // مسافة بين النصين
                  Text(
                    'احرص على الوصف الدقيق والملائم والدقيق للعقار  للحصول على تجربة افضل  لعملائك ولضمان ثقتهم',
                    style: TextStyle(color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
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
                    buildOptionButton('شقة', 1),
                    buildOptionButton('مباني', 2, isSelected: true),
                    buildOptionButton('أراضي', 3),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: 383,
              padding: const EdgeInsets.all(16.0),
              color: const Color(0xFFE4E4E4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('يتم الدفع:'),
                  const SizedBox(height: 10),
                  buildSwitchButton('مرة واحدة', 'بالتقسيط', oncePayment,
                      (value) {
                    setState(() {
                      oncePayment = value;
                    });
                  }),
                  const SizedBox(height: 16),
                  const Text('الفئة:'),
                  const SizedBox(height: 10),
                  buildSwitchButton('ايجار', 'شراء', rentCategory, (value) {
                    setState(() {
                      rentCategory = value;
                    });
                  }),
                  const SizedBox(height: 16),
                  const Text('نوع العقار:'),
                  const SizedBox(height: 10),
                  buildSwitchButton('مبنى تجاري', 'مبنى سكني', rentCategory,
                      (value) {
                    setState(() {
                      rentCategory = value;
                    });
                  }),
                  const SizedBox(height: 20),
                  buildInputField('العنوان (الحي/ المنطقة):', 'شارع تعز'),
                  buildInputField('المدينة:', 'إب'),

                  const SizedBox(height: 20),
                  buildInputField('السعر:', '80000000 مليون'),

                  const SizedBox(height: 16),
                  const Text('مواقع قريبة:', style: TextStyle(fontSize: 16)),
                  buildCheckboxList([
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
                  ], nearbyLocations),
                  const SizedBox(height: 16),
                  const Text('خدمات متوفرة:', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 10),
                  buildCheckboxGrid([
                    'ماء',
                    'تغطية هاتف',
                    'كهرباء',
                    'وصول انترنت',
                    'خزان أرضي',
                  ], availableServices),
                  const SizedBox(height: 36),
                  const SizedBox(height: 16),

                  const SizedBox(height: 16),
                  const Text('الطابق:'),
                  const SizedBox(height: 10),
                  buildFloorRadioGroup(), // دالة جديدة لإنشاء مجموعة أزرار الاختيار للطابق

                  const SizedBox(height: 16),
                  const Text('عدد الطوابق:'),
                  const SizedBox(height: 20),
                  buildSocialStatusButtons(),

                  const SizedBox(height: 16),
                  const Text('حالة المبنى:'),
                  const SizedBox(height: 10),
                  buildSwitchButton('مبنى قديم', 'مبنى جديد', rentCategory,
                      (value) {
                    setState(() {
                      rentCategory = value;
                    });
                  }),

                  // _buildMultilineTextField(
                  // 'اكتب وصف العقار هنا'), // استدعاء الدالة هنا
                  _buildMultilineTextFieldWithLabel(
                      'وصف العقار :', 'اكتب وصف العقار هنا '),
                  SizedBox(height: 16),
                  _buildImageUploadFieldWithLabel(),
                  SizedBox(height: 16),
                  _buildMapFieldWithLabel(),
                  SizedBox(height: 50),
                ],
              ),
            ),
            const SizedBox(height: 50),

            buildActionButtons(),
            //SizedBox(height: 16),
            Padding(
              // إضافة مساحة حول الشعار
              padding: const EdgeInsets.only(top: 70, left: 30),
              child: Center(
                child: Image.asset(
                  'assets/images/app_logo.png', // استبدل بالمسار الصحيح
                  height: 100,
                  width: 200,
                ),
              ),
            ),
          ],
        ),
      ),
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

  Widget buildRadioButton(String text, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio(
            value: isSelected,
            groupValue: true, // To ensure only one is selected
            onChanged: (_) => onTap(),
          ),
          Text(text, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  Widget buildSocialStatusButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildTripleToggleButton('1-3 طابق', _selectedSocialStatus == 0, () {
          setState(() {
            _selectedSocialStatus = 0;
          });
        }),
        buildTripleToggleButton('4-9 طابق', _selectedSocialStatus == 1, () {
          setState(() {
            _selectedSocialStatus = 1;
          });
        }),
        buildTripleToggleButton(
          'اكثر',
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

  Widget buildSwitchButton(String text1, String text2, bool isFirstSelected,
      ValueChanged<bool> onChanged) {
    return SizedBox(
      // Wrap the Row in a Container
      width: 344, // Set the desired width of the container
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center the buttons
        children: [
          buildToggleButton(text1, isFirstSelected, true, onChanged),
          buildToggleButton(text2, !isFirstSelected, false, onChanged),
        ],
      ),
    );
  }

  Widget buildToggleButton(String text, bool isSelected, bool isFirst,
      ValueChanged<bool> onChanged) {
    return GestureDetector(
      onTap: () {
        onChanged(isFirst);
      },
      child: Container(
        width: isSelected ? 170 : 170,
        height: 35,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF354B9F) : Colors.white,
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
          color: isSelected ? const Color(0xFF354B9F) : Colors.white,
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

  Widget buildInputField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 4),
        Container(
          width: 350,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.black54),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
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

  Widget buildActionButtons() {
    // دالة جديدة لاحتواء الأزرار
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // توسيط المحتوى أفقيًا
      children: [
        buildActionButton("رفع بيانات المبنى", () {
          // ... إضافة المنطق هنا
        }),
        const SizedBox(width: 16), // إضافة مسافة بين الأزرار

        buildActionButton("الإلغاء", () {
          // ... إضافة المنطق هنا
        }),
      ],
    );
  }

  Widget buildActionButton(String text, VoidCallback onPressed) {
    return Expanded(
      // جعل الأزرار تأخذ المساحة المتاحة بالتساوي
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF354B9F),
          minimumSize:
              const Size(0, 40), // إزالة الحد الأدنى للعرض للسماح بالتمدد
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  // دالة لإنشاء حقل نص متعدد الأسطر
  Widget _buildMultilineTextFieldWithLabel(String label, String hintText) {
    TextEditingController _controller = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            label,
            style: const TextStyle(color: Colors.black54),
            textAlign: TextAlign.right,
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Container(
            width: 274,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              // استخدم Column لوضع TextField والعداد
              children: [
                Expanded(
                  // استخدم Expanded للسماح لـ TextField بأخذ المساحة المتبقية
                  child: TextField(
                    controller: _controller,
                    maxLines: null,
                    maxLength: 500,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: TextStyle(color: Colors.black54),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      counterText: '', // إزالة العداد الافتراضي
                    ),
                  ),
                ),
                // إضافة العداد الخاص بنا في الأسفل
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${_controller.text.length}/500',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // دالة لإنشاء حقل رفع الصور مع تسمية
  Widget _buildImageUploadFieldWithLabel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch, // توسيع المحتوى أفقيًا
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 16.0), // إضافة مسافة بسيطة إلى يسار التسمية
          child: const Text(
            'ادراج صورة العقار:',
            style: TextStyle(color: Colors.black54),
            textAlign: TextAlign.right, // محاذاة التسمية إلى اليسار
          ),
        ),
        const SizedBox(height: 10),
        Center(
          // توسيط الحقل
          child: GestureDetector(
            onTap: () {
              // هنا يمكنك إضافة الكود لفتح معرض المستخدم
            },
            child: Container(
              width: 274,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud_upload,
                    color: Color(0xFF354B9F),
                    size: 35,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'اختر هنا لرفع صور',
                    style:
                        TextStyle(color: const Color.fromARGB(255, 54, 54, 54)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // دالة لإنشاء حقل الخريطة مع تسمية
  Widget _buildMapFieldWithLabel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch, // توسيع المحتوى أفقيًا
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 16.0), // إضافة مسافة بسيطة إلى يسار التسمية
          child: const Text(
            'الموقع على الخريطة :',
            style: TextStyle(color: Colors.black54),
            textAlign: TextAlign.right, // محاذاة التسمية إلى اليسار
          ),
        ),
        const SizedBox(height: 10),
        Center(
          // توسيط الحقل
          child: GestureDetector(
            onTap: () {
              // هنا يمكنك إضافة الكود للانتقال إلى خريطة جوجل
            },
            child: Container(
              width: 274,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.mapMarkedAlt,
                  size: 40,
                  color: Color(0xFF354B9F),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
