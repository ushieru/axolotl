import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:axolotl/application/configs/router_config.dart' as rc;
import 'package:axolotl/application/screens/dashboard/dashboard_screen.dart';
import 'package:axolotl/application/screens/images/images_screen.dart';
import 'package:axolotl/application/widgets/main_layout_button.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(children: [
      Container(
          width: 250,
          color: Colors.black,
          child: Column(children: [
            MainLayoutButton(
                title: 'Dashboard',
                icon: Icons.dashboard,
                onPressed: () {
                  context.go(rc.RouterConfig.buildRouteName(DashboardScreen));
                }),
            MainLayoutButton(
                title: 'Images',
                icon: Icons.layers,
                onPressed: () {
                  context.go(rc.RouterConfig.buildRouteName(ImagesScreen));
                }),
            MainLayoutButton(
                title: 'Containers', icon: Icons.widgets, onPressed: () {}),
            MainLayoutButton(
                title: 'Volumes', icon: Icons.storage, onPressed: () {}),
          ])),
      Expanded(child: child)
    ]));
  }
}
