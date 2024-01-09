import 'package:flutter_application_1/about.dart';
import 'package:flutter_application_1/components/app_button.dart';
import 'package:flutter_application_1/form_pendukung.dart';
import 'package:flutter_application_1/form_applicant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:get_storage/get_storage.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Laman Utama',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Image(
                    image: AssetImage("images/unnamed.jpg"),
                    width: 200.0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Jangan lupa berdoa sebelum melamar!",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.all(25.0),
                  child: IconButton(
                    color: Colors.orange,
                    iconSize: 60,
                    icon: const Icon(Icons.list_alt_rounded),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const HomePage()));
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(25.0),
                  child: IconButton(
                    color: Colors.blue,
                    iconSize: 60,
                    icon: const Icon(Icons.create_new_folder_rounded),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const FormPendukung()));
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  child: IconButton(
                    color: Colors.redAccent,
                    iconSize: 60,
                    icon: const Icon(Icons.list_rounded),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => (const HomePage())));
                    },
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.all(25.0),
                  child: IconButton(
                    color: Colors.cyan,
                    iconSize: 60,
                    icon: const Icon(Icons.help_center_rounded),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => const About()));
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(25.0),
                  child: IconButton(
                    color: Colors.teal,
                    iconSize: 60,
                    icon: const Icon(Icons.settings_applications_rounded),
                    onPressed: () {
                      Navigator.pop;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  child: IconButton(
                    color: Colors.green,
                    iconSize: 60,
                    icon: const Icon(Icons.pageview_rounded),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const HomePage()));
                    },
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 80.0),
                  child: const Image(
                    image: AssetImage("images/logo.jpg"),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            AppButton(
              text: "Logout",
              color: Colors.red,
              onPressed: () {
                final box = GetStorage();
                box.remove('username');
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false);
              },
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 380.0),
              child: const Text(
                "Untuk Keperluan Internal Penugasan",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  height: 4.0,
                ),
              ),
            ),
          ],
        ));
  }
}
