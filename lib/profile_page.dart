import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Data profil
  String userName = 'Daffa Dermawan';
  String role = 'Mahasiswa Software Engineering';

  // Controller untuk input edit profil
  final TextEditingController nameController = TextEditingController();

  final TextEditingController roleController = TextEditingController();

  // Data proyek
  final List<String> projects = const [
    'Weather App',
    'Todo App',
    'Profil Flutter',
    'POS App',
    'CRM',
  ];

  @override
  void dispose() {
    nameController.dispose();
    roleController.dispose();
    super.dispose();
  }

  // Fungsi untuk menampilkan dialog edit profil
  void editProfile() {
    // Mengisi input dengan data profil saat ini
    nameController.text = userName;
    roleController.text = role;

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Edit Profil'),

          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nama',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),

                const SizedBox(height: 16),

                TextField(
                  controller: roleController,
                  decoration: const InputDecoration(
                    labelText: 'Pekerjaan',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.work),
                  ),
                ),
              ],
            ),
          ),

          actions: [
            // Tombol batal
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Batal'),
            ),

            // Tombol simpan
            ElevatedButton(
              onPressed: () {
                String newName = nameController.text.trim();
                String newRole = roleController.text.trim();

                // Memastikan input tidak kosong
                if (newName.isEmpty || newRole.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Nama dan pekerjaan tidak boleh kosong.'),
                    ),
                  );
                  return;
                }

                // Memperbarui data profil
                setState(() {
                  userName = newName;
                  role = newRole;
                });

                Navigator.pop(dialogContext);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profil berhasil diperbarui!')),
                );
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

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

            // Tombol Edit Profil
            ElevatedButton.icon(
              onPressed: editProfile,
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

// Widget Avatar Profil
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

// Widget Informasi Profil
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

// Widget Satu Item Statistik
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

// Widget Statistik Profil
class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StatItem(count: '5', label: 'Projects'),

        StatItem(count: '120', label: 'Followers'),

        StatItem(count: '80', label: 'Following'),
      ],
    );
  }
}

// Widget Item Proyek
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
