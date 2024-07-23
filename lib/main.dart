import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/Providers/bottom_navProvider.dart';
import 'package:platform_converter_app/Providers/callDataProvider.dart';
import 'package:platform_converter_app/Providers/chatDataProvider.dart';
import 'package:platform_converter_app/Providers/contactProvider.dart';
import 'package:platform_converter_app/Providers/imageProvider.dart';
import 'package:platform_converter_app/Providers/platformProvider.dart';
import 'package:platform_converter_app/Providers/stepperProvider.dart';
import 'package:platform_converter_app/views/Android_views/Componants/settings.dart';
import 'package:platform_converter_app/views/Android_views/homepage/Screens/detailPage.dart';
import 'package:platform_converter_app/views/Android_views/homepage/Screens/homepage.dart';
import 'package:platform_converter_app/views/IOS_views/homePage.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    myApp(),
  );
}

class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PlatformProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavigationProvider()),
        ChangeNotifierProvider(create: (context) => ChatDataProvider()),
        ChangeNotifierProvider(create: (context) => StepperProvider()),
        ChangeNotifierProvider(create: (context) => ContactProvider()),
        ChangeNotifierProvider(create: (context) => imageProvider()),
        ChangeNotifierProvider(create: (context) => CallDataProvider()),
      ],
      builder: (context, _) {
        return (Provider.of<PlatformProvider>(context).isIOS)
            ? CupertinoApp(
                debugShowCheckedModeBanner: false,
                routes: {
                  '/': (context) => HomepageIos(),
                },
              )
            : MaterialApp(
                debugShowCheckedModeBanner: false,
                routes: {
                  '/': (context) => HomePage(),
                  'detailPage': (context) => const ChatDetailPage(
                        chatIndex: 1,
                      ),
                  'settings': (context) => settings(),
                },
              );
      },
    );
  }
}
