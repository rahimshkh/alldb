import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationCubit extends Cubit<int> {
  BottomNavigationCubit({int? index}) : super(index = 0);

  onTap(int index) {
    emit(index);
  }
}
