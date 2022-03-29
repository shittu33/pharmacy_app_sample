
import 'package:flutter/material.dart';

class LocationLabel extends StatelessWidget {
  const LocationLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 0,
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 6,
      leading: const Icon(
        Icons.location_on_outlined,
      ),
      title: Text.rich(TextSpan(
          text: 'Delivery in ',
          style: Theme.of(context).textTheme.subtitle2,
          children: const [
            TextSpan(
              text: 'Lagos, NG',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ])),
    );
  }
}
