import 'package:flutter/material.dart';
import 'package:axolotl/application/layouts/main_layout.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainLayout(child: Text("dashboard"));
  }
}
