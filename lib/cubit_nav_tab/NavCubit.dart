import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class NavCubit extends Cubit<int> {
  NavCubit() : super(0); // default to Messages tab

  void selectTab(int index) => emit(index);
}
