import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uno/uno.dart';

/*void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url:  "https://ykehvmvltwyxjxjxihxx.supabase.co/rest/v1/",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlrZWh2bXZsdHd5eGp4anhpaHh4Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NzU5Nzc3NywiZXhwIjoxOTkzMTczNzc3fQ.C4LaEswhsckx3J9YVBTK44jBqiZ2KAERZTsK9dqiBOk",
  );


  final supabase = Supabase.instance.client;

  var signUp = await supabase.auth.signInWithPassword(
    email: "adrielsilva_1990@hotmail.com",
    password: "password",
    data: {"nome": "Adriel", "idade": 45, "matricula": "2332131154344"},
    phone: "85999999999"
  );

  var session = signUp.session;

  var user = session?.user;

  var id = user?.id;

  print(id);
}
*/