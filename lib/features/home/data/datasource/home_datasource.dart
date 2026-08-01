import 'package:myportfolioapp/features/home/domain/entity/contact_info.dart';
import 'package:myportfolioapp/features/home/domain/entity/home_info.dart';

abstract class HomeDatasource {
  Future<HomeInfo?> getHomeInfo();
  Future<List<ContactInfo>> getContactInfo();
}
