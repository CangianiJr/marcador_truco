import 'package:flutter/material.dart';

class LayoutComponent extends StatelessWidget {
  const LayoutComponent({
    Key? key,
    required this.child,
    required this.title,
  }) : super(key: key);
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: child,
    );
  }
}
