

import 'package:application_aqars/constant/buttons.dart';
import 'package:application_aqars/constant/share/appbar.dart';
import 'package:flutter/material.dart';

class VertifiedCode extends StatefulWidget {
  const VertifiedCode({super.key});

  @override
  State<VertifiedCode> createState() => _VertifiedCodeState();
}

class _VertifiedCodeState extends State<VertifiedCode> {
  final List<TextEditingController> _controllers =
      List.generate(5, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: 'تأكيد الرمز',
        backRoute: '/login',
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(8),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: _buildBody(context),
                ),
              ),
            );
          },
        ),
      ),
    );
  }


  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildImage(),
        _buildInstructionText(context),
        SizedBox(height: 40),
        _buildVerificationCodeFields(),
        SizedBox(height: 1.0),
        _buildResendCodeButton(),
        SizedBox(height: 10),
        _buildVerifyCodeButton(context),
        SizedBox(height: 10),
        _buildPrivacyPolicyButton(),
      ],
    );
  }

  Widget _buildImage() {
    return Column(
      children: [
        SizedBox(height: 20),
        Image.asset(
          'assets/images/cofirm.png',
          width: 180,
          height: 180,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildInstructionText(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'قم بادخال رمز التحقق الذي وصل الى هاتفك او بريدك الالكتروني',
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildVerificationCodeFields() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          return Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: TextField(
                controller: _controllers[index],
                autofocus: index == 0,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 1,
                decoration: InputDecoration(
                  counterText: '', // Hides the character counter
                  filled: true,
                  fillColor: Color(0xFFEEEEEE), // Gray background
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  if (value.length == 1 && index < 4) {
                    FocusScope.of(context).nextFocus();
                  }
                },
              ),
            ),
          );
        }), // <- هذا هو المكان الذي كان ينقص فيه قوس الإغلاق
      ),
    );
  }

  Widget _buildResendCodeButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {
              // Handle resend code
              print('إعادة إرسال الرمز');
            },
            child: Text(
              'إعادة إرسال الرمز',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVerifyCodeButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: ElevatedButton(
        onPressed: () {
          // Handle verification code submission
          String code =
              _controllers.map((controller) => controller.text).join('');
          print('رمز التحقق: $code');
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.0),
        ),
        child: Text('تأكيد الرمز'),
      ),
    );
  }

  Widget _buildPrivacyPolicyButton() {
    return Expanded(
      child: Center(
        child: PrivacyPolicyButton(),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:mailer/mailer.dart';
// import 'package:mailer/smtp_server.dart';
// import 'dart:math';  // لاستخدام التوليد العشوائي للأرقام

// class VertifiedCode extends StatefulWidget {
//   const VertifiedCode({super.key});

//   @override
//   State<VertifiedCode> createState() => _VertifiedCodeState();
// }

// class _VertifiedCodeState extends State<VertifiedCode> {
//   final List<TextEditingController> _controllers =
//       List.generate(5, (index) => TextEditingController());
//   String verificationCode = '';  // رمز التحقق المرسل
//   String email = 'example@gmail.com';  // البريد الإلكتروني للمستخدم

//   @override
//   void initState() {
//     super.initState();
//     sendVerificationCode();  // إرسال الرمز عند فتح الشاشة
//   }

//   // دالة لتوليد رمز تحقق عشوائي
//   String generateRandomCode() {
//     var rng = Random();
//     return List.generate(5, (_) => rng.nextInt(10).toString()).join();
//   }

//   // دالة لإرسال البريد الإلكتروني
//   void sendVerificationCode() async {
//     String userEmail = email; // استبدل بالبريد الإلكتروني للمستخدم
//     verificationCode = generateRandomCode(); // توليد رمز التحقق

//     // إعداد تفاصيل SMTP (يفترض أنك تستخدم Gmail، يمكنك تعديل الإعدادات)
//     String username = 'your-email@gmail.com'; // بريدك الإلكتروني
//     String password = 'your-email-password'; // كلمة مرورك

//     final smtpServer = gmail(username, password);

//     final message = Message()
//       ..from = Address(username, 'اسم التطبيق')
//       ..recipients.add(userEmail)
//       ..subject = 'رمز التحقق الخاص بك'
//       ..text = 'رمز التحقق الخاص بك هو: $verificationCode';

//     try {
//       final sendReport = await send(message, smtpServer);
//       print('Message sent: ' + sendReport.toString());
//     } on MailerException catch (e) {
//       print('Message not sent. \n${e.toString()}');
//     }
//   }

//   // التحقق من الرمز المدخل
//   void verifyCode() {
//     String inputCode = _controllers.map((controller) => controller.text).join('');
//     if (inputCode == verificationCode) {
//       print('تم التحقق بنجاح!');
//       Navigator.pushNamed(context, '/nextScreen');
//     } else {
//       print('الرمز غير صحيح!');
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('رمز التحقق غير صحيح'),
//         backgroundColor: Colors.red,
//       ));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('تأكيد الرمز'),
//       ),
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('قم بإدخال رمز التحقق المرسل إلى بريدك الإلكتروني'),
//             _buildVerificationCodeFields(),
//             ElevatedButton(
//               onPressed: verifyCode,  // تحقق من الرمز عند الضغط
//               child: Text('تأكيد الرمز'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildVerificationCodeFields() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 18),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: List.generate(5, (index) {
//           return Expanded(
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 4),
//               child: TextField(
//                 controller: _controllers[index],
//                 autofocus: index == 0,
//                 keyboardType: TextInputType.number,
//                 textAlign: TextAlign.center,
//                 maxLength: 1,
//                 decoration: InputDecoration(
//                   counterText: '',  // إخفاء عداد الحروف
//                   filled: true,
//                   fillColor: Color(0xFFEEEEEE),  // خلفية الحقل
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//                 onChanged: (value) {
//                   if (value.length == 1 && index < 4) {
//                     FocusScope.of(context).nextFocus();
//                   }
//                 },
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
