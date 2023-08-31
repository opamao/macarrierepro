import 'package:flutter/material.dart';
import 'package:macarrierepro/custome/custome_appbar.dart';

class StageScreen extends StatefulWidget {
  const StageScreen({super.key});

  @override
  State<StageScreen> createState() => _StageScreenState();
}

class _StageScreenState extends State<StageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustome(
        title: "Stages",
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
