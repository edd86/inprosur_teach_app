import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inprosur_teach_app/core/constants/app_routes.dart';
import 'package:inprosur_teach_app/core/constants/app_theme.dart';
import 'package:inprosur_teach_app/firebase_options.dart';
import 'package:inprosur_teach_app/presentation/providers/theme_provider.dart';
import 'package:inprosur_teach_app/presentation/widgets/loading_overlay.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: '.env');
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider);

    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme().light(context),
          darkTheme: AppTheme().dark(context),
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          builder: (context, child) {
            return LoadingOverlay(child: child ?? const SizedBox.shrink());
          },
          routes: AppRoutes.routes,
          initialRoute: AppRoutes.homePage,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        );
      },
    );
  }
}
