

import 'package:flutter/material.dart';
import 'package:pets_finder_app/core/themes/styles/styles.dart';

class SearchField extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onSuffixTap;
  final String hintText;

  const SearchField({
    super.key,
     this.controller,
    this.onSuffixTap,
    this.hintText = 'Search',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    //  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Icon(Icons.search, color: Colors.black),
          hintStyle: TextStyles.font16GreyRegular,
          suffixIcon: GestureDetector(
            onTap: onSuffixTap,
            child: const Icon(Icons.close, color: Colors.black),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}
