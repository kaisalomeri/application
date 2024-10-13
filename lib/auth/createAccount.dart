import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _phone = '';
  String _city = '';

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  Future<void> _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _phone = prefs.getString('phone') ?? '';
      _city = prefs.getString('city') ?? '';
    });
  }

  Future<void> _handleRegister() async {
    if (_formKey.currentState!.validate()) {
      // عرض Snackbar للإشارة إلى التحميل
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('جاري معالجة البيانات...'),
        backgroundColor: Colors.blue,
      ));

      // بيانات المستخدم المرسلة
      Map<String, String> userData = {
        'name': _nameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
        'phone': _phone,
        'city': _city,
      };

      // إعدادات الطلب
      var headersList = {
        'Accept': '*/*',
        'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
        'Content-Type': 'application/x-www-form-urlencoded',
      };
      var url = Uri.parse('http://127.0.0.1:8000/api/register');

      // إنشاء طلب POST
      var req = http.Request('POST', url);
      req.headers.addAll(headersList);
      req.bodyFields = userData;

      try {
        // إرسال الطلب
        var res = await req.send();
        final resBody = await res.stream.bytesToString();

        // إخفاء Snackbar الحالي
        ScaffoldMessenger.of(context).hideCurrentSnackBar();

        // التحقق من حالة الاستجابة
        if (res.statusCode >= 200 && res.statusCode < 300) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('تم إنشاء الحساب بنجاح!')),
          );
          // الانتقال إلى صفحة تسجيل الدخول
          Navigator.popAndPushNamed(context, '/baselayout');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('فشل إنشاء الحساب: $resBody')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('خطأ في الاتصال: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إنشاء حساب'),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildWelcomeText(context),
                      SizedBox(height: 20),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            _buildNameInputField(),
                            SizedBox(height: 16.0),
                            _buildEmailInputField(),
                            SizedBox(height: 16.0),
                            _buildPasswordInputField(),
                            SizedBox(height: 20.0),
                          ],
                        ),
                      ),
                      _buildLoginPrompt(context),
                      SizedBox(height: 10),
                      _buildSubmitButton(context),
                      SizedBox(height: 10.0),
                      _buildGoogleLoginButton(),
                      Spacer(),
                      // Center(child: PrivacyPolicyButton()),
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

  Widget _buildWelcomeText(BuildContext context) {
    return Text(
      'مرحبًا! \nأنشئ حسابًا جديدًا',
      style: Theme.of(context)
          .textTheme
          .headlineLarge
          ?.copyWith(fontSize: 26, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildNameInputField() {
    return TextFormField(
      controller: _nameController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFEEEEEE),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Container(
          margin: EdgeInsets.only(right: 10.0),
          child: Icon(Icons.person, color: Colors.black54),
        ),
        hintText: "الاسم",
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'يرجى إدخال الاسم';
        }
        return null;
      },
    );
  }

  Widget _buildEmailInputField() {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFEEEEEE),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Container(
          margin: EdgeInsets.only(right: 10.0),
          child: Icon(Icons.email, color: Colors.black54),
        ),
        hintText: "البريد الإلكتروني",
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'يرجى إدخال البريد الإلكتروني';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordInputField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFEEEEEE),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Container(
          margin: EdgeInsets.only(right: 10.0),
          child: Icon(Icons.lock, color: Colors.black54),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility : Icons.visibility_off,
            color: Colors.black54,
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
        hintText: 'كلمة المرور',
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'يرجى إدخال كلمة المرور';
        }
        return null;
      },
    );
  }

  Widget _buildLoginPrompt(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('لديك حساب بالفعل؟'),
        TextButton(
          onPressed: () => Navigator.popAndPushNamed(context, '/login'),
          child: Text('تسجيل الدخول'),
        ),
      ],
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print('تم الضغط على زر إنشاء حساب مستخدم');
        _handleRegister(); // استدعاء دالة _handleRegister
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
      child: Text('إنشاء حساب مستخدم'),
    );
  }

  Widget _buildGoogleLoginButton() {
    return ElevatedButton.icon(
      onPressed: () {
        print('تم النقر على تسجيل الدخول باستخدام Google');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Colors.black,
        side: BorderSide(color: Colors.grey, width: 1.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        minimumSize: Size(double.infinity, 50),
      ),
      icon: Icon(Icons.g_mobiledata),
      label: Text('تسجيل الدخول باستخدام Google'),
    );
  }
}
