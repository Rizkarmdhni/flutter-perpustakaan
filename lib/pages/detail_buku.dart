import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/pages/transaksi_peminjaman.dart';


class DetailBuku extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BookDetailsScreen(),
    );
  } 
}

class BookDetailsScreen extends StatefulWidget {
  @override
  _BookDetailsScreenState createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        title: Image.asset(
          'assets/images/applogo.png',
          width: 100, // Adjust the width as needed
          height: 50, // Adjust the height as needed
          fit: BoxFit.contain,
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorited ? Icons.favorite : Icons.favorite_border,
              color: isFavorited ? Colors.red : null,
            ),
            onPressed: () {
              setState(() {
                isFavorited = !isFavorited;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isFavorited
                        ? 'Favorit diaktifkan!'
                        : 'Favorit dinonaktifkan!',
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Menampilkan popup share dari bawah
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 200,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.share),
                          title: Text('Bagikan ke Aplikasi A'),
                          onTap: () {
                            // Tambahkan fungsionalitas berbagi di sini
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Dibagikan ke Aplikasi A'),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.share),
                          title: Text('Bagikan ke Aplikasi B'),
                          onTap: () {
                            // Tambahkan fungsionalitas berbagi di sini
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Dibagikan ke Aplikasi B'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: BookDetailsContent(),
    );
  }
}

class BookDetailsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'images/KKN.png', // Replace with actual image URL
                height: 300,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Simpleman',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3ABD95),
              ),
            ),
            Text(
              'KKN Di Desa Penari (Horror)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 18,
                ),
                Text(' 4.6 (109+ Ulasan)'),
              ],
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            // constraints: BoxConstraints(maxWidth: 300, maxHeight: 400), // Mengatur lebar dan tinggi maksimum dialog
                            padding: EdgeInsets.fromLTRB(20, 30, 20, 40),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Pinjam Buku',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Apakah anda ingin meminjam buku ini? Status peminjaman akan menjadi Menunggu Konfirmasi hingga peminjaman anda diterima oleh Admin.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize:
                                        10, // Ubah angka sesuai dengan kebutuhan
                                  ),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: ((context) => peminjaman())));
                                    // Add your action for "Pinjam Buku" here
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Color(0xFF3ABD95),
                                    backgroundColor: Color(0xFFCAFFEF),
                                    minimumSize: Size(double.infinity, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10), // Ubah angka sesuai kebutuhan
                                    ),
                                  ),
                                  child: Text('Pinjam Buku'),
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    // Add your action for "Tidak Jadi Pinjam" here
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Color(0xFFDDDDDD),
                                    minimumSize: Size(double.infinity, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10), // Ubah angka sesuai kebutuhan
                                    ),
                                  ),
                                  child: Text('Tidak Jadi Pinjam'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Color(0xFF3ABD95),
                backgroundColor: Color(0xFFCAFFEF), // Text color
              ),
              child: Text('Pinjam Buku'),
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.only(
                  bottom: 10.0, top: 20), // Adjust the value as needed
              child: Text(
                'Deskripsi Buku',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'KKN di Desa Penari adalah sebuah novel alih wahana dari sebuah utas Twitter yang viral di akun Twitter-nya Simpleman. Novel ini diterbitkan oleh Bukune pada 13 September 2019. Utas horor tersebut diposting pada 24 Juni 2019 dan menjadi viral karena kisahnya yang menarik dan bikin penasaran. Novel ini diambil berdasarkan kisah nyata, namun penulis mengubahnya menjadi cerita fiksi dan tidak ada karakter, kejadian, maupun lokasi yang persis seperti kenyataannya. Hal tersebut dilakukan penulis untuk menghindari sentimen dari beberapa pihak...',
              style: TextStyle(fontSize: 10),
              textAlign: TextAlign.justify,
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 30.0, bottom: 8.0), // Adjust the value as needed
              child: Text(
                'Detail',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InfoItem(
                        title: 'Jumlah Halaman',
                        content: '255',
                        fontSize: 12.0, // Specify fontSize
                      ),
                      InfoItem(
                        title: 'Tanggal Terbit',
                        content: '15 September 2019',
                        fontSize: 12.0, // Specify fontSize
                      ),
                      InfoItem(
                        title: 'ISBN',
                        content: '9786022202339',
                        fontSize: 12.0, // Specify fontSize
                      ),
                      InfoItem(
                        title: 'Bahasa',
                        content: 'Indonesia',
                        fontSize: 12.0, // Specify fontSize
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InfoItem(
                        title: 'Penerbit',
                        content: 'Kawah Media',
                        fontSize: 12.0, // Specify fontSize
                      ),
                      InfoItem(
                        title: 'Berat',
                        content: '0.215 Kg',
                        fontSize: 12.0, // Specify fontSize
                      ),
                      InfoItem(
                        title: 'Lebar',
                        content: '14.0 cm',
                        fontSize: 12.0, // Specify fontSize
                      ),
                      InfoItem(
                        title: 'Panjang',
                        content: '20.0 cm',
                        fontSize: 12.0, // Specify fontSize
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.only(
                  top: 30.0, bottom: 8.0), // Adjust the value as needed
              child: Text(
                'Ulasan',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ReviewTile(
              name: 'Rapah',
              rating: 5,
              comment:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            ),
            ReviewTile(
              name: 'Ripih',
              rating: 5,
              comment:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            ),
            ReviewTile(
              name: 'Ropoh',
              rating: 3,
              comment:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            ),
          ],
        ),
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  final String title;
  final String content;
  final double fontSize;

  InfoItem(
      {required this.title, required this.content, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2),
          Text(
            content,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class ReviewTile extends StatelessWidget {
  final String name;
  final int rating;
  final String comment;

  ReviewTile({required this.name, required this.rating, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              child: Icon(Icons.person),
            ),
            SizedBox(width: 8),
            Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 8),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.orange,
                  size: 15, // Ubah ukuran ikon di sini (misalnya 24)
                );
              }),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(comment),
        SizedBox(height: 16),
      ],
    );
  }
}
