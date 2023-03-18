import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:axolotl/application/configs/router_config.dart' as rc;
import 'package:axolotl/application/screens/dashboard/dashboard_screen.dart';
import 'package:axolotl/packages/podman_api/podman_api_singleton.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  void init(BuildContext context) {
    PodmanApiSingleton.getInstance(
        socketConnection: '/var/run/user/1000/podman/podman.sock');
    if (!context.mounted) return;
    context.go(rc.RouterConfig.buildRouteName(DashboardScreen));
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () => init(context));
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
