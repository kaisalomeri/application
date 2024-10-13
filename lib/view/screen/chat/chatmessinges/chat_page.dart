import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  List<Message> _messages = [];
  File? _selectedImage;

  void _sendMessage() {
    if (_messageController.text.isNotEmpty || _selectedImage != null) {
      setState(() {
        _messages.add(
          Message(
            text: _messageController.text,
            isSent: true,
            image: _selectedImage, // إضافة الصورة للرسالة
          ),
        );
        _messageController.clear();
        _selectedImage = null; // إعادة تعيين الصورة بعد الإرسال
      });
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

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
        flexibleSpace: Container(
          decoration: BoxDecoration(
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
        ),
        title: Text(
          'الرسائل',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            _buildChatHeader(),
            Expanded(
              child: ListView.builder(
                reverse: false,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _buildMessageTile(_messages[index]);
                },
              ),
            ),
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildChatHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage:
                AssetImage('assets/images/profile.jpeg'), // استبدل بمسار صورتك
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'الاسم',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                    Text('(5)'),
                    SizedBox(width: 8),
                    Text('اب، اليمن', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {
              // إجراء مكالمة
            },
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              // حذف الرسائل
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMessageTile(Message message) {
    final isSent = message.isSent;
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: isSent
              ? LinearGradient(
                  colors: [
                    Color(0xFF354B9F),
                    Color(0xFF4D6595),
                  ],
                )
              : null,
          color: isSent ? null : Color(0xFFC1C4C3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment:
              isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (message.text.isNotEmpty)
              Text(
                message.text,
                style: TextStyle(color: isSent ? Colors.white : Colors.black),
              ),
            if (message.image != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.file(
                  message.image!,
                  width: 100, // يمكنك تعديل العرض حسب الحاجة
                  height: 100, // يمكنك تعديل الارتفاع حسب الحاجة
                  fit: BoxFit.cover,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      color: Color(0xFFE4E4E4),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.emoji_emotions),
            onPressed: () {
              // هنا يمكنك إضافة منطق عرض قائمة الإيموجي
            },
          ),
          IconButton(
            icon: Icon(Icons.image),
            onPressed: _pickImage,
          ),
          Expanded(
            child: TextField(
              controller: _messageController,
              textAlign: TextAlign.right, // محاذاة النص لليمين
              decoration: InputDecoration(
                hintText: 'مراسلة',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          IconButton(
            icon: _messageController.text.isEmpty
                ? Icon(Icons.mic)
                : Icon(Icons.send),
            onPressed: _messageController.text.isEmpty
                ? () {
                    // هنا يمكنك إضافة منطق تسجيل الصوت
                  }
                : _sendMessage,
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isSent;
  final File? image; // إضافة خاصية الصورة

  Message({required this.text, required this.isSent, this.image});
}