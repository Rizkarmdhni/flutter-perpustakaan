import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Login.dart';
import 'package:flutter_app/pages/edit_profil.dart';
import 'package:flutter_app/services/user_service.dart'; // Sesuaikan dengan path yang benar

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.only(right: 260.0),
          child: Text(
            'Profil',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              color: Colors.black,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.person, size: 30),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Username',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3ABD95),
                          ),
                        ),
                        Text('(John doe)'),
                        Text('johndodol@gmail.com'),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Icon(Icons.book, color: Color(0xFF3ABD95)),
                        Text('0 Buku'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Status:'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total Peminjaman: 00'),
                          Text('Total Pengembalian: 00'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              ProfileMenuItem(
                icon: Icons.edit,
                text: 'Edit Profil',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },
              ),
              ProfileMenuItem(
                icon: Icons.lock,
                text: 'Ganti Kata Sandi',
                onTap: () {
                  // Implement action for "Ganti Kata Sandi" here
                },
              ),
              ProfileMenuItem(
                icon: Icons.favorite,
                text: 'Buku Favorit',
                onTap: () {
                  // Implement action for "Buku Favorit" here
                },
              ),
              ProfileMenuItem(
                icon: Icons.exit_to_app,
                text: 'Keluar',
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: EdgeInsets.fromLTRB(20, 30, 20, 40),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Keluar dari Aplikasi',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Apakah Anda yakin ingin keluar?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                // Add your action for "Keluar" here
                                Navigator.push(context, MaterialPageRoute(builder: ((context) => Masuk())));
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Color(0xFF3ABD95), 
                                backgroundColor: Color(0xFFCAFFEF), // Warna teks
                                minimumSize: Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text('Keluar'),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                // Add your action for "Batal" here
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black, 
                                backgroundColor: Colors.grey, // Warna teks
                                minimumSize: Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text('Batal'),
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
        ),
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  ProfileMenuItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF3ABD95)),
        title: Text(text),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
