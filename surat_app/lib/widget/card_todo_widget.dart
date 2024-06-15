//import 'dart:js_interop_unsafe';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:surat_app/provider/service_provider.dart';

class CardTodoListWidget extends ConsumerWidget {
  const CardTodoListWidget({
    super.key,
    required this.getIndex,
  });

  final int getIndex;
  


  @override
  Widget build(BuildContext context,WidgetRef ref ) {
    final suratData = ref.watch(fetchDataProvider);
    return suratData.when(
      data: (suratData) {
        Color categoryColor = Colors.white;
        final getCategory = suratData[getIndex].category;
        switch(getCategory) {
          case 'surat masuk' : categoryColor = Colors.red; break;
          case 'surat keluar' : categoryColor = Colors.yellow; break;
          case 'surat tugas' : categoryColor = Colors.green; break;
        }
        return Container(  
          margin: const EdgeInsets.symmetric(vertical: 5),
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(children: [
            Container(
              decoration: BoxDecoration(
                color: categoryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              width: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: IconButton(icon: Icon(CupertinoIcons.delete), onPressed:()=> ref.read(serviceProvider).
                    deleteSurat(suratData[getIndex].docID)),
                    title:  Text(suratData[getIndex].
                      titleSurat, maxLines: 1, 
                      // style: TextStyle(decoration: suratData[getIndex].
                      // isSelesai ? TextDecoration.lineThrough : null),
                      ),
                    subtitle:  Text(suratData[getIndex].
                      description, maxLines: 1,
                      // style : TextStyle(decoration: suratData[getIndex].
                      // isSelesai ? TextDecoration.lineThrough : null)
                      ),
                      trailing: Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        activeColor: Colors.blue.shade600,
                        shape: const CircleBorder(),
                        value: false, 
                        onChanged: (value) => ref.read(serviceProvider).updateTask(suratData[getIndex].docID, value),
                        ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0,-12),
                    child: Container(
                      child: Column(children: [
                        Divider(
                      thickness: 1.5,
                      color: Colors.grey.shade100,
                    ),
                    Row(
                      children: [
                        Text('waktu :'),
                        Gap(12),
                        Text(suratData[getIndex].timeSurat)
                      ],
                    )
                      ],),
                    ),
              )
            ],),),
          ),
      ],
      ),);
      },

   // Center

      // error: (error, strackTrace) =>  Center(
      //   child: Text(StackTrace.toString()),
      // ),
      error: (error, stackTrace) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Error occurred: ${error.toString()}"),
            Text("Stack Trace: ${stackTrace.toString()}"),
          ],
        ),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}



