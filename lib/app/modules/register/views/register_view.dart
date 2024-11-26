import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 244, 124, 44), // Latar belakang utama
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Padding untuk isi form
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Semua elemen dimulai dari atas
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Jarak dari atas layar
            const SizedBox(height: 80),

            // Teks judul
            const Text(
              'Ayo Daftar Dulu!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Warna teks
              ),
            ),

            // Jarak antara teks judul dan form input
            const SizedBox(height: 40),

            // Form input username
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                filled: true,
                fillColor: Colors.grey[300], // Warna latar belakang input
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // Sudut melengkung
                ),
              ),
            ),

            // Jarak antar form input
            const SizedBox(height: 15),

            // Form input password
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              obscureText: true, // Untuk menyembunyikan input password
            ),

            // Jarak antar form input
            const SizedBox(height: 15),

            // Form input email
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            // Jarak antara form terakhir dan tombol daftar
            const SizedBox(height: 30),

            // Tombol daftar
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  // Logika untuk pendaftaran
                  Get.snackbar('Daftar', 'Berhasil mendaftar!');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Warna tombol
                  foregroundColor: Colors.black, // Warna teks tombol
                  padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 50), // Tambah padding horizontal
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'DAFTAR',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
