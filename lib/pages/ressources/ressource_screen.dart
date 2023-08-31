import 'package:flutter/material.dart';
import 'package:macarrierepro/custome/custome_appbar.dart';

class RessourceScreen extends StatefulWidget {
  const RessourceScreen({super.key});

  @override
  State<RessourceScreen> createState() => _RessourceScreenState();
}

class _RessourceScreenState extends State<RessourceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustome(
        title: "Ressources",
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
