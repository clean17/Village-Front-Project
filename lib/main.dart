import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/view/pages/host/host_place_resister_page.dart';
import 'package:village/core/constants/move.dart';
import 'package:village/model/user/user_repository.dart';
import 'package:village/provider/session_provider.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final status = await Geolocator.checkPermission();
  if (status == LocationPermission.denied) {
    await Geolocator.requestPermission();
  }

  SessionUser sessionUser = await UserRepository().fetchJwtVerify();

  runApp(
    ProviderScope(
      overrides: [sessionProvider.overrideWithValue(sessionUser)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // navigatorKey.currentContext; 글로벌키를 이용하면 컨텍스트 어디서든 접근
    SessionUser sessionUser = ref.read(sessionProvider);
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: Move.hostResitserPlacePage,
      routes: getRouters(),
    );
  }
}
