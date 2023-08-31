import 'package:flutter/material.dart';
import 'package:macarrierepro/custome/custome_appbar.dart';

class ActualiteScreen extends StatefulWidget {
  const ActualiteScreen({super.key});

  @override
  State<ActualiteScreen> createState() => _ActualiteScreenState();
}

class _ActualiteScreenState extends State<ActualiteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustome(
        title: "Actualités",
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
