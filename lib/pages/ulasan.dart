import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/pages/transaksi_pengembalian.dart';

class Ulasan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'ulasan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ReviewPage(),
    );
  }
}

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => pengembalian()),
            ); // Go back action
          },
        ),
         title: Image.asset(
          'assets/images/applogo.png',
          width: 100, 
          height: 50, 
          fit: BoxFit.contain,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'images/KKN.png', // Replace with your image URL
                height: 200,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Simpleman',
              style: TextStyle(fontSize: 18, color: Color(0xFF3ABD95)),
            ),
            Text(
              'KKN Di Desa Penari (Horror)',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star_half, color: Colors.yellow),
                SizedBox(width: 8),
                Text('4.5 (99+ Ulasan)'),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Berikan Ulasan Anda',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: Colors.yellow,
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                );
              }),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Ketik Ulasan Anda Disini..',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  ); // Handle posting review
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xFF3ABD95),
                  backgroundColor: Color(0xFFCAFFEF),
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Ubah angka sesuai kebutuhan
                  ),
                ),
                child: Text('Posting Ulasan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
