// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:alarma/features/add_alarm/presentation/add_alarm_screen.dart'
    as _i1;
import 'package:alarma/features/home/presentation/home_screen.dart' as _i2;
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    AddAlarmRoute.name: (routeData) {
      final args = routeData.argsAs<AddAlarmRouteArgs>(
          orElse: () => const AddAlarmRouteArgs());
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddAlarmScreen(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddAlarmScreen]
class AddAlarmRoute extends _i3.PageRouteInfo<AddAlarmRouteArgs> {
  AddAlarmRoute({
    _i4.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          AddAlarmRoute.name,
          args: AddAlarmRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddAlarmRoute';

  static const _i3.PageInfo<AddAlarmRouteArgs> page =
      _i3.PageInfo<AddAlarmRouteArgs>(name);
}

class AddAlarmRouteArgs {
  const AddAlarmRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'AddAlarmRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
