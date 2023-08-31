import 'package:flutter/material.dart';
import 'package:macarrierepro/pages/actualites/actualite_screen.dart';
import 'package:macarrierepro/pages/bourses/bourse_screen.dart';
import 'package:macarrierepro/pages/concours/concours_screen.dart';
import 'package:macarrierepro/pages/emploi/emploi_screen.dart';
import 'package:macarrierepro/pages/ressources/ressource_screen.dart';
import 'package:macarrierepro/pages/stages/stage_screen.dart';

class Menus extends StatefulWidget {
  const Menus({super.key});

  @override
  State<Menus> createState() => _MenusState();
}

class _MenusState extends State<Menus> {
  int currentPageIndex = 0;

  final Widget _emploi = const EmploiScreen();
  final Widget _concours = const ConcoursScreen();
  final Widget _stage = const StageScreen();
  final Widget _bourse = const BourseScreen();
  final Widget _actualite = const ActualiteScreen();
  final Widget _ressource = const RessourceScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.work_outlined),
            icon: Icon(Icons.work_outline_outlined),
            label: 'Emploi',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.description_outlined),
            icon: Icon(Icons.edit_note_outlined),
            label: 'Concours',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.badge_outlined),
            icon: Icon(Icons.work_outline_outlined),
            label: 'Stages',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.travel_explore_outlined),
            icon: Icon(Icons.public_outlined),
            label: 'Bourse etude',
          ),
          NavigationDestination(
            icon: Icon(Icons.newspaper_outlined),
            label: 'Actualités',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.request_quote_outlined),
            icon: Icon(Icons.sell_outlined),
            label: 'Ressources',
          ),
        ],
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (currentPageIndex == 0) {
      return _emploi;
    } else if (currentPageIndex == 1) {
      return _concours;
    } else if (currentPageIndex == 2) {
      return _stage;
    } else if (currentPageIndex == 3) {
      return _bourse;
    } else if (currentPageIndex == 4) {
      return _actualite;
    } else {
      return _ressource;
    }
  }
}
