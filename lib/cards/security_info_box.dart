import 'package:flutter/cupertino.dart';

import '../colors/app_color.dart';
import '../text.dart';

class SecurityInfoBox extends StatelessWidget {
  final Widget icon;
  final String infoHeader;
  final String infoBody;

  const SecurityInfoBox(this.icon, this.infoHeader, this.infoBody);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        decoration: const BoxDecoration(
            color: AppColor.veryLightGrey,
            border: null,
            borderRadius: BorderRadius.all(Radius.circular(16)),
            boxShadow: null),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Align(alignment: Alignment.topLeft, child: icon),
              ),
              Flexible(
                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          infoHeader,
                          style: AppText.body3,
                        )),
                  ),
                  Text(
                    infoBody,
                    style: AppText.body3SemiGray,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 15,
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
