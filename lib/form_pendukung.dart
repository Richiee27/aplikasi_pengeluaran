import 'package:flutter/material.dart';

class FormPendukung extends StatelessWidget {
  const FormPendukung({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Formulir Pendukung",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 5.0, mainAxisSpacing: 10.0),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 4.0,
              child: ListTile(
                leading: const Icon(Icons.upload),
                title: const Text('Upload PDF'),
                subtitle:
                    Text('Silahkan ketuk disini untuk mengunggah | $index'),
                onTap: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}
