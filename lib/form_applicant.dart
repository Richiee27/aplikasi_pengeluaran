import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/app_button.dart';
import 'package:flutter_application_1/components/app_text_field.dart';
import 'package:flutter_application_1/edit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> rekrutmen_List = [];

  TextEditingController keteranganController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController alamatktpController = TextEditingController();
  TextEditingController ttlController = TextEditingController();
  TextEditingController angkaController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async {
    dynamic response = await Supabase.instance.client
        .from('rekrutmen')
        .select<List<Map<String, dynamic>>>();
    setState(() {
      rekrutmen_List = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Formulir Data Diri",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Silahkan diisi dengan lengkap",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextField(
                controller: keteranganController,
                label: "Nama Lengkap",
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextField(
                  label: "Tempat Tanggal Lahir", controller: ttlController),
              const SizedBox(
                height: 20,
              ),
              AppTextField(
                controller: alamatController,
                label: "Alamat domisili",
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextField(
                  label: "Alamat KTP", controller: alamatktpController),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                onPressed: () async {
                  await Supabase.instance.client.from('rekrutmen').insert({
                    'alamat': alamatController.text,
                    'nama_lengkap': keteranganController.text,
                    'ttl': ttlController.text,
                    'alamat_ktp': alamatktpController.text,
                  });
                  fetchData();
                },
                text: "Simpan",
                color: Colors.green,
              ),
              const SizedBox(
                height: 5,
              ),
              AppButton(
                text: "Reset",
                color: Colors.grey.shade200,
                textColor: Colors.black,
              ),
              Visibility(
                visible: rekrutmen_List.isEmpty,
                child: Image.asset("images/empty_image.png"),
              ),
              Column(
                children: rekrutmen_List
                    .map(
                      (rekrutmen) => Card(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(rekrutmen['nama_lengkap']),
                                  Text(rekrutmen['ttl']),
                                  Text(rekrutmen['alamat']),
                                  Text(rekrutmen['alamat_ktp']),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              AppButton(
                                text: "Delete",
                                color: Colors.red,
                                onPressed: () async {
                                  await Supabase.instance.client
                                      .from('rekrutmen')
                                      .delete()
                                      .match({'id': rekrutmen['id']});
                                  fetchData();
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              AppButton(
                                text: "Edit",
                                color: Colors.yellow,
                                onPressed: () {
                                  Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => EditPage(
                                                  id: rekrutmen['id'],
                                                  nama_lengkap:
                                                      rekrutmen['nama_lengkap'],
                                                  ttl: rekrutmen['ttl'],
                                                  alamat: rekrutmen['alamat'],
                                                  alamat_ktp:
                                                      rekrutmen['alamat_ktp'])))
                                      .then((value) {
                                    fetchData();
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
