import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'common/show_model.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Arsip Surat App",
        theme: ThemeData(),
        home: const HomePage(),
      ),
    )
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200 ,
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
              'Hello, Diskominfo',
              style: TextStyle(fontSize: 12,color: Colors.grey),),
            subtitle: const Text(
              'Dharmasraya',
              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
          ),
          actions: [
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              IconButton(
                onPressed: (){},
                icon: const Icon(CupertinoIcons.calendar),
              ),
              IconButton(
                onPressed: (){},
                icon: const Icon(CupertinoIcons.bell),
              ),
            ],),
            )
          ]
      ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30), 
        child: Column(children: [
          const Gap(20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Today\'s Task',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
              Text('Wednesdat, 16 April',
              style: TextStyle(color: Colors.grey),),
            ],
          ),
          
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFD5E8FA),
              foregroundColor: Colors.blue.shade800,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              )
            ),
            onPressed: () => showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
              ),
              context: context,
              builder: (context) => const AddNewModel()
            ), 
            child: const Text('+ New'),
          ),
        ],
      )
    ],),
    )),
    );
  }
}



