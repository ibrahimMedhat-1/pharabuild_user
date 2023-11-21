import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/user/features/home_page/manager/home_page_cubit.dart';
import 'package:intelligent_pharmacy/user/layout/layout.dart';
import 'package:intelligent_pharmacy/user/layout/manager/layout_cubit.dart';
import 'package:permission_handler/permission_handler.dart';

import 'authentication/manager/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.camera.request();
  runApp(DevicePreview(builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
        BlocProvider<LayoutCubit>(create: (context) => LayoutCubit()),
        BlocProvider<HomePageCubit>(create: (context) => HomePageCubit()),
      ],
      child: GestureDetector(
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
          home: const Layout(),
        ),
      ),
    );
  }
}
