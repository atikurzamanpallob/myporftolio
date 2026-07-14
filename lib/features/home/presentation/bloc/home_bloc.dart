import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myportfolioapp/features/home/domain/usecase/get_home_data.dart';
import 'package:myportfolioapp/features/home/presentation/bloc/home_event.dart';
import 'package:myportfolioapp/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeData homeData;

  HomeBloc(this.homeData) : super(const HomeState()) {
    on<HomeInfoEvent>(_fetchHomeInfo);
    on<HomeContactEvent>(_fetchContactInfo);

    add(HomeInfoEvent());
    add(HomeContactEvent());
  }

  Future<void> _fetchHomeInfo(
    HomeInfoEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoadingInfo: true, error: null));

    final result = await homeData.getHomeInfo();

    result.fold(
      (failure) {
        emit(state.copyWith(isLoadingInfo: false, error: failure.message));
      },
      (homeInfo) {
        emit(state.copyWith(isLoadingInfo: false, homeInfo: homeInfo));
      },
    );
  }

  Future<void> _fetchContactInfo(
    HomeContactEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoadingContacts: true, error: null));

    final result = await homeData.getContactInfo();

    result.fold(
      (failure) {
        emit(state.copyWith(isLoadingContacts: false, error: failure.message));
      },
      (contacts) {
        emit(state.copyWith(isLoadingContacts: false, contacts: contacts));
      },
    );
  }
}
