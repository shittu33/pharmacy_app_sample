import 'package:flutter/material.dart';
import 'assets_icon.dart';

class SearchInput extends StatelessWidget {
  const SearchInput(
      {Key? key,
      this.enabled = true,
      this.searchButtonHandler,
      this.onSearchChanged})
      : super(key: key);

  final bool enabled;
  final Function()? searchButtonHandler;
  final Function(String text)? onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 28,
      child: GestureDetector(
        onTap: enabled ? null : searchButtonHandler,
        child: TextFormField(
          onChanged: onSearchChanged,
            style: Theme.of(context).inputDecorationTheme.hintStyle,
            decoration: InputDecoration(
                enabled: enabled,
                prefixIconConstraints:
                    const BoxConstraints.tightFor(height: 12),
                prefixIcon: Padding(
                  padding:
                      const EdgeInsets.only(left: 14.0, right: 8, bottom: 2),
                  child: AssetsSvg.searchIcon,
                ),
                hintText: 'Search')),
      ),
    );
  }
}
