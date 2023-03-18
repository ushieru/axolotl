import 'package:flutter/material.dart';

class MainLayoutButton extends StatelessWidget {
  const MainLayoutButton(
      {Key? key,
      required this.icon,
      required this.title,
      required this.onPressed})
      : super(key: key);

  final IconData icon;
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.maxFinite,
        height: 60,
        child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(foregroundColor: Colors.pink.shade400),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(icon),
                const SizedBox(width: 10),
                Text(title, style: const TextStyle(fontSize: 18))
              ]),
            )));
  }
}
