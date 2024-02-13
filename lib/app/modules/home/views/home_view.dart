import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  Get.toNamed("/counter");
                },
                child: const Card(
                  color: Colors.amber,
                  margin: EdgeInsets.all(16),
                  child: Center(
                    child: Text("Counter Page"),
                  ),
                )),
            GestureDetector(
                onTap: () {
                  Get.toNamed("/login");
                },
                child: const Card(
                  color: Colors.amber,
                  margin: EdgeInsets.all(16),
                  child: Center(
                    child: Text("Login Page"),
                  ),
                )),
                 GestureDetector(
                onTap: () {
                  Get.toNamed("/register");
                },
                child: const Card(
                  color: Colors.amber,
                  margin: EdgeInsets.all(16),
                  child: Center(
                    child: Text("Register Page"),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
