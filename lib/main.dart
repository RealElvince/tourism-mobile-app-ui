import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:tourismapp/components/city_names.dart';
import 'package:tourismapp/constants/constants.dart';
import 'package:tourismapp/screens/welcome_screen.dart';

void main() => runApp(const MyTourismApp());

class MyTourismApp extends StatefulWidget {
  const MyTourismApp({super.key});

  @override
  State<MyTourismApp> createState() => _MyTourismAppState();
}

class _MyTourismAppState extends State<MyTourismApp> {
  // Display config
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CityNames(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tourism App',
        theme: ThemeData(
          scaffoldBackgroundColor: kScaffoldBgColor,
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}
