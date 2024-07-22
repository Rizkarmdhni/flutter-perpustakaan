import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/models/api_response.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/pages/buat_akun.dart';
import 'package:flutter_app/pages/forgot_password.dart';
import 'package:flutter_app/pages/loading.dart';
import 'package:flutter_app/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/services/user_service.dart';

class Masuk extends StatefulWidget {
  @override
  State<Masuk> createState() => _MasukState();
}

class _MasukState extends State<Masuk> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool loading = false;

  void _loginUser() async {
    ApiResponse response = await login(txtEmail.text, txtPassword.text);
    if (response.error == null) {
      _saveAndRedirectToHome(response.data as User);
    } else {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(''),
        flexibleSpace: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 0.0, top: 10.0),
            child: Image.asset(
              'images/applogo.png',
              width: 150,
              height: 90,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  // Widget lainnya untuk halaman Login
                  ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 20.0),
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Selamat Datang ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'kembali!',
                        style: TextStyle(
                          color: Color(0xFF3ABD95),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                child: Text(
                  'Ayo login terlebih dahulu untuk membaca buku!',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 20.0),
                child: Text(
                  'E-mail',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: txtEmail,
                      validator: (val) =>
                          val!.isEmpty ? 'Invalid email address' : null,
                      decoration: InputDecoration(
                        hintText: 'Masukkan Alamat Email Kamu',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kata Sandi',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: txtPassword,
                      obscureText: true,
                      validator: (val) =>
                          val!.length < 6 ? 'Required at least 6 chars' : null,
                      decoration: InputDecoration(
                        hintText: 'Minimal 6 - 12 Karakter',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 20.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordPage()),
                      ); // Tindakan saat teks "Lupa Kata Sandi" diklik
                    },
                    child: Text(
                      'Lupa Kata Sandi?',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF3ABD95),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 20.0, right: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          loading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : print("hellooo ${formkey}");
                          if (formkey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                              _loginUser();
                            });
                          }
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFFCAFFEF),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Text(
                              'Masuk',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3ABD95),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum punya akun?',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => CreateAccountScreen()),
                            (route) => false);
                      },  
                      child: Text(
                        ' Yuk Buat!',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF3ABD95),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
