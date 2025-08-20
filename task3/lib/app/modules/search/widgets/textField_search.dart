import 'package:flutter/material.dart';

class TextfieldSearch extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final Function(String)? onSearch; // callback khi nhấn Done hoặc bấm icon

  const TextfieldSearch({
    super.key,
    required this.controller,
    required this.focusNode,
    this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      controller: controller,
      focusNode: focusNode,
      textInputAction: TextInputAction.done, // nút Done trên bàn phím
      onSubmitted: (value) {
        if (value.trim().isNotEmpty && onSearch != null) {
          onSearch!(value.trim());
        }
      },
      decoration: InputDecoration(
        hintText: "Tìm kiếm sản phẩm",
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
