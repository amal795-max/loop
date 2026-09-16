import 'package:go_router/go_router.dart';
import 'package:loop/src/routing/global_navigator.dart';
import 'package:loop/src/routing/app_routes.dart';
import 'package:loop/src/features/auth/login_screen.dart';
import 'package:loop/src/features/auth/signup_screen.dart';
import 'package:loop/src/features/home/home_page.dart';
import 'package:loop/src/features/onboarding/onboarding_page.dart';


final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.onboarding,
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.onboarding,
      name: 'onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: AppRoutes.login,
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.signup,
      name: 'signup',
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: AppRoutes.home,
      name: '/',
      builder: (context, state) => const HomeLayout(),
    ),
  ],
);
