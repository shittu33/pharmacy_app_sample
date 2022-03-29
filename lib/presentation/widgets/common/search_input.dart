import 'package:flutter/material.dart';
import 'assets_icon.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 28,
      child: TextFormField(
          style: Theme.of(context).inputDecorationTheme.hintStyle,
          decoration: InputDecoration(
              prefixIconConstraints: const BoxConstraints.tightFor(height: 12),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 14.0,right: 8,bottom: 2),
                child: AssetsSvg.searchIcon,
              ),
              hintText: 'Search')),
    );
  }
}
