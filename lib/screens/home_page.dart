import 'package:flutter/material.dart';
import 'package:yenibirnefes/models/theme/app_colors.dart';
import 'package:yenibirnefes/service/auth.dart'; 
import 'package:yenibirnefes/screens/splash_page.dart'; 

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Auth _auth = Auth(); 
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      
      appBar: AppBar(
        title: const Text(
          'YENİ BİR NEFES',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w900,
            fontSize: 18,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        backgroundColor:
            Colors.transparent, 
        elevation: 0, 
        actions: [
          
          IconButton(
            icon: const Icon(Icons.logout_rounded, color: AppColors.primary),
            tooltip: 'Çıkış Yap',
            onPressed: () async {
              
              await _auth.signOut();
              if (mounted) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const SplashPage()),
                );
              }
            },
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),

            
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  physics:
                      const BouncingScrollPhysics(), 
                  children: [
                    _buildStackedCard(
                      title: "Sigarasız Geçen Süre",
                      value: "8 Gün 14 Saat",
                      icon: Icons.timer,
                      color: AppColors.primary,
                    ),

                    Transform.translate(
                      offset: const Offset(0, -20),
                      child: _buildStackedCard(
                        title: "Biriken Para",
                        value: "640.00 TL",
                        icon: Icons.account_balance_wallet,
                        color: Colors.blueAccent,
                      ),
                    ),

                    Transform.translate(
                      offset: const Offset(0, -40),
                      child: _buildStackedCard(
                        title: "İçilmeyen Sigara",
                        value: "168 Adet",
                        icon: Icons.smoke_free,
                        color: Colors.orangeAccent,
                      ),
                    ),

                    Transform.translate(
                      offset: const Offset(0, -60),
                      child: _buildStackedCard(
                        title: "Kazanılan Ömür",
                        value: "18 Saat",
                        icon: Icons.favorite,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey.shade400,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: ""),
        ],
      ),
    );
  }

  Widget _buildStackedCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
