import 'package:flutter/material.dart';
import 'package:new_me_re/common/const/color.dart';
import 'package:new_me_re/common/const/img_path.dart';
import 'package:new_me_re/common/layout/default_layout.dart';
import 'package:new_me_re/order/widget/basket_bottom_sheet.dart';
import 'package:new_me_re/order/widget/delete_all.dart';

class ShoppingBasket extends StatelessWidget {
  const ShoppingBasket({super.key});
  @override
  Widget build(BuildContext context) {
    double bottomSheetSize = MediaQuery.of(context).size.height * 0.2;
    int costAll = 0;
    return DefaultLayout(
      backgroundColor: INPUT_BG_COLOR,
      title: '장바구니',
      firstActionBtn: home_btn,
      bottomSheet:
          BasketBottomSheet(bottomSheetSize: bottomSheetSize, costAll: costAll),
      child: CustomScrollView(
        slivers: [
          const SliverPersistentHeader(
            delegate: DeleteAll(),
            pinned: true,
          ),
          const SliverToBoxAdapter(
            child: Divider(height: 1),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              color: Colors.white,
              height: 50,
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '비둘기는 멍청해보여',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
