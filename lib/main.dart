import 'dart:async';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projector/private/key.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
    debug: kDebugMode,
  );
  await runZonedGuarded(
    () async {
      runApp(
        const ProviderScope(child: MyApp()),
      );

      doWhenWindowReady(() async {
        final win = appWindow;
        const initialSize = Size(600, 450);
        win
          ..minSize = const Size(100, 100)
          ..size = initialSize
          ..show();
        await WindowManager.instance.setAlwaysOnTop(kDebugMode);
      });
    },
    (error, stack) {},
  );
}

const borderColor = Color.fromARGB(255, 187, 224, 255);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
        colorSchemeSeed: const Color.fromARGB(255, 0, 94, 255),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WindowBorder(
          color: borderColor,
          width: 0,
          child: const MainWidget(),
        ),
      ),
    );
  }
}

const backgroundStartColor = Color.fromARGB(255, 159, 166, 255);
const backgroundEndColor = Color.fromARGB(255, 187, 224, 255);

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [backgroundStartColor, backgroundEndColor],
            stops: [0.0, 1.0],
          ),
        ),
        child: Column(
          children: [
            WindowTitleBarBox(
              child: Row(
                children: [
                  Expanded(
                    child: MoveWindow(),
                  ),
                  const WindowButtons(),
                ],
              ),
            ),
            // 本体部分
            // const RootPage(),
          ],
        ),
      ),
    );
  }
}

final buttonColors = WindowButtonColors(
  iconNormal: const Color.fromARGB(0, 159, 166, 255),
  mouseOver: const Color.fromARGB(178, 0, 58, 194),
  mouseDown: const Color.fromARGB(255, 255, 255, 255),
  iconMouseOver: const Color.fromARGB(255, 0, 0, 0),
  iconMouseDown: const Color.fromARGB(255, 0, 0, 0),
);

class WindowButtons extends StatelessWidget {
  const WindowButtons({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: buttonColors),
      ],
    );
  }
}
