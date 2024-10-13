import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الشروط وسياسة الخصوصية'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'الأمن والأمان',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              _buildSection(
                title:
                    'ما الذي يقوم به السوق المفتوح للكشف عن وإزالة المخادعين والمحتالين من على المنصة؟',
                content:
                    'نحن نستخدم تقنيات متقدمة لمراقبة الأنشطة المشبوهة والتحقق من بيانات المستخدمين بشكل دوري. كما لدينا فريق مختص للتحقيق في أي شكاوى تتعلق بالخداع أو الاحتيال.',
              ),
              _buildSection(
                title:
                    'أعتقد أنني كنت عرضة لعملية خداع أو احتيال. ما الذي بإمكاني عمله الآن؟',
                content:
                    'إذا كنت تشك في أنك تعرضت لعملية خداع أو احتيال، يرجى الاتصال بفريق الدعم لدينا فوراً. سنقوم بالتحقيق في الأمر واتخاذ الإجراءات اللازمة.',
              ),
              _buildSection(
                title: 'ماذا لو أنا مستخدم خارج دول السوق المفتوح؟',
                content:
                    'نحن نقدم خدماتنا على مستوى دولي، ولكن بعض الميزات قد تختلف بناءً على موقعك. يرجى مراجعة سياساتنا الخاصة بكل منطقة أو الاتصال بالدعم للحصول على مزيد من المعلومات.',
              ),
              _buildSection(
                title:
                    'بصفتي معلناً، كيف بإمكاني استخدام السوق المفتوح بشكل آمن ومضمون؟',
                content:
                    'تأكد من تقديم معلومات دقيقة وصحيحة عن منتجاتك، وتجنب التعامل مع الأطراف المشبوهة. نحن نقدم أدوات وإرشادات لمساعدتك في تحقيق أقصى استفادة من المنصة بأمان.',
              ),
              _buildSection(
                title:
                    'بصفتي مشترياً، كيف بإمكاني استخدام السوق المفتوح بشكل آمن ومضمون؟',
                content:
                    'تحقق دائماً من مصداقية البائع وتجنب الدفع قبل استلام المنتج. استخدم خدمات الدفع الآمنة وتجنب مشاركة معلوماتك الشخصية مع أطراف غير موثوقة.',
              ),
              _buildSection(
                title:
                    'كيف يمكنني تقييم تجربتي مع البائعين لكي يستفيد منها المستخدمون الآخرون على السوق المفتوح؟',
                content:
                    'يمكنك تقديم تقييمك من خلال خاصية التقييم المتاحة على المنصة بعد إتمام عملية الشراء. تأكد من أن تعليقاتك دقيقة وتعكس تجربتك بشكل موضوعي.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            content,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}