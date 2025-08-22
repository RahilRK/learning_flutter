part of 'image_picker_cubit.dart';

@immutable
sealed class ImagePickerState {}

final class ImagePickerInitialState extends ImagePickerState {}
final class ImagePickerLoadedState extends ImagePickerState {

  final String imagePath;
  ImagePickerLoadedState(this.imagePath);
}
final class ImagePickerErrorState extends ImagePickerState {

  final String errorMessage;
  ImagePickerErrorState(this.errorMessage);
}
