import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myportfolioapp/features/career/domain/usecase/career_data.dart';
import 'package:myportfolioapp/features/career/presentation/bloc/career_event.dart';
import 'package:myportfolioapp/features/career/presentation/bloc/career_state.dart';

class CareerBloc extends Bloc<CareerEvent, CareerState> {
  CareerData careerData;
  CareerBloc(this.careerData) : super(CareerState()) {
    on<CertificateFetchEvent>(getCertificate);
    on<ExperienceFetchEvent>(getExperience);
    add(ExperienceFetchEvent());
    add(CertificateFetchEvent());
  }

  Future getCertificate(
    CertificateFetchEvent event,
    Emitter<CareerState> emit,
  ) async {
    emit(state.copyWith(isCertificateLoading: true));

    final result = await careerData.getCertifcates();

    result.fold(
      (failure) {
        emit(
          state.copyWith(isCertificateLoading: false, error: failure.message),
        );
      },
      (certificates) {
        emit(
          state.copyWith(
            isCertificateLoading: false,
            certificates: certificates,
          ),
        );
      },
    );
  }

  Future getExperience(
    ExperienceFetchEvent event,
    Emitter<CareerState> emit,
  ) async {}
}
