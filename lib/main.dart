import 'package:demo_html/extension/widget.dart';
import 'package:flutter/material.dart';

import 'widgets/html_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DemoWidget(),
    );
  }
}

class DemoWidget extends StatelessWidget {
  const DemoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo HTML'),
      ),
      body: Center(
        child: const SingleChildScrollView(
          child: HtmlWidgetFromFile(
            filePath: 'assets/html/demo.html',
            customStylesBuilder: {
              'body': 'overflow: auto',
            },
          ),
        ).paddingHorizontal(10),
      ),
    );
  }
}
