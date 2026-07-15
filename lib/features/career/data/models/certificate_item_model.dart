import 'package:myportfolioapp/features/career/domain/entity/certificate_item.dart';

class CertificateItemModel extends CertificationItem {
  CertificateItemModel({
    required super.id,
    required super.title,
    required super.issuer,
    required super.certificateUrl,
    required super.certificateImageUrl,
  });

  factory CertificateItemModel.fromJson(Map<String, dynamic> json) {
    return CertificateItemModel(
      id: json['id'],
      title: json['certificate_name'],
      issuer: json['issuer'],
      certificateUrl: json['certificate_url'],
      certificateImageUrl: json['certificate_image_url'],
    );
  }

  CertificationItem toEntity() {
    return CertificationItem(
      id: id,
      title: title,
      issuer: issuer,
      certificateUrl: certificateUrl,
      certificateImageUrl: certificateImageUrl,
    );
  }
}
