import 'package:flutter/material.dart';


class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profil',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
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
            SizedBox(height: 20.0),
            buildTextField('Username', 'Username'),
            buildTextField('Nama Depan', 'John'),
            buildTextField('Nama Belakang', 'doea'),
            buildTextField('E-mail', 'Contoh: johndododol@gmail.com'),
            buildUploadPhotoButton(),
            SizedBox(height: 20.0),
            buildSaveButton(context), // Menambahkan parameter context di sini
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: TextField(
          decoration: InputDecoration(
            labelText: labelText,
            hintText: placeholder,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildUploadPhotoButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: OutlinedButton.icon(
        onPressed: () {
          // Aksi ketika tombol "Upload Foto" ditekan
        },
        icon: Icon(Icons.upload_file),
        label: Text('Upload Foto'),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 105.0),
          side: BorderSide(color: Colors.grey),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  Widget buildSaveButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: ElevatedButton(
        onPressed: () {
          // Lakukan logika penyimpanan atau navigasi jika diperlukan
          Navigator.pop(context); // Contoh: kembali ke halaman sebelumnya
        },
        child: Text(
          'Simpan',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: Color(0xFF3ABD95), 
          backgroundColor: Color(0xFFCAFFEF),
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
