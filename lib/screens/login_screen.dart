import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housekeeping/controllers/main_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<MainController>();

    return Scaffold(
      backgroundColor: Colors.yellow[700],
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 70),
            Container(
              width: 125,
              height: 125,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
                image: const DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Wellcome to Housekeeping App",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 170),
            Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.link,
                                size: 28,
                              ),
                              const SizedBox(width: 5),
                              SizedBox(
                                width: 270,
                                child: TextField(
                                  cursorColor: Colors.yellow.shade700,
                                  controller: controller
                                      .loginCtr.serverUrlController.value,
                                  onChanged: controller
                                      .loginCtr.onServerUrlInputValueChange,
                                  decoration: const InputDecoration(
                                    hintText: 'Server URL',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.person,
                                size: 28,
                              ),
                              const SizedBox(width: 5),
                              SizedBox(
                                width: 270,
                                child: TextField(
                                  cursorColor: Colors.yellow.shade700,
                                  controller: controller
                                      .loginCtr.usernameController.value,
                                  onChanged: controller
                                      .loginCtr.onUsernameInputValueChange,
                                  decoration: const InputDecoration(
                                    hintText: 'Username',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.key,
                                size: 28,
                                color: Colors.black,
                              ),
                              const SizedBox(width: 5),
                              SizedBox(
                                width: 270,
                                child: TextField(
                                    cursorColor: Colors.yellow.shade700,
                                    controller: controller
                                        .loginCtr.passwordController.value,
                                    onChanged: controller
                                        .loginCtr.onPasswordInputValueChange,
                                    decoration: const InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                      border: InputBorder.none,
                                    ),
                                    obscureText: true),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 35),
                      SizedBox(
                        width: 350,
                        height: 50,
                        child: SizedBox(
                          width: 350,
                          height: 50,
                          child: Obx(
                            () => FloatingActionButton(
                              backgroundColor: Colors.black,
                              onPressed: () {
                                controller.loginCtr.onWaiting();
                                controller.loginCtr.onLoginPressed();
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: controller.loginCtr.isLoading.value
                                  ? const CircularProgressIndicator()
                                  : const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Login",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
