import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Color.fromARGB(255, 224, 224, 224)],
          ),
        ),
        child: Center(
          child: GridView.count(
            crossAxisCount: 2, // 2 items per row
            children: <Widget>[
              DashboardItem(icon: Icons.home, label: 'Home'),
              DashboardItem(icon: Icons.settings, label: 'Settings'),
              DashboardItem(
                icon: Icons.person,
                label: 'Profile',
                onTap: () {
                  // Ketika ikon "Profile" diklik, navigasikan ke tampilan profil dengan data
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ));
                },
              ),
              // Tambahkan item dashboard lainnya di sini
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  DashboardItem({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 64.0,
                color: Colors.blue,
              ),
              SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      backgroundColor: Color.fromARGB(255, 54, 99, 118),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/ara.png'),
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0, // Ubah lebar tepian sesuai kebutuhan
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: EdgeInsets.all(8.0), // Sesuaikan padding sesuai kebutuhan
                  child: Text(
                    'Nama : ZAHRA ANGGRAENI CATTALYA PUTRI FAHRUL',
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'NPM : 21670039',
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Kelas : 5A AMP',
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}