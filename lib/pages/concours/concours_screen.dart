import 'package:flutter/material.dart';
import 'package:macarrierepro/custome/custome_appbar.dart';

class ConcoursScreen extends StatefulWidget {
  const ConcoursScreen({super.key});

  @override
  State<ConcoursScreen> createState() => _ConcoursScreenState();
}

class _ConcoursScreenState extends State<ConcoursScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustome(
        title: "Concours",
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
