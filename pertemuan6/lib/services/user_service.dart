import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://owlegltfdnlmphpkgrxj.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im93bGVnbHRmZG5sbXBocGtncnhqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjk4NjY0NTUsImV4cCI6MjA0NTQ0MjQ1NX0.pv9z34zDYse02LdNCcDgYfJoAAPoM8BiS6eF6yyVM04',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EditProfileScreen(
        userData: {
          'id': '1',
          'name': 'John Doe',
          'email': 'john.doe@example.com',
          'phone': '08123456789',
        },
      ),
    );
  }
}

class UserService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> fetchUsers() async {
    try {
      final response = await _supabase.from('users').select('id, name, email, phone');

      if (response == null || response.isEmpty) {
        print('Tidak ada pengguna ditemukan.');
        return [];
      }

      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      print('Error fetching users: $e');
      throw Exception('Gagal mengambil data pengguna.');
    }
  }

  Future<void> updateUser(String id, Map<String, dynamic> updatedData) async {
    try {
      await _supabase.from('users').update(updatedData).eq('id', id);
      print('User dengan ID $id berhasil diperbarui');
    } catch (e) {
      print('Error: $e');
      throw Exception('Gagal memperbarui data pengguna: $e');
    }
  }

  Future<void> deleteUser(String id) async {
    try {
      await _supabase.from('users').delete().eq('id', id);
      print('User dengan ID $id berhasil dihapus');
    } catch (e) {
      print('Error: $e');
      throw Exception('Gagal menghapus pengguna: $e');
    }
  }
}

class EditProfileScreen extends StatefulWidget {
  final Map<String, dynamic> userData;

  const EditProfileScreen({required this.userData, Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final UserService _userService = UserService();
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.userData['name']);
    _emailController = TextEditingController(text: widget.userData['email']);
    _phoneController = TextEditingController(text: widget.userData['phone']);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      try {
        final updatedData = {
          'name': _nameController.text,
          'email': _emailController.text,
          'phone': _phoneController.text,
        };
        await _userService.updateUser(widget.userData['id'], updatedData);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profil berhasil diperbarui')),
        );
        Navigator.pop(context, updatedData);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal memperbarui profil: $e')),
        );
      }
    }
  }

  Future<void> _deleteAccount() async {
    final bool confirm = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Hapus Akun'),
          content: const Text('Apakah Anda yakin ingin menghapus akun ini?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );
    if (confirm) {
      try {
        await _userService.deleteUser(widget.userData['id']);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Akun berhasil dihapus')),
        );
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal menghapus akun: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nama'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Nama tidak boleh kosong' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                readOnly: true,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'No. Telepon'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Nomor telepon tidak boleh kosong' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProfile,
                child: const Text('Simpan Perubahan'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
                  );
                },
                child: const Text('Ganti Password'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _deleteAccount,
                child: const Text('Hapus Akun'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  void _changePassword() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password berhasil diubah')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ganti Password'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _oldPasswordController,
                decoration: const InputDecoration(labelText: 'Password Lama'),
                obscureText: true,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Masukkan password lama' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _newPasswordController,
                decoration: const InputDecoration(labelText: 'Password Baru'),
                obscureText: true,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Masukkan password baru' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _changePassword,
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}