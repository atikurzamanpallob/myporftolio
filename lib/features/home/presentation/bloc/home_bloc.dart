import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myportfolioapp/features/home/domain/usecase/get_home_data.dart';
import 'package:myportfolioapp/features/home/presentation/bloc/home_event.dart';
import 'package:myportfolioapp/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetHomeData homeData;
  HomeBloc(this.homeData) : super(InfoLoading()) {
    on<HomeInfoEvent>(fetchHomeInfo);
    on<HomeContactEvent>(fetchContactInfo);
  }

  Future<void> fetchHomeInfo(
    HomeInfoEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(InfoLoading());

    var object = await homeData.getHomeInfo();
    object.fold(
      (homeinfo) {
        emit(InfoLoaded(homeinfo));
      },
      (failure) {
        emit(Failed(failure.message));
      },
    );
  }

  Future<void> fetchContactInfo(
    HomeContactEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(ContactLoading());

    var object = await homeData.getContactInfo();
    object.fold(
      (contacts) {
        emit(ContactLoaded(contacts));
      },
      (failure) {
        emit(Failed(failure.message));
      },
    );
  }
}
