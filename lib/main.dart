import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:furniture_aggregator_app/backbone/dependency_injection.dart'
    as di;
import 'package:furniture_aggregator_app/presentation/page/map/page.dart';
import 'package:furniture_aggregator_app/presentation/page/permissions/location_permission_page.dart';
import 'package:furniture_aggregator_app/presentation/theme/app_theme.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<void> main() async {
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }

  di.init();

  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Map View Demo',
      theme: AppTheme.theme,
      home: LocationPermissionPage(
        navigateToWidget: () => MapView(
          nearbyShopsBloc: di.sl.get(),
          geolocationBloc: di.sl.get(),
        ),
      ),
    );
  }
}
