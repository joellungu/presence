import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence_agent/vues/login/logincontroller.dart';

import 'accueil/accueil.dart';
import 'accueil/accueilController.dart';
import 'login/login.dart';

class Principal extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());
  AccueilController accueilController = Get.put(AccueilController());
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => loginController.loager.value ? Accueil() : Login(),
      ),
    );
  }
}
