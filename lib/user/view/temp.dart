// import 'package:flutter/material.dart';

// class CustomDropdown extends StatefulWidget {
//   const CustomDropdown({super.key});

//   @override
//   State<CustomDropdown> createState() => _CustomDropdownState();
// }

// class _CustomDropdownState extends State<CustomDropdown> {
//   GlobalKey actionKey = GlobalKey();
//   double? height, width, xPosition, yPosition;
//   bool isDropdownOpened = false;
//   late OverlayEntry floatingDropdown;
//   String _dropdownValue = 'One';

//   @override
//   void initState() {
//     actionKey = LabeledGlobalKey(_dropdownValue);
//     super.initState();
//   }

//   void findDropdownData() {
//     RenderBox renderBox =
//         actionKey.currentContext!.findRenderObject() as RenderBox;
//     height = renderBox.size.height;
//     width = renderBox.size.width;
//     Offset offset = renderBox.localToGlobal(Offset.zero);
//     xPosition = offset.dx;
//     yPosition = offset.dy;
//     print('=========================================');
//     print(height);
//     print(width);
//     print(xPosition);
//     print(yPosition);
//     print('=========================================');
//   }

//   OverlayEntry _createFloatingDropdown() {
//     return OverlayEntry(builder: (_) {
//       return Positioned(
//         left: xPosition,
//         width: width,
//         top: yPosition! + height!,
//         height: height! * 4, // 수정
//         child: DropDown(
//           itemHeight: height!, // 수정
//         ),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       key: actionKey,
//       onTap: () {
//         setState(() {
//           if (isDropdownOpened) {
//             floatingDropdown.remove();
//           } else {
//             findDropdownData();
//             floatingDropdown = _createFloatingDropdown();
//             Overlay.of(context)!.insert(floatingDropdown);
//           }

//           isDropdownOpened = !isDropdownOpened;
//         });
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8.0),
//           border: Border.all(color: INPUT_BORDER_COLOR),
//           color: INPUT_BG_COLOR,
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//           child: Row(
//             children: [
//               Text(
//                 _dropdownValue,
//                 style: TextStyle(color: Colors.black26),
//               ),
//               Spacer(),
//               Icon(
//                 Icons.arrow_drop_down,
//                 color: Colors.black38,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DropDown extends StatefulWidget {
//   const DropDown({
//     super.key,
//     required this.itemHeight,
//   });
//   final double itemHeight;

//   @override
//   State<DropDown> createState() => _DropDownState();
// }

// class Date {
//   bool isSelected;
//   final int date;
//   Date({
//     this.isSelected = false,
//     required this.date,
//   });
// }

// class _DropDownState extends State<DropDown> {
//   List<Date> years = <Date>[];
//   List months = [];
//   List days = [];
//   @override
//   void initState() {
//     years = getYears();
//     super.initState();
//   }

//   List<Date> getYears() {
//     DateTime now = DateTime.now();
//     int year = now.year;
//     int oldYear = year - 100;
//     for (year; year > oldYear; year--) {
//       years.add(Date(date: year, isSelected: false));
//     }
//     return years;
//   }

//   List getMonths() {
//     for (int calendar = 1; calendar < 13; calendar++) {
//       months.add(calendar);
//     }
//     return months;
//   }

//   List getDays() {
//     for (int calendar = 1; calendar < 32; calendar++) {
//       days.add(calendar);
//     }
//     return days;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: 4 * widget.itemHeight, //수정
//         decoration: BoxDecoration(
//           border: Border.all(color: INPUT_BORDER_COLOR),
//           color: INPUT_BG_COLOR,
//         ),

//         child: ListView.builder(
//           itemBuilder: (BuildContext context, int index) {
//             return GestureDetector(
//                 child: Container(
//                   color:
//                       years[index].isSelected ? Colors.black12 : INPUT_BG_COLOR,
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text(
//                       "${years[index].date}",
//                       style: TextStyle(fontSize: 14, color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 onTap: () {
//                   setState(() {
//                     for (int i = 0; i < years.length; i++) {
//                       years[i].isSelected = false;
//                     }
//                     years[index].isSelected = true;
//                     _dropdownValue;
//                   });
//                 });
//           },
//           itemCount: years.length,
//         ),
//       ),
//     );
//   }
// }




// // ListView.builder(
// //         itemCount: 100,
// //         itemBuilder: (BuildContext ctx, int idx) {
// //           return Text('Content Number ${idx}');
// //         },
// //       ),