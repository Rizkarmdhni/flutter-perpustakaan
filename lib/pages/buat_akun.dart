import 'package:flutter/material.dart';
import 'package:flutter_app/models/api_response.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/pages/login_screen.dart';
import 'package:flutter_app/pages/menu.dart';
import 'package:flutter_app/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'lenkapin_akun.dart'; // Pastikan HomePage diimpor
import 'login.dart'; // Pastikan LoginScreen diimpor
import '../constant.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool loading = false;
  TextEditingController nameController = TextEditingController(),
      emailController = TextEditingController(),
      passwordController = TextEditingController(),
      passwordConfirmController = TextEditingController();

  void _registerUser() async {
    ApiResponse response = await register(
        nameController.text,
        emailController.text,
        passwordController.text,
        passwordConfirmController.text);
    if (response.error == null) {
      _saveAndRedirectToHome(response.data as User);
    } else {
      setState(() {
        loading = !loading;
      });
      print(response.error);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('hhhhhhhh ${response.error}')));
    }
  }

  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Menu()), (route) => false);
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
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 20.0),
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Ayo buat akun ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'kamu!',
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
                  'Isi kotak di bawah sesuai dengan data kamu',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 20.0),
                child: Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: TextFormField(
                  controller: nameController,
                  validator: (val) => val!.isEmpty ? 'Invalid name' : null,
                  decoration: InputDecoration(
                    hintText: 'Masukan Name kamu',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) =>
                      val!.isEmpty ? 'Invalid email address' : null,
                  decoration: InputDecoration(
                    hintText: 'Masukan alamat email kamu',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
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
                      controller: passwordController,
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
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Konfirmasi Kata Sandi',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    TextFormField(
                      controller: passwordConfirmController,
                      obscureText: true,
                      validator: (val) => val != passwordController.text
                          ? 'Confirm password does not match'
                          : null,
                      decoration: InputDecoration(
                        hintText: 'Masukan ulang kata sandi',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
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
                          // loading
                          //   ? Center(child: CircularProgressIndicator(),
                          //   )
                          if (formkey.currentState!.validate()) {
                            setState(() {
                              loading = !loading;
                              _registerUser();
                            });
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => Masuk()),
                            // );
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
                              'Lanjutkan',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3ABD95),
                              ),
                            ),
                          ),
                        ),
                        //  if(formKey.currentState!.validate()){
                        //     setState(() {
                        //       loading = !loading;
                        //       _registerUser();
                        //     });
                        //   },
                      ),
                    ),
              Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah punya akun?',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => Masuk()),
                              (route) => false);
                        },
                        child: Text(
                          ' Masuk',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF3ABD95),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
