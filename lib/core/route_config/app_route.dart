import 'package:gaphy_mobile_app/core/route_config/route_name.dart';
import 'package:gaphy_mobile_app/presentation/features/login/view/login_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoute{
  GoRouter goRouter = GoRouter(
    initialLocation: RouteName.loginScreen,
      routes: [
        GoRoute(
          name: RouteName.loginScreen,
          path: RouteName.loginScreen,
          builder: (context, state) => LoginScreen(),
        ),
        // GoRoute(
        //   name: RouteName.signUpScreen,
        //   path: RouteName.signUpScreen,
        //   builder: (context,state) =>  SignUpScreen(),
        // )
      ]
  );
}