import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:surat_app/constants/app_style.dart';
import 'package:surat_app/provider/radio_provider.dart';
import 'package:surat_app/widget/date_time_widget.dart';
import 'package:surat_app/widget/radio_widget.dart';
import 'package:surat_app/widget/textField_widget.dart';

class AddNewModel extends ConsumerWidget {
  const AddNewModel({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final radioCategory = ref.watch(radioProvider);
    return Container(
      padding: const EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.80,
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
                valueText: 'dd/mm/yy', 
                iconSec: CupertinoIcons.calendar,
                onTap: () => showDatePicker(
                  context: context, initialDate: 
                  DateTime.now(), 
                  firstDate: DateTime(2023), 
                  lastDate: DateTime(2027)),
                ),
              Gap(22),
              DateTimeWidget(
                titleText: 'Time', 
                valueText: 'hh : mm', 
                iconSec: CupertinoIcons.clock,
                onTap: () => showTimePicker(
                  context: context, 
                  initialTime: TimeOfDay.now()),
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
                  onPressed: () {},
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
                  onPressed: () {},
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

