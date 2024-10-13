import 'package:application_aqars/constant/buttons.dart';
import 'package:application_aqars/constant/share/appbar.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: 'إعادة تعيين كلمة المرور',
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildHeader(),
                      _buildPasswordInputField(
                          controller: _newPasswordController,
                          obscureText: _obscurePassword,
                          hintText: 'كلمة المرور الجديدة',
                          onVisibilityToggle: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          }),
                      SizedBox(height: 16.0),
                      _buildPasswordInputField(
                          controller: _confirmPasswordController,
                          obscureText: _obscureConfirmPassword,
                          hintText: 'تأكيد كلمة المرور',
                          onVisibilityToggle: () {
                            setState(() {
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword;
                            });
                          }),
                      SizedBox(height: 44.0),
                      _buildSubmitButton(),
                      _buildPrivacyPolicyButton(),
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

  Widget _buildHeader() {
    return Expanded(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Image.asset(
              'assets/images/resetpass.png',
              width: 180,
              height: 180,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 10),
            Text(
              'قم بتعيين كلمة مرور جديدة',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // دالة لإنشاء حقل إدخال كلمة المرور
  Widget _buildPasswordInputField({
    required TextEditingController controller,
    required bool obscureText,
    required String hintText,
    required VoidCallback onVisibilityToggle,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFEEEEEE),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(Icons.lock),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: onVisibilityToggle,
          ),
        ),
        hintText: hintText,
      ),
    );
  }

  // دالة لإنشاء زر إعادة تعيين كلمة المرور
  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        String newPassword = _newPasswordController.text;
        String confirmPassword = _confirmPasswordController.text;

        // يمكنك إضافة أي تحقق من كلمة المرور هنا إذا كنت بحاجة لذلك

        if (newPassword == confirmPassword) {
          print('كلمة المرور الجديدة: $newPassword');
          // هنا يمكنك إضافة كود لتحديث كلمة المرور في قاعدة البيانات إذا لزم الأمر

          // الانتقال إلى صفحة تسجيل الدخول
          Navigator.pushReplacementNamed(context,
              '/login'); // تأكد من أن '/login' هو اسم مسار صفحة تسجيل الدخول
        } else {
          // أضف رسالة تنبيه في حالة عدم تطابق كلمة المرور
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('كلمات المرور غير متطابقة!')),
          );
        }
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
      child: Text('إعادة تعيين كلمة المرور'),
    );
  }

  // دالة لإنشاء زر سياسة الخصوصية
  Widget _buildPrivacyPolicyButton() {
    return Expanded(
      child: Center(
        child: PrivacyPolicyButton(),
      ),
    );
  }
}
