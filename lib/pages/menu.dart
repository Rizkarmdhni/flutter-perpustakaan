import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/pages/detail_buku.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart'; 

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final TextEditingController _searchController = TextEditingController();
  get controller => null;
  get onChanged => null;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    print("Search query: $query");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 147, 255, 222),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(
              16.0), // Adjusted preferred size to fit the content
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 250, 10),
                // Add padding around the Image.asset
                child: Image.asset(
                  'assets/images/applogo.png',
                  height: 50, // Increased the height of the image
                  width: 100, // Increased the width of the image
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color for the SearchBar
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                          20.0), // Circular shape for top left corner
                      topRight: Radius.circular(
                          20.0), // Circular shape for top right corner
                    ),
                  ),
                  child: SearchBar(
                    controller: _searchController,
                    onChanged: _onSearchChanged,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Column(
                    children: [
                      Container(
                        child: Row(
                          crossAxisAlignment:
                              CrossAxisAlignment.start, // Align to the top
                          children: [
                            Expanded(
                              flex: 10,
                              child: Container(
                                margin: EdgeInsets.only(top: 18),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 2,
                                  ),
                                ),
                                child: TextField(
                                  controller: controller,
                                  onChanged: onChanged,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.search),
                                    hintText: 'Ketik Judul Buku Disini...',
                                    hintStyle: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: const Color(0xFF5F5F5F),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(12),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0), // Add padding to the left
                              child: Container(
                                margin: EdgeInsets.only(top: 18),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 2,
                                  ),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    // Handle onPressed action here
                                  },
                                  icon: Icon(
                                    Icons.border_all_rounded,
                                    size: 30,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height:
                              20), // Add some spacing between the search bar and the genre section
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(2, 0, 2, 17),
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Pilih Genre Yang Cocok Untukmu!',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: Color(0xFF272727),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 0, 0, 19),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      // Fungsi untuk menangani pemilihan kategori HORROR
                                    },
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 0, 4),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFF7375),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Container(
                                                width: 65,
                                                height: 65,
                                                padding: EdgeInsets.fromLTRB(
                                                    16, 16, 15, 15),
                                                child: SizedBox(
                                                  width: 34,
                                                  height: 34,
                                                  child: SvgPicture.asset(
                                                    'assets/vectors/ghost_x2.svg',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: Text(
                                              'HORROR',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w800,
                                                fontSize: 9,
                                                color: Color(0xFF575757),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      // Fungsi untuk menangani pemilihan kategori LOVE
                                    },
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 23, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 0, 4),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFB9EBB),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Container(
                                                width: 65,
                                                height: 65,
                                                padding: EdgeInsets.fromLTRB(
                                                    17.6, 19.3, 17.6, 19.3),
                                                child: SizedBox(
                                                  width: 29.8,
                                                  height: 26.4,
                                                  child: SvgPicture.asset(
                                                    'assets/vectors/vector_16_x2.svg',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                19, 0, 15, 0),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                'LOVE',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 9,
                                                  color: Color(0xFF575757),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      // Fungsi untuk menangani pemilihan kategori SEJARAH
                                    },
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 23, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 0, 4),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFF627EF8),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Container(
                                                width: 65,
                                                height: 65,
                                                padding: EdgeInsets.fromLTRB(
                                                    13, 23, 13, 23),
                                                child: SizedBox(
                                                  width: 39,
                                                  height: 19,
                                                  child: SvgPicture.asset(
                                                    'assets/vectors/vector_x2.svg',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(4, 0, 4, 0),
                                            child: Text(
                                              'SEJARAH',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w800,
                                                fontSize: 9,
                                                color: Color(0xFF575757),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      // Fungsi untuk menangani pemilihan kategori ILMIAH
                                    },
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 23, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 0, 4),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFAFD6D5),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Container(
                                                width: 65,
                                                height: 65,
                                                padding: EdgeInsets.fromLTRB(
                                                    18.1, 16, 18.1, 16),
                                                child: SizedBox(
                                                  width: 28.7,
                                                  height: 33,
                                                  child: SvgPicture.asset(
                                                    'assets/vectors/group_x2.svg',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(6, 0, 6, 0),
                                            child: Text(
                                              'ILMIAH',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w800,
                                                fontSize: 9,
                                                color: Color(0xFF575757),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 0, 0, 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      // Fungsi untuk menangani pemilihan kategori CODING
                                    },
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 23, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFF6DECA0),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Container(
                                                width: 65,
                                                height: 65,
                                                padding: EdgeInsets.fromLTRB(
                                                    16.2, 17.8, 16.2, 10),
                                                child: SizedBox(
                                                  width: 32.5,
                                                  height: 29.3,
                                                  child: SvgPicture.asset(
                                                    'assets/vectors/coding_x2.svg',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(1, 0, 0, 0),
                                            child: Text(
                                              'CODING',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w800,
                                                fontSize: 9,
                                                color: Color(0xFF575757),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      // Fungsi untuk menangani pemilihan kategori JEPANG
                                    },
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 23, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFF9FCBE8),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Container(
                                                height: 65,
                                                width: 65,
                                                padding: EdgeInsets.fromLTRB(
                                                    18.6, 19.7, 18.6, 18.7),
                                                child: SizedBox(
                                                  width: 25.3,
                                                  height: 26.7,
                                                  child: SvgPicture.asset(
                                                    'assets/vectors/vector_27_x2.svg',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                11.5, 0, 0, 0),
                                            child: Text(
                                              'JEPANG',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w800,
                                                fontSize: 9,
                                                color: Color(0xFF575757),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      // Fungsi untuk menangani pemilihan kategori CRYPTO
                                    },
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 23, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFB3A0E3),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Container(
                                                width: 65,
                                                height: 65,
                                                padding: EdgeInsets.fromLTRB(
                                                    16.5, 15, 15.5, 14),
                                                child: SizedBox(
                                                  width: 33,
                                                  height: 36,
                                                  child: SvgPicture.asset(
                                                    'assets/vectors/vector_12_x2.svg',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(2, 0, 2, 0),
                                            child: Text(
                                              'CRYPTO',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w800,
                                                fontSize: 9,
                                                color: Color(0xFF575757),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      // Fungsi untuk menangani pemilihan kategori NOVEL
                                    },
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 23, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFF64B2EC),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Container(
                                                width: 65,
                                                height: 65,
                                                padding: EdgeInsets.fromLTRB(
                                                    14.1, 18.8, 15.6, 18.8),
                                                child: SizedBox(
                                                  width: 35.3,
                                                  height: 27.4,
                                                  child: SvgPicture.asset(
                                                    'assets/vectors/image_3_x2.svg',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(5, 0, 5, 0),
                                            child: Text(
                                              'NOVEL',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w800,
                                                fontSize: 9,
                                                color: Color(0xFF575757),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(2, 0, 0, 15),
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Buku Teratas',
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: Color(0xFF272727),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ],
                      ),
                     Column(
  children: [
    // First Row
    Row(
      children: [
        // Column 1
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailBuku()),
              );
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 0, 10, 15),
              width: 150,
              height: 246,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFBFBFBF)),
                borderRadius: BorderRadius.circular(17),
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/image_1.png'),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      child: Container(
                        width: 164,
                        height: 100,
                        padding: EdgeInsets.fromLTRB(2, 8, 0, 8),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/kkn_1.jpeg'),
                            ),
                          ),
                          child: Container(
                            width: 90,
                            height: 76,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 0, 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(4, 0, 0, 0),
                          child: Text(
                            'KKN Di Desa Penari',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 11,
                              color: Color(0xFF272727),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(4, 2.4, 2.4, 2.4),
                          width: 9.3,
                          height: 8.3,
                          child: SizedBox(
                            width: 9.3,
                            height: 8.3,
                            child: SvgPicture.asset('assets/vectors/vector_17_x2.svg'),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 3, 0, 3),
                          child: Text(
                            '4.5',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 6,
                              color: Color(0xFF272727),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 6),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Simpleman',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 9,
                          color: Color(0xFF3ABD95),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 2),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFABABAB),
                        ),
                        child: Container(
                          width: 48,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Container(
                      width: 164,
                      height: 57,
                      padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                      child: Text(
                        'KKN di Desa Penari adalah novel alih wahana dari sebuah Twitter yang viral di akun Twitter-nya Simpleman.',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 8,
                          color: Color(0xFF5F5F5F),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 73.5, 0),
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFCAFFEF),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 2, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 6, 0),
                                width: 8,
                                height: 10,
                                child: SizedBox(
                                  width: 10,
                                  height: 13,
                                  child: SvgPicture.asset('assets/vectors/vector_35_x2.svg'),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
                                child: Text(
                                  'Dapatkan',
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 7,
                                    color: Color(0xFF3ABD95),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Column 2
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailBuku()),
              );
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 0, 10, 15),
              width: 150,
              height: 246,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFBFBFBF)),
                borderRadius: BorderRadius.circular(17),
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/image_1.png'),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      child: Container(
                        width: 164,
                        height: 100,
                        padding: EdgeInsets.fromLTRB(2, 8, 0, 8),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/kkn_1.jpeg'),
                            ),
                          ),
                          child: Container(
                            width: 90,
                            height: 76,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 0, 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(4, 0, 0, 0),
                          child: Text(
                            'KKN Di Desa Penari',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 11,
                              color: Color(0xFF272727),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(4, 2.4, 2.4, 2.4),
                          width: 9.3,
                          height: 8.3,
                          child: SizedBox(
                            width: 9.3,
                            height: 8.3,
                            child: SvgPicture.asset('assets/vectors/vector_17_x2.svg'),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 3, 0, 3),
                          child: Text(
                            '4.0',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 6,
                              color: Color(0xFF272727),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 6),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Simplaman',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 9,
                          color: Color(0xFF3ABD95),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 2),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFABABAB),
                        ),
                        child: Container(
                          width: 48,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Container(
                      width: 164,
                      height: 57,
                      padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                      child: Text(
                        'KKN di Desa Penari adalah novel alih wahana dari sebuah Twitter yang viral di akun Twitter-nya Simpleman.',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 8,
                          color: Color(0xFF5F5F5F), 
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 73.5, 0),
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFCAFFEF),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 2, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 6, 0),
                                width: 8,
                                height: 10,
                                child: SizedBox(
                                  width: 10,
                                  height: 13,
                                  child: SvgPicture.asset('assets/vectors/vector_35_x2.svg'),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
                                child: Text(
                                  'Dapatkan',
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 7,
                                    color: Color(0xFF3ABD95),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
    // Second Row
    Row(
      children: [
        // Column 3
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailBuku()),
              );
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 0, 10, 15),
              width: 150,
              height: 246,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFBFBFBF)),
                borderRadius: BorderRadius.circular(17),
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/image_1.png'),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      child: Container(
                        width: 164,
                        height: 100,
                        padding: EdgeInsets.fromLTRB(2, 8, 0, 8),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/kkn_1.jpeg'),
                            ),
                          ),
                          child: Container(
                            width: 90,
                            height: 76,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 0, 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(4, 0, 0, 0),
                          child: Text(
                            'KKN Di Desa Penari',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 11,
                              color: Color(0xFF272727),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(4, 2.4, 2.4, 2.4),
                          width: 9.3,
                          height: 8.3,
                          child: SizedBox(
                            width: 9.3,
                            height: 8.3,
                            child: SvgPicture.asset('assets/vectors/vector_17_x2.svg'),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 3, 0, 3),
                          child: Text(
                            '4.2',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 6,
                              color: Color(0xFF272727),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 6),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Author 3Simmpleman',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 9,
                          color: Color(0xFF3ABD95),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 2),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFABABAB),
                        ),
                        child: Container(
                          width: 48,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Container(
                      width: 164,
                      height: 57,
                      padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                      child: Text(
                        'KKN di Desa Penari adalah novel alih wahana dari sebuah Twitter yang viral di akun Twitter-nya Simpleman.',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 8,
                          color: Color(0xFF5F5F5F),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 73.5, 0),
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFCAFFEF),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 2, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 6, 0),
                                width: 8,
                                height: 10,
                                child: SizedBox(
                                  width: 10,
                                  height: 13,
                                  child: SvgPicture.asset('assets/vectors/vector_35_x2.svg'),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
                                child: Text(
                                  'Dapatkan',
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 7,
                                    color: Color(0xFF3ABD95),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Column 4
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailBuku()),
              );
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 0, 10, 15),
              width: 150,
              height: 246,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFBFBFBF)),
                borderRadius: BorderRadius.circular(17),
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/image_1.png'),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      child: Container(
                        width: 164,
                        height: 100,
                        padding: EdgeInsets.fromLTRB(2, 8, 0, 8),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/kkn_1.jpeg'),
                            ),
                          ),
                          child: Container(
                            width: 90,
                            height: 76,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 0, 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(4, 0, 0, 0),
                          child: Text(
                            'KKN Di Desa Penari',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 11,
                              color: Color(0xFF272727),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(4, 2.4, 2.4, 2.4),
                          width: 9.3,
                          height: 8.3,
                          child: SizedBox(
                            width: 9.3,
                            height: 8.3,
                            child: SvgPicture.asset('assets/vectors/vector_17_x2.svg'),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 3, 0, 3),
                          child: Text(
                            '4.8',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 6,
                              color: Color(0xFF272727),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 6),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Simpleman',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 9,
                          color: Color(0xFF3ABD95),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 2),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFABABAB),
                        ),
                        child: Container(
                          width: 48,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Container(
                      width: 164,
                      height: 57,
                      padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                      child: Text(
                        'KKN di Desa Penari adalah novel alih wahana dari sebuah Twitter yang viral di akun Twitter-nya Simpleman.',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 8,
                          color: Color(0xFF5F5F5F),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 73.5, 0),
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFCAFFEF),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 2, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 6, 0),
                                width: 8,
                                height: 10,
                                child: SizedBox(
                                  width: 10,
                                  height: 13,
                                  child: SvgPicture.asset('assets/vectors/vector_35_x2.svg'),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
                                child: Text(
                                  'Dapatkan',
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 7,
                                    color: Color(0xFF3ABD95),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  ],
   ),

                    ],
                  ) 
                  // Your existing content here
                ]),
              ))
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  SearchBar({required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}
