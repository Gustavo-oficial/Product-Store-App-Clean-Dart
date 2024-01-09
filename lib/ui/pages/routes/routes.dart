import 'package:go_router/go_router.dart';
import '../home/home_page.dart';
import '../product/product_page.dart';

class Routes {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/home',
    redirect: (_, state) {
      return null;
    },
    routes: [
      GoRoute(
        path: '/home',
        builder: (_, state) => const HomePage(),
      ),
      GoRoute(
        path: '/product/:id',
        builder: (_, state) => ProductPage(id: state.pathParameters["id"]!),
      )
    ],
  );
}
