import 'package:flutter/material.dart';

class TextIconButtonWidget extends StatelessWidget {
  const TextIconButtonWidget({
    required this.text,
    required this.icon,
    super.key,
    required this.basketFunc,
  });
  final String text;
  final Icon icon;
  final Function basketFunc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 238, 238, 238),
              border: Border.all(color: Colors.blueGrey),
              boxShadow: const [BoxShadow(color: Colors.black54, blurRadius: 3)]),
          child: TextButton.icon(
              onPressed: () {
                basketFunc();
              },
              icon: icon,
              label: Text(text))),
    );
  }
}
