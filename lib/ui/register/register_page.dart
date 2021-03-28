import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_night/ui/login/login_page.dart';
import 'package:getx_night/ui/register/register_controller.dart';

class RegisterPage extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100),
              Text(
                "DSCoding",
                style: TextStyle(fontSize: 48),
              ),
              Container(
                margin: EdgeInsets.all(24),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.2),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Create Your Account",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: controller.username,
                      decoration: InputDecoration(
                        hintText: "Username",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlue),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: controller.email,
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlue),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: controller.password,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlue),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GetBuilder<RegisterController>(
                builder: (RegisterController controller) {
                  print(controller.isLoading);
                  if (controller.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return MaterialButton(
                    child: Text("Register"),
                    minWidth: MediaQuery.of(context).size.width / 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      controller.register();
                    },
                  );
                },
              ),
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(top: 50),
                height: 40,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an Account ? "),
                      InkWell(
                        onTap: () {
                          Get.off(() => LoginPage());
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: SafeArea(
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SizedBox(height: 100),
//             Text(
//               "DSCoding",
//               style: TextStyle(
//                 fontSize: 48,
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(16),
//               margin: EdgeInsets.all(24),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.blue.withOpacity(0.2),
//                     blurRadius: 8,
//                   ),
//                 ],
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     "Create Your Account",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   TextFormField(
//                     controller: username,
//                     decoration: InputDecoration(
//                       hintText: "Username",
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.lightBlue),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   TextFormField(
//                     controller: email,
//                     decoration: InputDecoration(
//                       hintText: "Email",
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.lightBlue),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   TextFormField(
//                     controller: password,
//                     decoration: InputDecoration(
//                       hintText: "Password",
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.lightBlue),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             GetBuilder<RegisterController>(
//               init: RegisterController(),
//               builder: (RegisterController controller) {
//                 print(controller.isLoading);
//                 if (controller.isLoading) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//
//                 return MaterialButton(
//                   child: Text("Register"),
//                   minWidth: MediaQuery.of(context).size.width / 2,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   color: Colors.green,
//                   textColor: Colors.white,
//                   onPressed: () {
//                     controller.register(email.text, username.text, password.text);
//                   },
//                 );
//               },
//             ),
//             Container(
//               padding: EdgeInsets.all(8),
//               margin: EdgeInsets.only(top: 50),
//               height: 40,
//               child: Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Already have an Account ? "),
//                     InkWell(
//                       onTap: () {
//                         Get.off(() => LoginPage());
//                       },
//                       child: Text(
//                         "Login",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     ),
//   );
// }

}
