import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'About Us',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                size: 40.0,
              )),
          toolbarOpacity: 0.8,
          elevation: 0.00,
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
        ),
        body: const Center(
          child: Card(
            elevation: 50,
            shadowColor: Colors.black,
            color: Colors.grey,
            child: SizedBox(
              height: 500,
              width: 300,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(children: [
                  CircleAvatar(
                    backgroundColor: Colors.white10,
                    radius: 80,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/book1.png"),
                      radius: 70,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Tentang Provices Indonesia',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'PT Provices Indonesia merupakan perusahaan pengelola aset manajemen properti terkemuka sejak 2007',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Kami memiliki bermacam unit usaha seperti Cleaning Service, Security, Customer Service',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
