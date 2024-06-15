// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:surat_app/view/home_page.dart';

class OnboardScreen extends StatefulWidget {
  OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  PageController _pageController = PageController();
  int currentIndex = 0;

  List<AllinOnboardModel> allinonboardlist = [
    AllinOnboardModel(
      "assets/orang.png",
      "Kelola surat masuk, surat keluar, dan tugas dengan mudah dan efisien. Aplikasi kami membantu Anda mencatat poin-poin penting dari setiap surat dalam bentuk daftar yang terorganisir. Dengan kategori dan warna berbeda untuk setiap jenis surat, Anda dapat mengidentifikasi dan mengakses informasi penting dengan cepat. Manajemen surat jadi lebih sederhana dan efektif.",
      "Selamat Datang di Aplikasi ToDo List Surat",
    ),
    AllinOnboardModel(
      "assets/terbang.png",
      "Setiap surat yang Anda terima dapat dikategorikan dan diberi warna sesuai jenisnya, memudahkan Anda untuk melihat dan mengaksesnya dengan cepat. Tidak hanya itu, poin-poin penting dari setiap surat dapat dicatat dalam daftar yang jelas dan terstruktur.",
      "Fitur Unggulan untuk Manajemen Surat yang Lebih Baik",
    ),
    AllinOnboardModel(
      "assets/lari.png",
      "Aplikasi To-Do List Surat membantu Anda untuk tetap teratur dan fokus pada tugas-tugas penting. Dengan alat ini, Anda dapat memastikan bahwa setiap surat didokumentasikan dengan baik dan tidak ada informasi yang terlewatkan.",
      "Tingkatkan Produktivitas dengan Manajemen Surat yang Efektif",
    ),
  ];

  void _updateIndexAndText(int newIndex) {
    setState(() {
      currentIndex = newIndex;

      if (currentIndex == allinonboardlist.length - 1) {
        Future.delayed(const Duration(milliseconds: 3800), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (value) {
              _updateIndexAndText(value);
            },
            itemCount: allinonboardlist.length,
            itemBuilder: (context, index) {
              return PageBuilderWidget(
                title: allinonboardlist[currentIndex].titlestr,
                description: allinonboardlist[currentIndex].description,
                imgurl: allinonboardlist[currentIndex].imgStr,
              );
            },
          ),
          Positioned(
            top: 40,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Color(0xFFF3B502),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Plus Jakarta Sans',
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Container(
              // Main container
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // First empty container (width 25%)
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                  // Second container with Row (dots in the center, width 50%)
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          allinonboardlist.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                    ),
                  ),
                  //Third container with GestureDetector (forward arrow on the right, width 25%)
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    margin: const EdgeInsets.only(left: 10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF3653B0),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          if (currentIndex < allinonboardlist.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: 51,
                          height: 51,
                          child: const Center(
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot({required int index}) {
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: currentIndex == index ? 30.0 : 10.0,
        height: 10.0,
        decoration: BoxDecoration(
          color: currentIndex == index
              ? const Color.fromRGBO(232, 100, 75, 1)
              : const Color.fromRGBO(217, 217, 217, 1),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class PageBuilderWidget extends StatelessWidget {
  String title;
  String description;
  String imgurl;
  PageBuilderWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.imgurl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 100, left: 27, right: 27),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: Image.asset(
              imgurl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              description,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Plus Jakarta Sans Regular',
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AllinOnboardModel {
  String imgStr;
  String description;
  String titlestr;
  AllinOnboardModel(this.imgStr, this.description, this.titlestr);
}
