// import 'package:flutter/cupertino.dart';
// import 'package:go_router/go_router.dart';
//
//
// import '../../main.dart';
//
// final GoRouter router = GoRouter(
//   navigatorKey: navigatorKey,
//   initialLocation: Routers.complete,
//   routes: [
//     GoRoute(
//       path: Routers.login,
//       builder: (context, state) {
//         return LoginView();
//       },
//     ),
//     GoRoute(
//       path: Routers.signup,
//       builder: (context, state) => SignUpView(),
//     ),
//     GoRoute(
//       path: Routes.complete,
//       builder: (context, state) => CompleteProfileView(),
//     ),
//     GoRoute(
//       path: Routes.onboarding,
//       builder: (context, state) => OnboardingView(
//         vm: OnboardingViewModel(
//           repo: context.read(),
//         ),
//       ),
//     ),
//     GoRoute(
//       path: Routes.welcome,
//       builder: (context, state) => WelcomeView(),
//     ),
//   ],
// );