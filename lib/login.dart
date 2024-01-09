import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/app_button.dart';
import 'package:flutter_application_1/components/app_text_field.dart';
import 'package:flutter_application_1/frontpage.dart';
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
      Future.delayed(const Duration(milliseconds: 100), () {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const FrontPage())));
      });
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const FrontPage())));
    }
  }

  void Login() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username != 'user' || password != 'user123') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Username atau Password salah"),
      ));
      return;
    }
    final box = GetStorage();
    box.write('username', username);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const FrontPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Provices Indonesia",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Login App\nTerdahulu",
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
            const SizedBox(
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
