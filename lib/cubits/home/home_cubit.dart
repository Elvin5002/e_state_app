import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final BehaviorSubject<int> viewSubject = BehaviorSubject.seeded(0);
  final BehaviorSubject<int> selectedCategory = BehaviorSubject.seeded(0);

}
