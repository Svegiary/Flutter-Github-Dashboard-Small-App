part of 'tabbar_cubit.dart';

abstract class TabbarState extends Equatable {
  final int index;
  const TabbarState({required this.index});

  @override
  List<Object> get props => [];
}

class Tabbar0 extends TabbarState {
  //the first tab is selected
  const Tabbar0(int i) : super(index: i);
  int get getIndex => index;
}

class Tabbar1 extends TabbarState {
  //the second tab is selected
  const Tabbar1(int i) : super(index: i);
  int get getIndex => index;
}

class Tabbar2 extends TabbarState {
  //the third tab is selected
  const Tabbar2(int i) : super(index: i);
  int get getIndex => index;
}
