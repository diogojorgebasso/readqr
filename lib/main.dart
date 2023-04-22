import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:readqr/providers/account.dart';
import 'package:readqr/providers/tickets.dart';
import 'package:readqr/screens/navigation.dart';
import 'package:readqr/screens/onboarding.dart';

Future<void> main async {
    
WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AccountProvider()),
        ChangeNotifierProvider(create: (context) => EntryProvider()),
      ],
      child: const Main(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          future: context.read<AccountProvider>().isValid(),
          builder: (context, snapshot) =>
              context.watch<AccountProvider>().session == null
                  ? const OnboardingScreen()
                  : const NavScreen(),
        ));
  }
}
