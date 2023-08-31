import 'package:flutter/material.dart';
import 'package:macarrierepro/custome/custome_appbar.dart';

class BourseScreen extends StatefulWidget {
  const BourseScreen({super.key});

  @override
  State<BourseScreen> createState() => _BourseScreenState();
}

class _BourseScreenState extends State<BourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustome(
        title: "Bourse d'étude",
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
