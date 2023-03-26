import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/routes/app_pages.dart';
import 'app/stores/blog_store.dart';
import 'theme/style.dart';

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
        initialRoute: FirebaseAuth.instance.currentUser != null
          ? Routes.HOME : Routes.LOGIN ,
        routes: AppPages.routes,
      ),
    );
  }
}
