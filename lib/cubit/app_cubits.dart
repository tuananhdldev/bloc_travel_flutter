import 'package:bloc/bloc.dart';
import 'package:bloc_travel_app/cubit/app_cubit_states.dart';
import 'package:bloc_travel_app/models/data_model.dart';
import 'package:bloc_travel_app/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.dataServices}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices dataServices;
  late final List<DataModel> places;

  void getData() async {
    try {
      emit(LoadingState());
      places = await dataServices.getInfo();

      emit(LoadedState(places));
    } catch (e) {
      print(e.toString());
    }
  }

  void goDetail(DataModel dataModel) {
    emit(DetailState(dataModel));
  }
  void goHome(){
    emit(LoadedState(places));
  }
}
