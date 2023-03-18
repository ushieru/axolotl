part of 'images_screen_cubit.dart';

@immutable
abstract class ImagesScreenState {
  const ImagesScreenState(this.images);
  final List<Image> images;
}

class ImagesScreenInitial extends ImagesScreenState {
  const ImagesScreenInitial() : super(const []);
}

class ImagesScreenGetImages extends ImagesScreenState {
  const ImagesScreenGetImages(super.images);
}
