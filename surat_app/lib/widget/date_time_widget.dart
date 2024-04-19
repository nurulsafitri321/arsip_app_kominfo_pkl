import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/app_style.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({
    super.key,
    required this.titleText,required this.valueText, required this.iconSec,

  });

  final String titleText;
  final String valueText;
  final IconData iconSec;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(
        titleText,
        style: AppStyle.headingOne
        ),
        const Gap(6),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          decoration: BoxDecoration(color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
          ),
          child: Row(children: [
            Icon(iconSec),
            Gap(12),
            Text(valueText),
          ]),
        )
      ],
    ));
  }
}



