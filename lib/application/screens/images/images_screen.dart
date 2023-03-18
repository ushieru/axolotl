import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:axolotl/application/layouts/main_layout.dart';
import 'package:axolotl/application/screens/images/cubit/images_screen_cubit.dart';
import 'package:axolotl/application/screens/images/widgets/image_card.dart';

class ImagesScreen extends StatelessWidget {
  const ImagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(children: [
              Row(children: [
                const Icon(Icons.layers, color: Colors.pink, size: 40),
                const SizedBox(width: 15),
                Text('Images',
                    style: TextStyle(
                        color: Colors.pink.shade400,
                        fontSize: 30,
                        fontWeight: FontWeight.bold))
              ]),
              const SizedBox(height: 30),
              Expanded(
                  child: BlocBuilder<ImagesScreenCubit, ImagesScreenState>(
                bloc: ImagesScreenCubit(),
                builder: (context, state) => ListView(
                    children: state.images
                        .map((image) => ImageCard(image: image))
                        .toList()),
              ))
            ])));
  }
}
