import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_2/2_application/core/page_config.dart';

class DasboardPage extends StatelessWidget {
  const DasboardPage({super.key});

  static const pageConfig = PageConfig(
    icon: Icons.dashboard_rounded,
    name: 'dashboard',
    child: DasboardPage(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.purpleAccent);
  }
}
