///
/// This file is part of library navigation2demo
/// All imports must go to the main file (navigation2demo.dart)
/// otherwise we get a compilation error
///

part of 'navigation2demo.dart';

class Navigation2Demo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Navigation2DemoState();
}

class _Navigation2DemoState extends State<Navigation2Demo> {
  TheAppRouterDelegate _routerDelegate = TheAppRouterDelegate();
  TheAppRouteInformationParser _routeInformationParser =
      TheAppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return ProviderScope(child: Consumer(builder: (context, watch, child) {
      final appTheme = watch(appThemeProvider);
      return MaterialApp.router(
        theme: appTheme.getTheme(),
        darkTheme: AppDynamicTheme.darkTheme,
        themeMode: AppDynamicTheme.isDark ? ThemeMode.dark : ThemeMode.light,
        title: 'Navigator 2.0 Demo',
        debugShowCheckedModeBanner: false,
        routerDelegate: _routerDelegate,
        routeInformationParser: _routeInformationParser,
      );
    }));
  }
}
