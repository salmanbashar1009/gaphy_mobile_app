import 'package:gaphy_mobile_app/core/route_config/route_name.dart';
import 'package:gaphy_mobile_app/presentation/features/login/view/feed_screen.dart';
import 'package:gaphy_mobile_app/presentation/features/login/view/login_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoute{
  GoRouter goRouter = GoRouter(
    initialLocation: RouteName.feedScreen,
      routes: [
        GoRoute(
          name: RouteName.feedScreen,
          path: RouteName.feedScreen,
          builder: (context, state) => FeedScreen(),
        ),
        // GoRoute(
        //   name: RouteName.signUpScreen,
        //   path: RouteName.signUpScreen,
        //   builder: (context,state) =>  SignUpScreen(),
        // )
      ]
  );
}