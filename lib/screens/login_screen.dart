import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housekeeping/controllers/main_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<MainController>();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 70),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://cdn.dribbble.com/users/11797/screenshots/6587778/raphael-marino-housekeeper-logo-final.png?resize=400x300&vertical=center', // Replace with your image URL
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "Wellcome to Housekeeping App",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 370,
                          child: TextField(
                            controller:
                                controller.loginCtr.serverUrlController.value,
                            onChanged:
                                controller.loginCtr.onServerUrlInputValueChange,
                            cursorColor: Colors.blue,
                            obscureText: false,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              fillColor: Colors.grey[200],
                              filled: true,
                              hintText: 'Server URL',
                              prefixIcon: const Icon(Icons.link),
                              hintStyle: TextStyle(color: Colors.grey[500]),
                            ),
                            maxLines: 1,
                          ),
                        ),
                        const SizedBox(height: 25),
                        SizedBox(
                          width: 370,
                          child: TextField(
                            controller:
                                controller.loginCtr.usernameController.value,
                            onChanged:
                                controller.loginCtr.onUsernameInputValueChange,
                            cursorColor: Colors.blue,
                            obscureText: false,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              fillColor: Colors.grey[200],
                              filled: true,
                              hintText: 'Username',
                              prefixIcon:
                                  const Icon(Icons.account_circle_rounded),
                              hintStyle: TextStyle(color: Colors.grey[500]),
                            ),
                            maxLines: 1,
                          ),
                        ),
                        const SizedBox(height: 25),
                        SizedBox(
                          width: 370,
                          child: TextField(
                            controller:
                                controller.loginCtr.passwordController.value,
                            onChanged:
                                controller.loginCtr.onPasswordInputValueChange,
                            obscureText: true,
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              fillColor: Colors.grey[200],
                              filled: true,
                              hintText: 'Password',
                              prefixIcon: const Icon(Icons.key),
                              hintStyle: TextStyle(color: Colors.grey[500]),
                            ),
                            maxLines: 1,
                          ),
                        ),
                        const SizedBox(height: 80),
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
                                  borderRadius: BorderRadius.circular(10.0),
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
