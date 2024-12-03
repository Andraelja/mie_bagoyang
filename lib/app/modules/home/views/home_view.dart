import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), _autoSlide);
  }

  void _autoSlide() {
    if (_currentPage < 2) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    } else {
      _pageController.animateToPage(
        0,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
    setState(() {
      _currentPage = (_currentPage + 1) % 3; // Assuming 3 images
    });
    Future.delayed(Duration(seconds: 3), _autoSlide);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Mie Bagoyang'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 205,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [
                    Image.asset(
                      'assets/images/banner1.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/banner2.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/banner3.jpg',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),

            // Best Seller Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Best Seller',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Jl. Raya Payakumbuh - Lintau, Lubuk Jantan...',
                              style: TextStyle(fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Order',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Today's Special - Makanan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Today\'s Special',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman lain
                      Get.toNamed(
                          '/order'); // Ganti '/makanan' dengan rute tujuan Anda
                    },
                    child: const Text(
                      'Makanan',
                      style: TextStyle(
                        color: Colors.blue, // Warna teks
                        fontSize: 14,
                        decoration:
                            TextDecoration.none, // Tambahkan garis bawah
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            _buildSpecialGrid('Makanan'),

            const SizedBox(height: 16),

            // Today's Special - Minuman
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Today\'s Special',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman lain
                      Get.toNamed(
                          '/order_minuman'); // Ganti '/makanan' dengan rute tujuan Anda
                    },
                    child: const Text(
                      'Minuman',
                      style: TextStyle(
                        color: Colors.blue, // Warna teks
                        fontSize: 14,
                        decoration:
                            TextDecoration.none, // Tambahkan garis bawah
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            _buildSpecialGrid('Minuman'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan QR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
      ),
    );
  }

  // Build GridView for Today's Special
  Widget _buildSpecialGrid(String type) {
    List<Map<String, String>> items = (type == 'Makanan')
        ? [
            {
              'name': 'Mie Bagoyang',
              'price': 'Rp. 10.000',
              'image': 'mie_spesial.png'
            },
            {'name': 'Mie Ayam', 'price': 'Rp. 15.000', 'image': 'nasgor.png'},
          ]
        : [
            {
              'name': 'Es Teh Manis',
              'price': 'Rp. 5.000',
              'image': 'teh_telur.png'
            },
            {'name': 'Es Jeruk', 'price': 'Rp. 7.000', 'image': 'es_jeruk.png'},
          ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: items.map((item) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/images/${item['image']}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        item['price']!,
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
