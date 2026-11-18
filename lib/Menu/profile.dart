import 'package:flutter/material.dart';

const String kNama = 'Jauza';
const String kKelas = 'XI PPLG 1 / No. Absen 15';
const String kBio = 
    'Siswi PPLG ';

const Color kOrange = Color(0xFFE8590C);

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 56),
            decoration: const BoxDecoration(
              color: kOrange,
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(32)),
            ),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 56,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 52,
                    backgroundColor: Color(0xFFFFE0CC),
                    // ganti dengan foto: backgroundImage: AssetImage('assets/profile.png')
                    child: Icon(Icons.person, size: 64, color: kOrange),
                  ),
                ),
                SizedBox(height: 14),
                Text(kNama,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -32),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _InfoCard(
                      icon: Icons.school_outlined,
                      title: 'Kelas / No. Absen',
                      value: kKelas),
                  SizedBox(height: 12),
                  _InfoCard(
                      icon: Icons.info_outline,
                      title: 'Bio Singkat',
                      value: kBio),
                  SizedBox(height: 12),
                  _InfoCard(
                      icon: Icons.code,
                      title: 'Konsentrasi',
                      value: 'Pengembangan Perangkat Lunak dan Gim (PPLG)'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoCard(
      {required this.icon, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFFFFE0CC),
              child: Icon(icon, color: kOrange),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 13)),
                  const SizedBox(height: 4),
                  Text(value,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}