import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
    required this.val,
  }) : super(key: key);

  final int val;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 2.w),
      color: val!=0?Colors.blue:Colors.grey,
      child: const Center(
        child: Text("Search"),
      ),
    );
  }
}