import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:surat_app/constants/app_style.dart';
import 'package:surat_app/model/surat_model.dart';
import 'package:surat_app/provider/datetime_provider.dart';
import 'package:surat_app/provider/radio_provider.dart';
import 'package:surat_app/provider/service_provider.dart';
import 'package:surat_app/widget/date_time_widget.dart';
import 'package:surat_app/widget/radio_widget.dart';
import 'package:surat_app/widget/textField_widget.dart';

class AddNewModel extends ConsumerWidget {
  AddNewModel({
    super.key,
  });

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateProv = ref.watch(dateProvider);
    //final radioCategory = ref.watch(radioProvider);
    return Container(
      padding: const EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.98,
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
            'Isi Ringkasan',
            style: AppStyle.headingOne
          ),
          const Gap(6),
          TextFieldWidget(maxLine: 1, hintText: 'Add Arsip Name', txtController: titleController,),
          const Gap(12),
          const Text('No Surat', style: AppStyle.headingOne),
          const Gap(6),
          TextFieldWidget(maxLine: 5, hintText: 'Add Description', txtController: descriptionController),
          const Gap(12),
          const Text('Category', style: AppStyle.headingOne),
          Row(
            children: [
              Expanded(
                child: RadioWidget(
                  categoryColor: Colors.red, 
                  titleRadio: 's.mask', 
                  valueInput: 1,
                  onChangedValue: () => ref.read(radioProvider.notifier).update
                  ((state) => 1)),
              ),
              Expanded(
                child: RadioWidget(
                  categoryColor: Colors.amber, 
                  titleRadio: 's.kluar', 
                  valueInput: 2,
                  onChangedValue: () => ref.read(radioProvider.notifier).update
                  ((state) => 2),
                  ),
              ),
              Expanded(
                child: RadioWidget(
                  categoryColor: Colors.green, 
                  titleRadio: 's.tugas', 
                  valueInput: 3,
                  onChangedValue: () => ref.read(radioProvider.notifier).update
                  ((state) => 3),
                  ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [    
              DateTimeWidget(
                titleText: 'Date', 
                valueText: dateProv, 
                iconSec: CupertinoIcons.calendar,
                onTap: () async {
                  final getValue = await showDatePicker(
                  context: context, 
                  initialDate: DateTime.now(), 
                  firstDate: DateTime(2023), 
                  lastDate: DateTime(2027));

                  if (getValue != null) {
                    final format = DateFormat.yMd();
                    ref 
                    .read(dateProvider.notifier)
                    .update((state) => format.format(getValue));             
                      }
                  },  
                ),
              const Gap(22),
              DateTimeWidget(
                titleText: 'Time', 
                valueText: ref.watch(timeProvider), 
                iconSec: CupertinoIcons.clock,
                onTap: () async{
                  final getTime = await showTimePicker(
                  context: context, 
                  initialTime: TimeOfDay.now(),
                  );
                  if (getTime != null){
                    ref
                        .read(timeProvider.notifier)
                        .update((state) => getTime.format(context));
                  }
                  
                },
                ),
            ],
          ),
          Gap(12),

          //ButtonSectin
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue.shade800,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    side: BorderSide(
                      color: Colors.blue.shade800,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                  ),
                ),
                const Gap(20),
                Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    final getRadioValue = ref.read(radioProvider);
                    String category = '';

                    switch (getRadioValue) {
                      case 1: category = 'surat masuk';
                      break;
                      case 2: category = 'surat keluar';
                      break;
                      case 3: category = 'surat tugas';
                      break;
                    }

                    ref.read(serviceProvider).addNewSurat(SuratModel(
                      titleSurat: titleController.text, 
                      description: descriptionController.text, 
                      category: category, 
                      dateSurat: ref.read(dateProvider), 
                      timeSurat: ref.read(timeProvider),
                      // isSelesai: false,
                      )
                    );
                    print('data tersimpan');

                    titleController.clear();
                    descriptionController.clear();
                    ref.read(radioProvider.notifier).update((state) => 0);
                    Navigator.pop(context);
                  },
                  child: const Text('Create'),
                  ),
                ),
            ],
          )
        ],
      ), 
    );
  }
}

