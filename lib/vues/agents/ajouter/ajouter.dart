import 'package:flutter/material.dart';
import 'package:presence_agent/vues/agents/ajouter/enregistrement_etudiant.dart';

import 'enregistrement_agent.dart';

class Ajouter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Ajouter();
  }
}

class _Ajouter extends State<Ajouter> with TickerProviderStateMixin {
  TabController? controller;
  List angles = ["Agents", "Etudiant"];

  @override
  void initState() {
    //
    controller = TabController(length: 2, vsync: this);
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          //color: Colors.blue,
          alignment: Alignment.center,
          child: TabBar(
            isScrollable: true,
            controller: controller,
            indicatorWeight: 1,
            //indicator: BoxDecoration(),
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
            tabs: List.generate(angles.length, (index) {
              return Tab(
                text: angles[index],
              );
            }),
          ),
        ),
        Expanded(
          flex: 1,
          child: TabBarView(
            controller: controller,
            children: [
              EnregistrementAgent(),
              EnregistrementEtudiant(),
            ],
          ),
        )
      ],
    );
  }
}
