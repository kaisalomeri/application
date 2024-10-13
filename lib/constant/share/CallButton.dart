import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallButton extends StatelessWidget {
  final String phoneNumber;

  // مُنشئ يأخذ رقم الهاتف كمعامل
  CallButton({required this.phoneNumber});

  // وظيفة الاتصال
  void _makePhoneCall(String number) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: number);
    try {
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        throw 'Could not launch $number';
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0XFF354B9F),
        minimumSize: const Size(110, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 4,
      ),
      onPressed: () {
        _makePhoneCall(phoneNumber); // استدعاء وظيفة الاتصال
      },
      icon: const Icon(Icons.phone, color: Colors.white),
      label: Text(
        phoneNumber,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
