import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'image_picker_state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  ImagePickerCubit() : super(ImagePickerInitialState());

  final ImagePicker _imagePicker = ImagePicker();

  Future<void> pickImage() async {
    try {
      final pickImage =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      if (pickImage != null) {
        emit(ImagePickerLoadedState(pickImage.path));
      } else {
        emit(ImagePickerErrorState("Please select the image"));
      }
    } catch (e) {
      String error = e.toString();
      emit(ImagePickerErrorState(error));
    }
  }
}
