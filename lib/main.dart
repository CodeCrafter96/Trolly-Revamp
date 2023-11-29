import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trolly_revamp/presentation/bloc/tab_switch/tab_switch_bloc.dart';
import 'package:trolly_revamp/presentation/pages/home_screen.dart';
import 'package:trolly_revamp/presentation/pages/login_screen.dart';
import 'package:trolly_revamp/presentation/pages/product_details.dart';
import 'package:trolly_revamp/presentation/pages/product_screen.dart';
import 'package:trolly_revamp/presentation/pages/profile_screen.dart';
import 'package:trolly_revamp/presentation/pages/register_screen.dart';

void main() {
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => MyApp(),
    // ),
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TabSwitchBloc>(
            create: (BuildContext context) => TabSwitchBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
              primary: Color.fromARGB(235, 255, 255, 255),
              background: Color.fromARGB(250, 255, 255, 255)),
          useMaterial3: true,
        ),
        home: ProductScreen(),
      ),
    );
  }
}
