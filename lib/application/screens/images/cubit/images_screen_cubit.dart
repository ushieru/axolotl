import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:axolotl/packages/podman_api/models/image.dart';
import 'package:axolotl/packages/podman_api/podman_api_singleton.dart';

part 'images_screen_state.dart';

class ImagesScreenCubit extends Cubit<ImagesScreenState> {
  ImagesScreenCubit() : super(const ImagesScreenInitial()) {
    loadImages();
  }

  final podmanApi = PodmanApiSingleton.getInstance();

  Future<void> loadImages() async {
    final images = await podmanApi.imagesService.listImages();
    emit(ImagesScreenGetImages(images));
  }
}
