import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SliverContentTemplate extends StatelessWidget {
  final Widget picture;
  final Widget copy;

  const SliverContentTemplate(this.picture, this.copy);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(padding: const EdgeInsets.all(4.00), child: picture),
        Padding(padding: const EdgeInsets.only(top: 10.00), child: copy),
      ],
    );
  }
}
