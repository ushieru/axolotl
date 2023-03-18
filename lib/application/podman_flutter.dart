import 'package:flutter/material.dart';
import 'package:axolotl/application/configs/router_config.dart' as rc;
import 'package:axolotl/application/screens/dashboard/dashboard_screen.dart';
import 'package:axolotl/application/screens/images/images_screen.dart';
import 'package:axolotl/application/screens/loading/loading_screen.dart';

class PodmanFlutter extends StatelessWidget {
  const PodmanFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routerConfig: rc.RouterConfig()
          .add(const LoadingScreen())
          .add(const DashboardScreen())
          .add(const ImagesScreen())
          .buildRouter(),
    );
  }
}
