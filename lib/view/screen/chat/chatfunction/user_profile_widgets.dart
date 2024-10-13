import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

///////////////////الدول حق صفحة message_management//////////////////////////////////////////////
Widget buildUserProfile(Function(File) onImageSelected) {
  return Row(
    children: [
      GestureDetector(
        onTap: () async {
          final pickedFile =
              await ImagePicker().pickImage(source: ImageSource.gallery);
          if (pickedFile != null) {
            onImageSelected(File(pickedFile.path));
          }
        },
        child: const Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/profile.jpeg'),
            ),
            Icon(Icons.verified, color: Color(0XFF354B9F), size: 25),
          ],
        ),
      ),
      const SizedBox(width: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('الاسم'),
              const SizedBox(width: 5),
              Row(
                children: List.generate(
                    5,
                    (index) =>
                        const Icon(Icons.star, color: Colors.yellow, size: 16)),
              ),
              const Text('(5)', style: TextStyle(fontSize: 16)),
            ],
          ),
          const Text('إب, اليمن'),
          const Text('عضو منذ 5/20/2024'),
        ],
      ),
    ],
  );
}

Widget BbuildUserProfile(Function(File) onImageSelected) {
  return Row(
    children: [
      GestureDetector(
        onTap: () async {
          final pickedFile =
              await ImagePicker().pickImage(source: ImageSource.gallery);
          if (pickedFile != null) {
            onImageSelected(File(pickedFile.path));
          }
        },
        child: const Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
          ],
        ),
      ),
      const SizedBox(width: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('محمد'),
              const SizedBox(width: 5),
            ],
          ),
          const Text('12:59:55 الساعة 24/5/2024'),
        ],
      ),
    ],
  );
}

Widget BbuildUserProfile2(Function(File) onImageSelected) {
  return Row(
    children: [
      GestureDetector(
        onTap: () async {
          final pickedFile =
              await ImagePicker().pickImage(source: ImageSource.gallery);
          if (pickedFile != null) {
            onImageSelected(File(pickedFile.path));
          }
        },
        child: const Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
          ],
        ),
      ),
      const SizedBox(width: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('جمال'),
              const SizedBox(width: 5),
            ],
          ),
          const Text('12:59:55 الساعة 24/5/2024'),
        ],
      ),
    ],
  );
}
/////////////////////////////////////////////////////الدول حق المستخدمين في المكتب ////////////////////////