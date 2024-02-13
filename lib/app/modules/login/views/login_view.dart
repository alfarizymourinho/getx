import 'package:getx_paris/app/helpers/size_helper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 4,
                    margin: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Login Page",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 18),
                            TextFormField(
                              onChanged: controller.onEmailChanged,
                              decoration: InputDecoration(
                                hintText: "Email",
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Input Email';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 18),
                            TextFormField(
                              onChanged: controller.onPasswordChanged,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Password",
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Input Password';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 18),
                            SizedBox(
                              width: displayWidht(context) * 0.8,
                              height: displayHeight(context) * 0.075,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                      side: BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Login",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(height: 18),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Does'nt have an account? ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16.0,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}