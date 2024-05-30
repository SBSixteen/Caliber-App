// ignore_for_file: must_be_immutable

import 'package:calibre/Components/Other/BigColorBar.dart';
import 'package:flutter/material.dart';
import 'package:calibre/constants.dart';

class BulletStats extends StatefulWidget {
  int ammoPenn;
  int ammoFrag;

  BulletStats(this.ammoPenn, this.ammoFrag, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _BulletStatsState();
  }
}

class _BulletStatsState extends State<BulletStats> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
                Text(
          "Penetration",
          style: constants.ammunitionVariant,
        ),
        BigColorBar(),
        const SizedBox(height: 8.0,),
        Row(
          children: [
            SizedBox(
              width:
                  ((widget.ammoPenn > 60 ? 60 : widget.ammoPenn) / 60) * 150 +
                      21,
            ),
            const Icon(
              Icons.arrow_drop_up_outlined,
              size: 12.0,
              color: Colors.white,
            )
          ],
        ),
        Text(
          "Stopping Power",
          style: constants.ammunitionVariant,
        ),
        BigColorBar(),
        Row(
          children: [
            SizedBox(
              width: ((widget.ammoFrag > 100 ? 100 : widget.ammoFrag) / 100) *
                      150 +
                  14,
            ),
            const Icon(
              Icons.arrow_drop_up_outlined,
              size: 12.0,
              color: Colors.white,
            )
          ],
        ),
      ],
    );
  }
}
