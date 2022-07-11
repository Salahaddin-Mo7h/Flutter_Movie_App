

import 'package:flutter/material.dart';

class DiscoverAppBarWidget extends StatelessWidget {
  const DiscoverAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3)
      ),
      padding: const EdgeInsets.only(
        top: 10.0,
        left: 5.0,
        right: 0.0,
        bottom: 0.0
      ),
      child: Text(
        'Real life Actors',
        style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 32.0,
            color: Colors.grey[850]),
      ),
    );
  }
}