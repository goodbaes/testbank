import 'package:bloc/bloc.dart';

class CurrentIndexCubit extends Cubit<int> {
  CurrentIndexCubit() : super(-1);

  changeIndex(int index) {
    if (index == state) {
      emit(-1);
    } else {
      emit(index);
    }
  }
}
