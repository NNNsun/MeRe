import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/const/img_path.dart';

class StarButtons extends StatefulWidget {
  final Function(int) onIndexChanged;
  const StarButtons({super.key, required this.onIndexChanged});

  @override
  _StarButtonsState createState() => _StarButtonsState();
}

class _StarButtonsState extends State<StarButtons> {
  int _selectedIndex = -1;

  void _onButtonTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onIndexChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () => _onButtonTapped(index),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: SvgPicture.asset(
              star_empty,
              color: _selectedIndex >= index ? Colors.yellow : null,
            ),
          ),
        );
      }),
    );
  }
}
