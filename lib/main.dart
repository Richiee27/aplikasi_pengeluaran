import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://qdeyfoaufrhbabnpardd.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFkZXlmb2F1ZnJoYmFibnBhcmRkIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcwNDc4MTUyNCwiZXhwIjoyMDIwMzU3NTI0fQ.8bNTHn94kKRtukJyfpYClCKDTmbOzeqM96KR4G95yME',
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provices Indonesia',
      color: Colors.blueAccent,
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
