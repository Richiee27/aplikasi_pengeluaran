import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/app_button.dart';
import 'package:flutter_application_1/components/app_text_field.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditPage extends StatefulWidget {
  final String description;
  final String amount;
  final int id;

  const EditPage({
    super.key,
    required this.amount,
    required this.description,
    required this.id,
  });

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController keteranganController = new TextEditingController();
  TextEditingController amountController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    keteranganController.text = widget.description;
    amountController.text = widget.amount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Edit Page",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 30,
              ),
              AppTextField(
                controller: keteranganController,
                label: "Keterangan",
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextField(
                controller: amountController,
                label: "Jumlah Pengeluaran",
              ),
              const SizedBox(
                height: 30,
              ),
              AppButton(
                text: "Simpan",
                color: Colors.red,
                onPressed: () async {
                  await Supabase.instance.client.from('expense').update({
                    'description': keteranganController.text,
                    'amount': amountController.text,
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
