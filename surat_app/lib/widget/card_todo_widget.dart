import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardTodoListWidget extends StatelessWidget {
  const CardTodoListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.green,
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
                title:  Text('Hari Peringatan Sumpah Pemuda'),
                subtitle:  Text('surat penting ini mah'),
                trailing: Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    activeColor: Colors.blue.shade600,
                    shape: const CircleBorder(),
                    value: true, 
                    onChanged: (value) => print(value),
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
                    Text('Today'),
                    Gap(12),
                    Text('09:15PM-11:45PM')
                  ],
                )
                  ],),
                ),
              )
            ],),),
          ),
      ],
      ),
    );
  }
}



