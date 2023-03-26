
import '../screens/blog_detail_screen.dart';
import '../screens/blog_form_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();


  static final routes = {
    _Paths.HOME: (context) => HomeScreen(),
    _Paths.BLOG_DETAIL_SCREEN: (context) => BlogDetailScreen(),
    _Paths.BLOG_FORM: (context) => BlogFormScreen(),
    _Paths.LOGIN: (context) => LoginScreen(),
  };
}
