import 'package:go_router/go_router.dart';
import 'package:loop/src/routing/global_navigator.dart';
import 'package:loop/src/routing/app_routes.dart';

import 'package:loop/src/ui/auth/login_screen.dart';
import 'package:loop/src/ui/auth/signup_screen.dart';
import 'package:loop/src/ui/auth/forgot_password_screen.dart';

import 'package:loop/src/ui/home/home_page.dart';
import 'package:loop/src/ui/onboarding/onboarding_page.dart';


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
      path: AppRoutes.forgotPassword,
      name: 'forgotPassword',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: AppRoutes.home,
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
