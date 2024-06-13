import 'package:alarm/core/routes/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter{
  @override
  List<AutoRoute> get routes=>[
    AutoRoute(page: HomeRoute.page, initial: true),
  ];
}