import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SharePage extends StatelessWidget {
  final Map<String, String> socialMediaUrls = {
    'Facebook': 'https://www.facebook.com/sharer/sharer.php?u=YOUR_APP_URL',
    'Twitter': 'https://twitter.com/intent/tweet?url=YOUR_APP_URL',
    'WhatsApp': 'https://api.whatsapp.com/send?text=YOUR_APP_URL',
    'LinkedIn':
        'https://www.linkedin.com/shareArticle?mini=true&url=YOUR_APP_URL',
    'Instagram': 'https://www.instagram.com/yourprofile',
    'Telegram':
        'https://t.me/share/url?url=YOUR_APP_URL&text=Check%20out%20this%20app',
    'Reddit': 'https://www.reddit.com/submit?url=YOUR_APP_URL',
    'Pinterest':
        'https://www.pinterest.com/pin/create/button/?url=YOUR_APP_URL',
  };

  Future<void> _launchUrl(BuildContext context, String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Unable to launch URL: $url')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('شارك التطبيق'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'شارك التطبيق عبر وسائل التواصل الاجتماعي',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: socialMediaUrls.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final platform = socialMediaUrls.keys.elementAt(index);
                  final url = socialMediaUrls.values.elementAt(index);

                  IconData iconData;
                  switch (platform) {
                    case 'Facebook':
                      iconData = FontAwesomeIcons.facebookF;
                      break;
                    case 'Twitter':
                      iconData = FontAwesomeIcons.twitter;
                      break;
                    case 'WhatsApp':
                      iconData = FontAwesomeIcons.whatsapp;
                      break;
                    case 'LinkedIn':
                      iconData = FontAwesomeIcons.linkedinIn;
                      break;
                    case 'Instagram':
                      iconData = FontAwesomeIcons.instagram;
                      break;
                    case 'Telegram':
                      iconData = FontAwesomeIcons.telegram;
                      break;
                    case 'Reddit':
                      iconData = FontAwesomeIcons.redditAlien;
                      break;
                    case 'Pinterest':
                      iconData = FontAwesomeIcons.pinterestP;
                      break;
                    default:
                      iconData = Icons.share;
                      break;
                  }

                  return IconButton(
                    icon: Icon(
                      iconData,
                      size: 40.0,
                      color: Colors.blue,
                    ),
                    onPressed: () => _launchUrl(context, url),
                  );
                },
              ),
              SizedBox(height: 24.0),
              Text(
                'طلب المساعدة والدعم ؟',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/help');
                },
                child: Text(
                  'طلب المساعدة',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                'الشروط وسياسة الخصوصية؟',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/terms');
                },
                child: Text(
                  'عرض الشروط وسياسة الخصوصية',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 24.0),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 200.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
