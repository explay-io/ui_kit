import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

import 'undraw_illustrations.dart';

class Undraw extends StatelessWidget {
  Undraw({
    Key? key,
    required this.illustration,
    required this.color,
    this.semanticLabel,
    this.alignment = Alignment.center,
    this.fit = BoxFit.contain,
    this.colorBlendMode = BlendMode.srcIn,
    this.height,
    this.width,
    this.placeholder,
    this.errorWidget,
    this.padding,
  });

  final UndrawIllustration illustration;
  final Color color;
  final String? semanticLabel;
  final AlignmentGeometry alignment;
  final BoxFit fit;
  final BlendMode colorBlendMode;
  final double? height;
  final double? width;
  final Widget? placeholder;
  final Widget? errorWidget;
  final EdgeInsets? padding;

  Future<SvgPicture> renderIllustration(String name, Color _exColor) async {
    var nameSplit = name.toString().split('UndrawIllustration.');
    var illustration =
        illustrationList.where((i) => i['identifier'] == nameSplit[1]);
    var url = illustration.toList()[0]['url']!;
    var image = await _getSvgString(url);

    var valueString = color.toString().split('(0x')[1].split(')')[0];
    valueString = valueString.substring(2, valueString.length);
    image = image.replaceAll('#6c63ff', '#' + valueString);
    return SvgPicture.string(
      image,
      height: height,
      width: width,
      alignment: alignment,
      colorBlendMode: colorBlendMode,
      fit: fit,
      semanticsLabel: semanticLabel,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: renderIllustration(illustration.toString(), color),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: padding ?? EdgeInsets.all(16),
              child: snapshot.data,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: errorWidget ?? Text('Could not load illustration!'),
            );
          } else {
            return Center(
              child: placeholder ?? CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<String> _getSvgString(url) async {
    var response = await http.get(Uri.parse(url));
    return response.body;
  }
}
