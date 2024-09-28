import 'package:flutter/material.dart';

import 'src/core/router/router.dart';
import 'src/core/screenUtils/size_utils.dart';
import 'src/core/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/shared/presentation/viewModel/theme_view_model.dart';

void main() {
  runApp(const ProviderScope(
      child: MyApp()));
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkMode = ref.watch(darkModeProvider);
    return Sizer(
        builder: (context, orientation, deviceType) => GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: appTheme, // Setting light theme
                darkTheme: darkAppTheme, // Setting dark theme
                navigatorKey: navigatorKey,
                title: 'App Name',
                themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
                initialRoute: RoutersName.hotelDetailPage,
                onGenerateRoute: GenerateRouter.generateRoute,
              ),
            ));
  }
}
