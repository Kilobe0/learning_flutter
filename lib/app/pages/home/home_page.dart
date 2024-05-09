import 'package:flutter/material.dart';
import 'package:learning_flutter/app/pages/home/components/custom_switch_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeData().colorScheme.primary,
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: CustomSwitchWidget(),
      ),
    );
  }
}
