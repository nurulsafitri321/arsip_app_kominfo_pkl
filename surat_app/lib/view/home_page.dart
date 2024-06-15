import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:surat_app/common/show_model.dart';
import 'package:surat_app/provider/service_provider.dart';
import 'package:surat_app/widget/card_todo_widget.dart';

import 'calendar_page.dart';
import 'notifikasi_page.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suratData = ref.watch(fetchDataProvider);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          title: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              child: Image.asset('assets/profile.png'),
            ),
            title: Text(
              'Hallo, Diskominfo',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            subtitle: const Text(
              'Dharmasraya',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CalendarPage(),
                        ),
                      );
                    },
                    icon: const Icon(CupertinoIcons.calendar),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InformationPage(),
                        ),
                      );
                    },
                    icon: const Icon(CupertinoIcons.bell),
                  ),
                ],
              ),
            )
          ]),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'List Arsip',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      'Manajemen Surat DISKOMINFO',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD5E8FA),
                      foregroundColor: Colors.blue.shade800,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () => showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      context: context,
                      builder: (context) => AddNewModel()),
                  child: const Text('+ New'),
                ),
              ],
            ),

            const Gap(20), //card list task
            ListView.builder(
              itemCount: suratData.value?.length ?? 0,
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  CardTodoListWidget(getIndex: index),
            ),
          ],
        ),
      )),
    );
  }
}
