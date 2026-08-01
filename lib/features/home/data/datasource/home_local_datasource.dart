import 'package:hive_flutter/hive_flutter.dart';
import 'package:myportfolioapp/features/home/data/datasource/home_datasource.dart';
import 'package:myportfolioapp/features/home/domain/entity/contact_info.dart';
import 'package:myportfolioapp/features/home/domain/entity/home_info.dart';

import '../models/contact_model.dart';
import '../models/home_info_model.dart';

class HomeLocalDataImpl implements HomeDatasource {
  Box box;
  HomeLocalDataImpl(this.box);
  @override
  Future<List<ContactInfo>> getContactInfo() async {
    List<ContactInfo> list = [];
    final response = box.get("contact_list", defaultValue: []);
    for (var v in response) {
      final model = ContactModel.fromJson(v);
      list.add(model.toEntity());
    }
    return list;
  }

  @override
  Future<HomeInfo?> getHomeInfo() async {
    final response = box.get("home_info", defaultValue: null);
    if (response == null) {
      return null;
    } else {
      var infoModels = HomeInfoModel.fromJson(response);
      return infoModels.toEntity();
    }
  }
}
