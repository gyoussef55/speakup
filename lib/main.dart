import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speakup/core/constants/app_strings.dart';
import 'package:speakup/core/utils/floating_snack_bar.dart';
import 'package:speakup/features/home/presentation/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/constants/styles.dart';
import 'features/saved_files/presentation/screens/saved_files.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: FloatingSnackBar.scaffoldKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: Styles.colorScheme,
      ).copyWith(
          sliderTheme: const SliderThemeData().copyWith(
        showValueIndicator: ShowValueIndicator.always,
      )),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              AppStrings.appName,
              style: TextStyle(
                  color: const Color.fromRGBO(7, 9, 18, 1),
                  fontWeight: FontWeight.bold,
                  fontSize:
                      Theme.of(context).textTheme.headlineMedium!.fontSize),
            ),
            automaticallyImplyLeading: false,
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: AppStrings.homeTab,
                ),
                Tab(
                  icon: Icon(Icons.folder_copy),
                  text: AppStrings.savedFilesTab,
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              HomeScreen(),
              SavedFiles(),
            ],
          ),
        ),
      ),
    );
  }
}
