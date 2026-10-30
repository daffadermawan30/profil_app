import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final String userName = 'Daffa Dermawan';
  final String role = 'Mahasiswa Software Engineering';

  final List<String> projects = const [
    'Weather App',
    'Todo App',
    'Profil Flutter',
    'Aplikasi Kasir',
    'Aplikasi Manajemen Data',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const ProfileAvatar(),
            const SizedBox(height: 16),

            ProfileInfo(name: userName, role: role),

            const SizedBox(height: 16),

            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Fitur edit profil belum tersedia.'),
                  ),
                );
              },
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profil'),
            ),

            const SizedBox(height: 24),
            const ProfileStats(),
            const SizedBox(height: 24),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Proyek Saya',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            const Divider(),

            Expanded(
              child: ListView.builder(
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return ExperienceCard(title: projects[index]);
                },
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
      backgroundColor: Colors.blueAccent,
      child: Icon(Icons.person, size: 50, color: Colors.white),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final String name;
  final String role;

  const ProfileInfo({super.key, required this.name, required this.role});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 4),

        Text(role, style: const TextStyle(fontSize: 16, color: Colors.grey)),
      ],
    );
  }
}

class StatItem extends StatelessWidget {
  final String count;
  final String label;

  const StatItem({super.key, required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        StatItem(count: '5', label: 'Projects'),

        StatItem(count: '120', label: 'Followers'),

        StatItem(count: '80', label: 'Following'),
      ],
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String title;

  const ExperienceCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: const Icon(Icons.code, color: Colors.blueAccent),
        title: Text(title),
      ),
    );
  }
}
