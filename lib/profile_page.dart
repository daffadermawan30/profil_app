import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final String userName = 'Daffa Dermawan';
  final String role = 'Mahasiswa Software Engineering';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const ProfileAvatar(),
            const SizedBox(height: 16),

            ProfileInfo(userName: userName, role: role),

            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text(
                        '3',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text('Proyek'),
                    ],
                  ),

                  Column(
                    children: [
                      const Text(
                        '12',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text('Followers'),
                    ],
                  ),

                  Column(
                    children: [
                      const Text(
                        '8',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text('Following'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 50,
      backgroundColor: Colors.grey,
      child: Icon(Icons.person, size: 50, color: Colors.white),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final String userName;
  final String role;

  const ProfileInfo({super.key, required this.userName, required this.role});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          userName,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          role,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
        ),
      ],
    );
  }
}
