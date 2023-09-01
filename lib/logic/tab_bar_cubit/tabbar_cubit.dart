//This cubit implements the logic for swithcing tabs in the ui

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tabbar_state.dart';

class TabbarCubit extends Cubit<TabbarState> {
  TabbarCubit() : super(const Tabbar0(0));

  void firstTab() {
    //first tab is selected
    emit(const Tabbar0(0));
  }

  void secondTab() {
    //second tab is selected
    emit(const Tabbar1(1));
  }

  void thirdTab() {
    //third tab is selected
    emit(const Tabbar2(2));
  }
}
