import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housekeeping/constants/constant.dart';
import 'package:housekeeping/controllers/main_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<MainController>();
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                color: Colors.white38,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                          'https://i.pinimg.com/736x/09/63/6b/09636b5ff7deb5b8d7131f55f9458a65.jpg'),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          controller:
                              controller.loginCtr.serverUrlController.value,
                          onChanged:
                              controller.loginCtr.onServerUrlInputValueChange,
                          style: const TextStyle(fontSize: 12),
                          decoration: const InputDecoration(
                            // suffixIcon: Icon(Icons),
                            hintText: 'Server URL',
                          ),
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          controller:
                              controller.loginCtr.usernameController.value,
                          onChanged:
                              controller.loginCtr.onUsernameInputValueChange,
                          style: const TextStyle(fontSize: 12),
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.account_circle_sharp),
                            hintText: 'Email or username',
                          ),
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          controller:
                              controller.loginCtr.passwordController.value,
                          onChanged:
                              controller.loginCtr.onPasswordInputValueChange,
                          style: const TextStyle(fontSize: 12),
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.key),
                            hintText: 'Password',
                          ),
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 50),
                      Container(
                        width: 400,
                        height: 50,
                        child: FloatingActionButton(
                          onPressed: controller.loginCtr.onLoginPressed,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.login),
                              Text("Login"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
