import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/app_button.dart';
import 'package:flutter_application_1/components/app_text_field.dart';
import 'package:flutter_application_1/home.dart';
import 'package:get_storage/get_storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    CheckUser();
  }

  void CheckUser() {
    final box = GetStorage();
    String? username = box.read('username');
    if (username != null) {
      print("LOGIN USER (username)");
      Future.delayed(Duration(milliseconds: 100), () {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => HomePage())));
      });
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => HomePage())));
    }
  }

  void Login() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username != 'admin' || password != 'admin') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Username atau Password salah"),
      ));
      return;
    }
    final box = GetStorage();
    box.write('username', username);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "Silahkan Login",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 40,
            ),
            AppTextField(
              controller: usernameController,
              label: "Username",
            ),
            const SizedBox(
              height: 30,
            ),
            AppTextField(
              controller: passwordController,
              label: "Password",
            ),
            SizedBox(
              height: 40,
            ),
            AppButton(
              onPressed: () {
                Login();
              },
              text: 'Login',
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
