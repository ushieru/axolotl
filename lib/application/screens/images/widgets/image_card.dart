import 'package:flutter/material.dart';
import 'package:axolotl/packages/podman_api/models/image.dart' as pmi;

class ImageCard extends StatelessWidget {
  const ImageCard({super.key, required this.image});

  final pmi.Image image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.maxFinite,
        child: Card(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(children: [
                  Icon(Icons.layers,
                      color: image.isActive ? Colors.pink : Colors.white70,
                      size: 40),
                  const SizedBox(width: 20),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(image.shortName),
                        Row(children: [
                          Text(image.shortId,
                              style: TextStyle(color: Colors.pink.shade400)),
                          const SizedBox(width: 15),
                          Text(image.shortTag),
                        ])
                      ])
                ]))));
  }
}
