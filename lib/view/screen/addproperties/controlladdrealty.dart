// دالة لإنشاء حقل الخريطة مع تسمية
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


//شعار الموقع 

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


 Widget buildTextLabel(String text) {
    return Text(text, style: const TextStyle(fontSize: 16));
  }

Widget buildActionButtons() {
  // دالة جديدة لاحتواء الأزرار
  return Row(
    mainAxisAlignment: MainAxisAlignment.center, // توسيط المحتوى أفقيًا
    children: [
      buildActionButton("رفع بيانات الشقة", () {
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

Widget buildInputField(String label, String hintText) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(fontSize: 16)),
      const SizedBox(height: 8),
      TextField(
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        ),
      ),
    ],
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

Widget buildToggleButton(
    String text, bool isSelected, bool isFirst, ValueChanged<bool> onChanged) {
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

/////////////////////////////////////////////////////

// دالة لإنشاء حقل نص متعدد الأسطر
Widget buildMultilineTextFieldWithLabel(String label, String hintText) {
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
Widget buildImageUploadFieldWithLabel() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch, // توسيع المحتوى أفقيًا
    children: [
      Padding(
        padding: const EdgeInsets.only(
            left: 16.0), // إضافة مسافة بسيطة إلى يسار التسمية
        child: const Text(
          ':ادراج صورة العقار',
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
                  ':اضغط هنا لرفع صور',
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

Widget buildMapFieldWithLabel() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch, // توسيع المحتوى أفقيًا
    children: [
      Padding(
        padding: const EdgeInsets.only(
            left: 16.0), // إضافة مسافة بسيطة إلى يسار التسمية
        child: const Text(
          ':الموقع على الخريطة',
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
