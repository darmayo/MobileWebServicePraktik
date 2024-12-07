import 'package:supabase_flutter/supabase_flutter.dart';

class UserService {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<Map<String, dynamic>?> getUserDetails(String userId) async {
    final response = await supabase.from('users').select('name, email, phone').eq('user_id', userId).maybeSingle();
    return response;
  }
}
