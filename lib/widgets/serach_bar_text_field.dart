import 'package:bookapp/bloc/search_book_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../constants/strings.dart';

class SearchBarTextField extends StatelessWidget {
  const SearchBarTextField({super.key, this.autofocus = false});
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      decoration: InputDecoration(
        prefixIcon: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: kBorderColor,
            size: 20,
          ),
        ),
        hintText: kSerachHintText,
        hintStyle:
            const TextStyle(color: kHintTextColor, fontWeight: FontWeight.w500),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: kBorderColor, width: 2)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: kBorderColor)),
      ),
      onChanged: (value) {
        context.read<SearchBookPageBloc>().searchBook(value);
      },
      onFieldSubmitted: (value) {
        context.read<SearchBookPageBloc>().addHistory(value);
      },
    );
  }
}
