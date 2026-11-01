import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = 'Daffa Dermawan';
  String role = 'Mahasiswa Software Engineering';

  final TextEditingController nameController = TextEditingController();

  final TextEditingController roleController = TextEditingController();

  final List<String> projects = const [
    'Weather App',
    'Todo App',
    'Profile Page Flutter',
    'POS App',
    'CRM App',
  ];

  @override
  void dispose() {
    nameController.dispose();
    roleController.dispose();
    super.dispose();
  }

  void editProfile() {
    nameController.text = userName;
    roleController.text = role;

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E1E1E),
          title: const Text(
            'Edit Profil',
            style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
          ),

          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nama',
                    prefixIcon: Icon(Icons.person, color: Colors.orange),
                  ),
                ),

                const SizedBox(height: 16),

                TextField(
                  controller: roleController,
                  decoration: const InputDecoration(
                    labelText: 'Pekerjaan',
                    prefixIcon: Icon(Icons.work, color: Colors.orange),
                  ),
                ),
              ],
            ),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Batal'),
            ),

            ElevatedButton(
              onPressed: () {
                String newName = nameController.text.trim();

                String newRole = roleController.text.trim();

                if (newName.isEmpty || newRole.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Nama dan pekerjaan tidak boleh kosong.'),
                    ),
                  );
                  return;
                }

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
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const ProfileAvatar(),

            const SizedBox(height: 16),

            ProfileInfo(name: userName, role: role),

            const SizedBox(height: 16),

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
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ),

            const Divider(color: Colors.orange),

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
      backgroundColor: Colors.orange,
      child: Icon(Icons.person, size: 50, color: Colors.black),
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
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
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

class ExperienceCard extends StatelessWidget {
  final String title;

  const ExperienceCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: const Icon(Icons.code, color: Colors.orange),
        title: Text(title),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.orange,
        ),
      ),
    );
  }
}
