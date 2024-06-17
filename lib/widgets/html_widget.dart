import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class HtmlWidgetFromFile extends StatelessWidget {
  final String filePath;
  final Map<String, String>? customStylesBuilder;

  const HtmlWidgetFromFile({
    super.key,
    required this.filePath,
    this.customStylesBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(filePath),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return HtmlWidget(
            snapshot.data!,
            customStylesBuilder: (element) => customStylesBuilder,
          );
        } else if (snapshot.hasError) {
          return Text('Error loading HTML file: ${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
