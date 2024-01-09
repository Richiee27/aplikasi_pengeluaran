import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/app_button.dart';
import 'package:flutter_application_1/components/app_text_field.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditPage extends StatefulWidget {
  final String nama_lengkap;
  final String ttl;
  final int id;
  final String alamat;
  final String alamat_ktp;

  const EditPage({
    super.key,
    required this.ttl,
    required this.nama_lengkap,
    required this.id,
    required this.alamat,
    required this.alamat_ktp,
  });

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController keteranganController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController alamatktpController = TextEditingController();
  TextEditingController ttlController = TextEditingController();
  TextEditingController angkaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    keteranganController.text = widget.nama_lengkap;
    ttlController.text = widget.ttl;
    alamatController.text = widget.alamat;
    alamatktpController.text = widget.alamat_ktp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Formulir",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Edit Data Diri",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 30,
              ),
              AppTextField(
                controller: keteranganController,
                label: "Nama Lengkap",
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextField(
                controller: ttlController,
                label: "Tempat Tanggal Lahir",
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextField(
                controller: alamatController,
                label: "Alamat Domisili",
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextField(
                controller: alamatktpController,
                label: "Alamat KTP",
              ),
              const SizedBox(
                height: 30,
              ),
              AppButton(
                text: "Simpan",
                color: Colors.green,
                onPressed: () async {
                  await Supabase.instance.client.from('rekrutmen').update({
                    'nama_lengkap': keteranganController.text,
                    'ttl': ttlController.text,
                    'alamat': alamatController,
                    'alamat_ktp': alamatktpController,
                  }).match({'id': widget.id});
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
