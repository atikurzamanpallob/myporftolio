import 'package:equatable/equatable.dart';
import 'package:myportfolioapp/features/career/domain/entity/certificate_item.dart';

class CareerState extends Equatable {
  final bool? isCertificateLoading;
  final bool? isExperienceLoading;
  final List<CertificationItem>? certificates;
  final String? error;
  const CareerState({
    this.certificates,
    this.isCertificateLoading,
    this.isExperienceLoading,
    this.error,
  });

  CareerState copyWith({
    bool? isCertificateLoading,
    bool? isExperienceLoading,
    List<CertificationItem>? certificates,
    String? error,
  }) {
    return CareerState(
      certificates: certificates ?? this.certificates,
      isCertificateLoading: isCertificateLoading ?? this.isCertificateLoading,
      isExperienceLoading: isExperienceLoading ?? this.isExperienceLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
    certificates,
    isCertificateLoading,
    isExperienceLoading,
    error,
  ];
}
