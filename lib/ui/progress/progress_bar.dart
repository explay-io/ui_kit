import 'package:flutter/material.dart';

import '../colors.dart';

class ProgressBar extends StatelessWidget {
  final Key progressKey;
  final double progress;

  const ProgressBar({@required this.progress, this.progressKey})
      : assert(progress >= 0 && progress <= 1);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final maxProgress = size.width / 1.5;
    return Container(
      color: AppColors.secondaryLight,
      constraints: BoxConstraints.tightFor(width: maxProgress, height: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            key: progressKey,
            color: AppColors.secondary,
            constraints: BoxConstraints.tightFor(
                width: maxProgress * progress, height: 4.0),
          )
        ],
      ),
    );
  }
}
