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
    final ob = Map<String, dynamic>.from(
      box.get(
        "contact_list",
        defaultValue: {"timestamp": null, "response": []},
      ),
    );
    if (TimeFormatter.difference(ob['timestamp']) > 10) {
      return [];
    } else {
      for (var v in ob["response"]) {
        final model = ContactModel.fromJson(Map<String, dynamic>.from(v));
        list.add(model.toEntity());
      }
      return list;
    }
  }

  @override
  Future<HomeInfo?> getHomeInfo() async {
    final ob = Map<String, dynamic>.from(
      box.get("home_info", defaultValue: {"timestamp": null, "response": null}),
    );
    if (TimeFormatter.difference(ob['timestamp']) > 10) {
      return null;
    } else {
      var infoModels = HomeInfoModel.fromJson(
        Map<String, dynamic>.from(ob['response']),
      );
      return infoModels.toEntity();
    }
  }
}
