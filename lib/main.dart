import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/authentication/view/login_page.dart';
import 'package:intelligent_pharmacy/firebase_options.dart';
import 'package:intelligent_pharmacy/shared/network/cache_keys.dart';
import 'package:intelligent_pharmacy/shared/network/cached_preference.dart';
import 'package:intelligent_pharmacy/shared/utils/constants.dart';
import 'package:intelligent_pharmacy/user/layout/layout.dart';

import 'models/user_model.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    CacheHelper.init(),
  ]);
  if ((await CacheHelper.getData(key: CacheKeys.userId)) != null) {
    print(await CacheHelper.getData(key: CacheKeys.userId));
    Constants.userModel = UserModel.fromJson(jsonDecode(await CacheHelper.getData(key: CacheKeys.userId)));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: MaterialApp(
        title: 'Pharmacy App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.black87,
            ),
          ),
          textTheme: TextTheme(
            titleLarge: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * 0.05,
            ),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
        themeMode: ThemeMode.light,
        // home: const LoginPage(),
        home: Constants.userModel != null ? const Layout() : const LoginPage(),
      ),
    );
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint('onClose -- ${bloc.runtimeType}');
  }
}
