import 'package:flutter/material.dart';
import 'package:flutter_app/pages/login.dart';
import 'buat_akun.dart';

void main() {
  runApp(loding());
}

class loding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'images/applogo.png',
          width: 140,
          height: 100,
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(flex: 2),
              Image.asset(
                'images/gambar1.png',
                width: 200,
                height: 300,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Selamat Datang di\n',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Readly!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(58, 189, 149, 1),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateAccountScreen()),
                    );
                  },
                  child: Text(
                    'Buat Akun',
                    style: TextStyle(fontSize: 18, color: Color.fromRGBO(58, 189, 149, 1)),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFCAFFEF),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Sudah punya akun? Yuk masuk',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Masuk()),
                    );
                  },
                  child: Text(
                    'Masuk',
                    style: TextStyle(fontSize: 18, color: Color(0xFF3ABD95)),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFEAEAEA),
                  ),
                ),
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
