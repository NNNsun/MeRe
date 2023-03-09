import 'package:flutter/material.dart';
import 'package:new_me_re/common/const/color.dart';

class RenderDivider extends StatelessWidget {
  const RenderDivider({
    super.key,
    required this.useHistory,
  });
  final bool useHistory;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: useHistory
          ? const EdgeInsets.only(top: 20)
          : const EdgeInsets.symmetric(vertical: 20),
      child: const Divider(
        color: INPUT_BG_COLOR,
        height: 12,
        thickness: 12,
      ),
    );
  }
}
