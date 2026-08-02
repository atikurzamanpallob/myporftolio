import 'package:hive_flutter/hive_flutter.dart';
import 'package:myportfolioapp/core/utils/time_formatter.dart';
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
    final ob = box.get(
      "contact_list",
      defaultValue: {"timestamp": null, "response": []},
    );

    if (ob['timestamp'] == null ||
        TimeFormatter.difference(ob['timestamp']) > 10) {
      return [];
    } else {
      for (var v in ob["response"]) {
        final model = ContactModel.fromJson(v);
        list.add(model.toEntity());
      }
      return list;
    }
  }

  @override
  Future<HomeInfo?> getHomeInfo() async {
    final ob = box.get(
      "home_info",
      defaultValue: {"timestamp": null, "response": null},
    );

    if (ob['timestamp'] == null ||
        TimeFormatter.difference(ob['timestamp']) > 10 ||
        ob['response'] == null) {
      return null;
    } else {
      var infoModels = HomeInfoModel.fromJson(ob['response']);
      return infoModels.toEntity();
    }
  }
}
