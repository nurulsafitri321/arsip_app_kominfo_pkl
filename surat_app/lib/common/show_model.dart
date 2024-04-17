import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:surat_app/constants/app_style.dart';
import 'package:surat_app/widget/radio_widget.dart';
import 'package:surat_app/widget/textField_widget.dart';

class AddNewModel extends StatelessWidget {
  const AddNewModel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.70,
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const SizedBox(
            width: double.infinity,
            child: Text(
              'New Arsip Today',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22, 
                fontWeight: FontWeight.bold,
                color: Colors.black
                ),
              ),
          ),
          Divider(
            thickness: 1.2,color: Color.fromARGB(255, 218, 214, 214),
            
          ),
          const Gap(12),
          const Text(
            'Title Arsip',
            style: AppStyle.headingOne
          ),
          const Gap(6),
          TextFieldWidget(maxLine: 1, hintText: 'Add Arsip Name'),
          const Gap(12),
          const Text('Description', style: AppStyle.headingOne),
          const Gap(6),
          const TextFieldWidget(maxLine: 5, hintText: 'Add Description'),
          const Gap(12),
          const Text('Category', style: AppStyle.headingOne),
          Row(
            children: const [
              Expanded(
                child: RadioWidget(categoryColor: Colors.red, titleRadio: 's.mask'),
              ),
              Expanded(
                child: RadioWidget(categoryColor: Colors.blue, titleRadio: 's.kluar'),
              ),
              Expanded(
                child: RadioWidget(categoryColor: Colors.green, titleRadio: 's.tugas'),
              ),
            ],
          )
        ],
      ), 
    );
  }
}


