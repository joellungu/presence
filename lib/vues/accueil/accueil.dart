import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence_agent/vues/accueil/accueilController.dart';

import '../admin/admin.dart';
import '../encours/encours.dart';
import '../historique/historique.dart';
import '../profil/profil.dart';
import '../propos.dart';

class Accueil extends StatelessWidget {
  //
  AccueilController accueilController = Get.find();
  //
  List listeMenu = [
    {
      "libelle": "Feuille de présence",
      "v": "compagne",
      "icon": const Icon(Icons.checklist_outlined)
    },
    {
      "libelle": "Gestionnaire des abscences",
      "v": "historique",
      "icon": const Icon(Icons.history)
    },
    {
      "libelle": "Statistique",
      "v": "profil",
      "icon": const Icon(Icons.assessment_outlined),
    },
    {
      "libelle": "Enregistrement & Suppression Agent",
      "v": "admin",
      "icon": const Icon(Icons.person_add)
    },
    {
      "libelle": "Calendrier",
      "v": "calendrier",
      "icon": const Icon(Icons.event_note_outlined)
    },
    {
      "libelle": "À propos",
      "v": "propos",
      "icon": const Icon(Icons.dashboard_customize)
    },
    {
      "libelle": "Quitter",
      "v": "close",
      "icon": const Icon(Icons.close),
    },
  ];
  //
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        drawer: Drawer(
          elevation: 0,
          child: ListView(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            children: [
              Container(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Container(
                      width: 70,
                      height: 70,
                      child: Image.asset(
                          "assets/Coat_of_arms_of_the_Democratic_Republic_of_the_Congo.png"),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 20),
                      child: const Text.rich(
                        TextSpan(
                          text: "Kin Marche\n",
                          children: [
                            TextSpan(
                              text: "example@gmail.com",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              Column(
                children: List.generate(listeMenu.length, (index) {
                  return ListTile(
                    onTap: () {
                      var v = listeMenu[index]["v"];
                      if (v == "compagne" ||
                          v == "historique" ||
                          v == "profil" ||
                          v == "propos" ||
                          v == "admin") {
                        //
                        accueilController.sVue = listeMenu[index]["v"];
                        Navigator.of(context).pop();
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(""),
                                content: Text(
                                    "Voulez-vous vraiment quitter l'application?"),
                                actions: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.close,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      exit(0);
                                    },
                                    icon: Icon(
                                      Icons.check,
                                    ),
                                  )
                                ],
                              );
                            });
                      }
                    },
                    leading: listeMenu[index]["icon"],
                    title: Text(
                      listeMenu[index]["libelle"],
                    ),
                    //trailing: const Icon(Icons.arrow_forward_ios),
                  );
                }),
              )
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          title: accueilController.gVue.value == "compagne"
              ? const Text("Feuille de présence")
              : accueilController.gVue.value == "historique"
                  ? const Text("Gestionnaire des abscences")
                  : accueilController.gVue.value == "profil"
                      ? const Text("Statistique")
                      : accueilController.gVue.value == "calendrier"
                          ? const Text("Calendrier")
                          : accueilController.gVue.value == "admin"
                              ? const Text("Enregistrement & Suppression Agent")
                              : const Text("À propos"),
        ),
        body: accueilController.gVue.value == "compagne"
            ? EnCours()
            : accueilController.gVue.value == "historique"
                ? Historique()
                : accueilController.gVue.value == "profil"
                    ? Profil()
                    : accueilController.gVue.value == "calendrier"
                        ? Profil()
                        : accueilController.gVue.value == "admin"
                            ? Admin()
                            : Propos(),
      ),
    );
  }
}
