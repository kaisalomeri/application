import 'package:application_aqars/function/chingpages.dart';
import 'package:application_aqars/view/screen/chat/chatmessinges/chat_page.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  _MessagesPageState createState() => _MessagesPageState();
}
class _MessagesPageState extends State<MessagesPage> {
  File? _selectedImage;
  int _currentIndex = 2;
  bool _hasMessages = true; // متغير للتحقق مما إذا كان هناك رسائل

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
        title: const Text(
          'الرسائل',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(
        //       Icons.close,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        // ],
      ),
      body: _hasMessages ? _buildMessagesList() : _buildNoMessagesView(),
      //bottomNavigationBar: buildBottomNavigationBar(context, _currentIndex),
    );
  }

  Widget _buildMessagesList() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'سجل الدردشة',
            style: TextStyle(
              color: Color(0xFF25346E),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              buildMessageTile(
                'thv',
                'مرحبا هل لديكم أراضي بالسحول',
                'منذ دقيقتين',
                1,
                true, // المتصل
                _selectedImage,
                _pickImage,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatPage()),
                  );
                },
              ),
              Divider(
                color: Color(0xFFEDEDED),
                thickness: 2,
              ),
              buildMessageTile(
                'تاي',
                'hello',
                'متصل',
                0,
                true, // المتصل
                _selectedImage,
                _pickImage,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatPage()),
                  );
                },
              ),
              Divider(
                color: Color(0xFFEDEDED),
                thickness: 2,
              ),
              buildMessageTile(
                'سوسن',
                'أرجو منكم إيجاد طلبي',
                'متصل',
                0,
                true, // المتصل
                _selectedImage,
                _pickImage,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatPage()),
                  );
                },
              ),
              Divider(
                color: Color(0xFFEDEDED),
                thickness: 2,
              ),
              buildMessageTile(
                'سمير',
                'مرحبا أين موقعكم؟',
                'متصل',
                0,
                true, // المتصل
                _selectedImage,
                _pickImage,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatPage()),
                  );
                },
              ),
              Divider(
                color: Color(0xFFEDEDED),
                thickness: 2,
              ),
              buildMessageTile(
                'شاكر',
                'مرحبا أين موقعكم؟',
                'متصل',
                0,
                false, // غير متصل
                _selectedImage,
                _pickImage,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatPage()),
                  );
                },
              ),
              Divider(
                color: Color(0xFFEDEDED),
                thickness: 2,
              ),
              buildMessageTile(
                'محمد',
                'مرحبا أين موقعكم؟',
                'منذ ساعة',
                0,
                false, // غير متصل
                _selectedImage,
                _pickImage,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNoMessagesView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/profile.jpeg'), // تأكد من أن المسار صحيح
          const SizedBox(height: 20),
          const Text('لا يوجد رسائل',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text('لا يتوفر لديك رسائل جديدة',
              style: TextStyle(fontSize: 14, color: Colors.grey[600])),
        ],
      ),
    );
  }

  Widget buildMessageTile(
      String userName,
      String message,
      String time,
      int messageCount,
      bool isOnline,
      File? selectedImage,
      Function pickImage,
      Function onTap) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          pickImage();
        },
        child: Stack(
          clipBehavior:
              Clip.none, // Allow children to overflow the Stack's bounds
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 30,
              backgroundImage: selectedImage != null
                  ? FileImage(selectedImage)
                  : null, // Use the selected image if available
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                // Wrap the green dot in a Container
                margin: EdgeInsets.only(
                    right: 2), // Adjust margin to position the dot correctly
                child: CircleAvatar(
                  backgroundColor:
                      isOnline ? Color(0xFF359F50) : Color(0xFF666666),
                  radius: 7,
                ),
              ),
            ),
          ],
        ),
      ),
      title: Text(
        userName,
        style: TextStyle(color: Colors.black),
      ),
      subtitle: Text(message),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: TextStyle(color: Color(0xFF666666)),
          ),
          if (messageCount > 0)
            CircleAvatar(
              backgroundColor: Color(0xFF0961F5),
              radius: 10,
              child: Text(
                '$messageCount',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
        ],
      ),
      onTap: () {
        onTap();
      },
    );
  }
}