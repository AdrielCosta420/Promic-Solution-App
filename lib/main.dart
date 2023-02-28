import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:promic_app/src/app/app_module.dart';
import 'package:promic_app/src/app_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url:  "https://ykehvmvltwyxjxjxihxx.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlrZWh2bXZsdHd5eGp4anhpaHh4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2Nzc1OTc3NzcsImV4cCI6MTk5MzE3Mzc3N30._2LWylYB1WKHYF4HLYc0P5QRA1Ls_UTVqO-_-d3IXIg",
  );

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
