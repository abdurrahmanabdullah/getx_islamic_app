import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({super.key});
  // final RegisterController controller = Get.put(RegisterController());

  /// dependency injection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: controller.nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: controller.emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: controller.passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                ///Use Get.toNamed when you want to navigate to a new route and maintain the ability to navigate back to the previous route (pushing onto the stack).
                ///Use Get.offAllNamed when you want to navigate to a new route and clear out the previous navigation history

                // ElevatedButton(
                //   onPressed: () async {
                //     bool signUpSuccess = controller.signUp(context) as bool;
                //     if (signUpSuccess) {
                //       print("----------------------------------- sinthia ");
                //       Get.toNamed(Routes.SIGNIN);
                //     } else {
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         const SnackBar(content: Text('Sign up failed')),
                //       );
                //     }
                //   },
                //   child: const Text('Register'),
                // ),
                ElevatedButton(
                  onPressed: () {
                    controller.signUp(context);
                    Get.toNamed(Routes.SIGNIN);
                  },
                  child: const Text('Register'),
                ),
                // ElevatedButton(
                //   onPressed: () async {
                //     bool x = await controller.signUp(context);
                //     if (x == true) {
                //       Get.toNamed(Routes.SIGNIN);
                //     } else {
                //       ScaffoldMessenger.of(context).showSnackBar(
                //           const SnackBar(content: Text('Sign up failed:')));
                //     }
                //   },
                //   child: const Text('Register'),
                // ),

                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.USER_API);
                  },
                  child: const Text('user Profile'),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const SignInPage()),
                //     );
                //   },
                //   child: const Text('Sign In'),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
