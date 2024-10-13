import 'package:application_aqars/constant/buttons.dart';
import 'package:application_aqars/constant/share/appbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TypeAuth extends StatefulWidget {
  const TypeAuth({super.key});

  @override
  State<TypeAuth> createState() => _TypeAuthState();
}

class _TypeAuthState extends State<TypeAuth> {
  bool _isAgreed = false;
  final TextEditingController _phoneController = TextEditingController();
  String? _selectedCity;

  final List<String> _cities = [
    'صنعاء',
    'عدن',
    'المكلا',
    'تعز',
    'الحديدة',
    'إب',
    'الضالع',
  ];

  @override
  void initState() {
    super.initState();
    _loadSavedData(); // تحميل البيانات المحفوظة عند بدء التطبيق
  }

  Future<void> _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _phoneController.text = prefs.getString('phone') ?? '';
      _selectedCity = prefs.getString('city');
    });
  }

  Future<void> _saveData(String phone, String city) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('phone', phone);
    await prefs.setString('city', city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: 'دعونا نسجل الدخول',
        backRoute: '/login',
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildWelcomeText(),
                      const Spacer(),
                      _buildPhoneInput(),
                      const SizedBox(height: 16.0),
                      _buildCityDropdown(),
                      const SizedBox(height: 16.0),
                      _buildAgreementCheckbox(),
                      const SizedBox(height: 16.0),
                      _buildActionButtons(),
                      const SizedBox(height: 10.0),
                      const Expanded(
                        child: Center(
                          child: PrivacyPolicyButton(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // دالة لبناء نص الترحيب
  Widget _buildWelcomeText() {
    return Text(
      'مرحبًا بك \n',
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
      textAlign: TextAlign.center,
    );
  }

  // دالة لبناء حقل إدخال رقم الهاتف
  Widget _buildPhoneInput() {
    return TextField(
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFEEEEEE),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Icon(Icons.phone),
        ),
        hintText: 'رقم الهاتف',
      ),
    );
  }

  // دالة لبناء قائمة منسدلة للاختيار المدينة
  Widget _buildCityDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedCity,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFEEEEEE),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Icon(Icons.location_city),
        ),
        hintText: 'اختر المدينة',
      ),
      items: _cities.map((String city) {
        return DropdownMenuItem<String>(
          value: city,
          child: Text(city),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedCity = newValue;
        });
      },
    );
  }

  // دالة لبناء خانة اختيار الموافقة
  Widget _buildAgreementCheckbox() {
    return Row(
      children: [
        Checkbox(
          value: _isAgreed,
          onChanged: (bool? value) {
            setState(() {
              _isAgreed = value ?? false;
            });
          },
        ),
        Expanded(
          child: Text(
            'أوافق على الشروط والأحكام',
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
      ],
    );
  }

  // دالة لبناء أزرار الحساب التجاري والمستخدم
  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // _buildElevatedButton(
        //   label: 'حساب تجاري',
        //   onPressed: () => _handleButtonPress('/providerAuth'),
        //   color: Theme.of(context).primaryColor,
        // ),
        _buildElevatedButton(
          label: 'حساب مستخدم',
          onPressed: () => _handleButtonPress('/createAccount'),
          color: Colors.grey[700],
        ),
      ],
    );
  }

  // دالة لبناء زر مرتفع
  Widget _buildElevatedButton({
    required String label,
    required VoidCallback onPressed,
    required Color? color,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        minimumSize: const Size(150, 50),
      ),
      child: Text(label),
    );
  }

  // دالة لمعالجة الضغط على الأزرار
  void _handleButtonPress(String route) {
    if (_isAgreed) {
      String phone = _phoneController.text;
      String city = _selectedCity ?? 'غير محدد';
      print('رقم الهاتف: $phone');
      print('المدينة: $city');
      _saveData(phone, city); // حفظ البيانات
      Navigator.popAndPushNamed(context, route);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى الموافقة على الشروط والأحكام'),
        ),
      );
    }
  }
}
