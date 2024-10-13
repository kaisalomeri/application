// import 'package:application_aqars/constant/buttons.dart';
// import 'package:application_aqars/constant/share/appbar.dart';
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   bool _obscurePassword = true;
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   Dio _dio = Dio();

//   Future<Response> login(String email, String password) async {
//     try {
//       Response response = await _dio.post(
//         'http://127.0.0.1:8000/api/login',
//         data: {
//           'email': email,
//           'password': password,
//         },
//       );
//       return response;
//     } on DioError catch (e) {
//       return e.response!.data;
//     }
//   }

//   Future<void> loginUsers() async {
//     if (_formKey.currentState!.validate()) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: const Text('Processing Data'),
//         backgroundColor: Colors.green.shade300,
//       ));

//       dynamic res = await login(
//         _emailController.text,
//         _passwordController.text,
//       );

//       ScaffoldMessenger.of(context).hideCurrentSnackBar();

//       if (res['access_token'] != null) {
//         String accessToken = res['access_token'];
//         Navigator.pushNamed(context, '/home', arguments: accessToken);
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('Error: ${res['error']}'),
//           backgroundColor: Colors.red.shade300,
//         ));
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: GlobalAppBar(
//         title: 'نسجل الدخول',
//         backRoute: '/login',
//       ),
//       resizeToAvoidBottomInset: true,
//       body: SafeArea(
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             return SingleChildScrollView(
//               padding: EdgeInsets.all(8),
//               child: ConstrainedBox(
//                 constraints: BoxConstraints(
//                   minHeight: constraints.maxHeight,
//                 ),
//                 child: IntrinsicHeight(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       _buildWelcomeText(context),
//                       Spacer(),
//                       Form(
//                         key: _formKey,
//                         child: Column(
//                           children: [
//                             _buildEmailInputField(),
//                             SizedBox(height: 16.0),
//                             _buildPasswordInputField(),
//                           ],
//                         ),
//                       ),
//                       _buildForgotPasswordButton(context),
//                       SizedBox(height: 5.0),
//                       _buildCreateAccountRow(context),
//                       SizedBox(height: 5.0),
//                       _buildLoginButton(context),
//                       SizedBox(height: 10.0),
//                       _buildGoogleLoginButton(),
//                       Expanded(
//                         child: Center(
//                           child: PrivacyPolicyButton(),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildWelcomeText(BuildContext context) {
//     return Text(
//       'مرحبًا بك \n',
//       style: Theme.of(context)
//           .textTheme
//           .headlineLarge
//           ?.copyWith(fontSize: 26, fontWeight: FontWeight.bold),
//       textAlign: TextAlign.center,
//     );
//   }

//   Widget _buildEmailInputField() {
//     return TextFormField(
//       controller: _emailController,
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'يرجى إدخال البريد الإلكتروني';
//         } else if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
//             .hasMatch(value)) {
//           return 'يرجى إدخال بريد إلكتروني صحيح';
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Color(0xFFEEEEEE),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(50.0),
//           borderSide: BorderSide.none,
//         ),
//         prefixIcon: Padding(
//           padding: const EdgeInsets.only(right: 10.0),
//           child: Icon(Icons.email),
//         ),
//         hintText: "البريد الإلكتروني",
//       ),
//     );
//   }

//   Widget _buildPasswordInputField() {
//     return TextFormField(
//       controller: _passwordController,
//       obscureText: _obscurePassword,
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'يرجى إدخال كلمة المرور';
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Color(0xFFEEEEEE),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(50.0),
//           borderSide: BorderSide.none,
//         ),
//         prefixIcon: Padding(
//           padding: const EdgeInsets.only(right: 10.0),
//           child: Icon(Icons.lock),
//         ),
//         suffixIcon: IconButton(
//           icon: Icon(
//             _obscurePassword ? Icons.visibility : Icons.visibility_off,
//           ),
//           onPressed: () {
//             setState(() {
//               _obscurePassword = !_obscurePassword;
//             });
//           },
//         ),
//         hintText: 'كلمة المرور',
//       ),
//     );
//   }

//   Widget _buildForgotPasswordButton(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: TextButton(
//         onPressed: () {
//           Navigator.popAndPushNamed(context, '/forgetPassword');
//         },
//         child: Text(
//           'نسيت كلمة المرور؟',
//           style: TextStyle(
//             color: Theme.of(context).primaryColor,
//             fontSize: 16.0,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCreateAccountRow(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text('ليس لديك حساب؟'),
//         TextButton(
//           onPressed: () => Navigator.popAndPushNamed(context, '/typeAuth'),
//           child: Text('إنشاء حساب'),
//         ),
//       ],
//     );
//   }

//   Widget _buildLoginButton(BuildContext context) {
//     return ElevatedButton(
//       onPressed: loginUsers,
//       style: ElevatedButton.styleFrom(
//         minimumSize: Size(double.infinity, 50),
//         backgroundColor: Theme.of(context).primaryColor,
//         foregroundColor: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(100.0),
//         ),
//         padding: EdgeInsets.symmetric(vertical: 10.0),
//       ),
//       child: Text('تسجيل الدخول'),
//     );
//   }

//   Widget _buildGoogleLoginButton() {
//     return ElevatedButton.icon(
//       onPressed: () {
//         print('تم النقر على تسجيل الدخول باستخدام Google');
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Theme.of(context).colorScheme.secondary,
//         foregroundColor: Colors.black,
//         side: BorderSide(color: Colors.grey, width: 1.0),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(100.0),
//         ),
//         padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//         minimumSize: Size(double.infinity, 50),
//       ),
//       label: Text('اٟنشاء حساب بواسطة جوجل'),
//       icon: Icon(Icons.g_translate, color: Colors.black),
//     );
//   }
// }
import 'package:application_aqars/constant/buttons.dart';
import 'package:application_aqars/constant/share/appbar.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Dio _dio = Dio();

  Future<Response> login(String email, String password) async {
    // إعداد الهيدرات
    var headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
    };

    Response response = await _dio.post(
      'http://127.0.0.1:8000/api/login',
      options: Options(headers: headersList),
      data: {
        'email': email,
        'password': password,
      },
    );
    return response;
  }

  Future<void> loginUsers() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));

      dynamic res = await login(
        _emailController.text,
        _passwordController.text,
      );

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      // تحقق مما إذا كانت البيانات المدخلة صحيحة
      if (res.statusCode == 200 && res.data['access_token'] != null) {
        String accessToken = res.data['access_token'];
        Navigator.pushNamed(context, '/home', arguments: accessToken);
      } else {
        // إذا كانت بيانات الدخول غير صحيحة
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text('Error: ${res.data['error'] ?? 'تسجيل الدخول غير صحيح'}'),
          backgroundColor: Colors.red.shade300,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: 'نسجل الدخول',
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
                      _buildWelcomeText(context),
                      Spacer(),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            _buildEmailInputField(),
                            SizedBox(height: 16.0),
                            _buildPasswordInputField(),
                          ],
                        ),
                      ),
                      _buildForgotPasswordButton(context),
                      SizedBox(height: 5.0),
                      _buildCreateAccountRow(context),
                      SizedBox(height: 5.0),
                      _buildLoginButton(context),
                      SizedBox(height: 10.0),
                      _buildGoogleLoginButton(),
                      Expanded(
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

  Widget _buildWelcomeText(BuildContext context) {
    return Text(
      'مرحبًا بك \n',
      style: Theme.of(context)
          .textTheme
          .headlineLarge
          ?.copyWith(fontSize: 26, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildEmailInputField() {
    return TextFormField(
      controller: _emailController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'يرجى إدخال البريد الإلكتروني';
        } else if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
            .hasMatch(value)) {
          return 'يرجى إدخال بريد إلكتروني صحيح';
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFEEEEEE),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(Icons.email),
        ),
        hintText: "البريد الإلكتروني",
      ),
    );
  }

  Widget _buildPasswordInputField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _obscurePassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'يرجى إدخال كلمة المرور';
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFEEEEEE),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(Icons.lock),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
        hintText: 'كلمة المرور',
      ),
    );
  }

  Widget _buildForgotPasswordButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, '/forgetPassword');
        },
        child: Text(
          'نسيت كلمة المرور؟',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  Widget _buildCreateAccountRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('ليس لديك حساب؟'),
        TextButton(
          onPressed: () => Navigator.popAndPushNamed(context, '/typeAuth'),
          child: Text('إنشاء حساب'),
        ),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: loginUsers,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 10.0),
      ),
      child: Text('تسجيل الدخول'),
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
      label: Text('اٟنشاء حساب بواسطة جوجل'),
      icon: Icon(Icons.g_translate, color: Colors.black),
    );
  }
}
