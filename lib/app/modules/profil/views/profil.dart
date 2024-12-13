import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AccountPage(),
    );
  }
}

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(width: 8),
            Text(
              'Hi Indah, !',
              style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Bagian Akun Saya
            Text(
              'Akun Saya',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange),
            ),
            Divider(),
            // Menu Metode Pembayaran
            _buildMenuItem('Metode Pembayaran', Icons.payment, context),
            _buildMenuItem('Alamat Tersimpan', Icons.home, context),
            _buildMenuItem('Kontak Darurat', Icons.contact_phone, context),
            _buildMenuItem('Pusat Bisnis', Icons.business, context),
            SizedBox(height: 20),
            // Bagian Umum
            Text(
              'Umum',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange),
            ),
            Divider(),
            // Menu Umum
            _buildMenuItem('Pusat Bantuan', Icons.help, context),
            _buildMenuItem('Bahasa', Icons.language, context),
            _buildMenuItem('Pengaturan', Icons.settings, context),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat menu item
  Widget _buildMenuItem(String title, IconData icon, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Tindakan saat item dipilih
        print('Tapped on $title');
      },
    );
  }
}
