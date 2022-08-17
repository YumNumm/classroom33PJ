import 'package:projector/model/pj_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StateApi {
  StateApi(this.sb);
  final SupabaseClient sb;

  Future<State> getState(String id) async {
    final res = await sb.from('state').select().eq('id', id).single().execute();
    if (res.hasError) {
      throw Exception(res.error!.toJson());
    }
    if (res.data == null) {
      throw Exception('Data was null');
    }
    return State.fromJson(res.data as Map<String, dynamic>);
  }
}

class SupabaseApi {
  final sb = Supabase.instance.client;
}
