import 'package:equatable/equatable.dart';
import 'package:myportfolioapp/features/career/domain/entity/certificate_item.dart';
import 'package:myportfolioapp/features/career/domain/entity/work_experience_item.dart';

class CareerState extends Equatable {
  final bool? isCertificateLoading;
  final bool? isExperienceLoading;
  final List<CertificationItem>? certificates;
  final List<WorkExperienceItem>? experiences;
  final String? error;
  const CareerState({
    this.certificates,
    this.experiences,
    this.isCertificateLoading,
    this.isExperienceLoading,
    this.error,
  });

  CareerState copyWith({
    bool? isCertificateLoading,
    bool? isExperienceLoading,
    List<CertificationItem>? certificates,
    List<WorkExperienceItem>? experiences,
    String? error,
  }) {
    return CareerState(
      certificates: certificates ?? this.certificates,
      experiences: experiences ?? this.experiences,
      isCertificateLoading: isCertificateLoading ?? this.isCertificateLoading,
      isExperienceLoading: isExperienceLoading ?? this.isExperienceLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
    certificates,
    experiences,
    isCertificateLoading,
    isExperienceLoading,
    error,
  ];
}
