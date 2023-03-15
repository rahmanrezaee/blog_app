import 'package:bloc_app/app/routes/app_pages.dart';
import 'package:bloc_app/app/stores/blog_store.dart';
import 'package:bloc_app/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<BlogStore>(create: (_) => BlogStore()),
      ],
      child: MaterialApp(
        title: 'Blog App',
        theme: blogTheme(context),
        routes: AppPages.routes,
      ),
    );
  }
}
