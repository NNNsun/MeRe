import 'package:flutter/material.dart';

class CustomChipWidget extends StatelessWidget {
  final String title;
  final int timeTaken;

  const CustomChipWidget({
    required this.title,
    required this.timeTaken,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Colors.transparent;
    switch (title) {
      case '여유':
        color = Colors.blue;
        break;
      case '보통':
        color = Colors.orange;
        break;
      case '혼잡':
        color = Colors.red;
        break;
    }

    return Row(
      children: [
        Chip(
            label: Text(
              title,
              style: TextStyle(fontSize: 12, color: color),
            ),
            backgroundColor: Colors.white,
            shape: StadiumBorder(side: BorderSide(color: color)),
            visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4)),
        const SizedBox(width: 4),
        Chip(
            label: Text(
              'TAKETIME $timeTaken분',
              style: TextStyle(fontSize: 12, color: color),
            ),
            backgroundColor: Colors.white,
            shape: StadiumBorder(side: BorderSide(color: color)),
            visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4)),
      ],
    );
  }
}
