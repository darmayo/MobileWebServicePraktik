import 'package:flutter/material.dart';
import '../services/user_service.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final UserService _userService = UserService();
  List<Map<String, dynamic>> _users = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  // Memuat daftar pengguna
void _loadUsers() async {
  setState(() => _isLoading = true);
  try {
    final response = await _userService.fetchUsers();

    if (response.isNotEmpty) {
      setState(() {
        _users = response;
        _isLoading = false;
      });
    } else {
      setState(() {
        _users = [];
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Tidak ada data pengguna ditemukan.')),
      );
    }
  } catch (e) {
    setState(() => _isLoading = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Gagal memuat data pengguna: $e')),
    );
  }
}

  // Menghapus pengguna
  void _deleteUser(String userId) async {
    try {
      await _userService.deleteUser(userId);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pengguna berhasil dihapus')),
      );
      _loadUsers(); // Muat ulang data setelah penghapusan
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menghapus pengguna: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Pengguna'),
        backgroundColor: Colors.purple,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _users.isEmpty
              ? Center(child: Text('Tidak ada data pengguna'))
              : ListView.builder(
                  itemCount: _users.length,
                  itemBuilder: (context, index) {
                    final user = _users[index];
                    return ListTile(
                      leading: Icon(Icons.person, color: Colors.purple),
                      title: Text(user['name'] ?? 'Nama tidak tersedia'),
                      subtitle: Text(user['email'] ?? 'Email tidak tersedia'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Hapus Pengguna'),
                              content: Text('Yakin ingin menghapus pengguna ini?'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Batal'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _deleteUser(user['id']);
                                  },
                                  child: Text('Hapus'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
    );
  }
}
