import 'package:hive/hive.dart';
import 'package:myportfolioapp/core/utils/time_formatter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entity/contact_info.dart';
import '../../domain/entity/home_info.dart';
import '../models/contact_model.dart';
import '../models/home_info_model.dart';
import 'home_datasource.dart';

class HomeRemoteDataImp implements HomeDatasource {
  SupabaseClient client;
  Box box;
  HomeRemoteDataImp(this.client, this.box);

  @override
  Future<List<ContactInfo>> getContactInfo() async {
    List<ContactInfo> list = [];
    final response = await client
        .from('contacts')
        .select()
        .order('id', ascending: true);

    await box.put("contact_list", {
      "timestamp": TimeFormatter.getTimestamp(),
      "response": response.map((e) => Map<String, dynamic>.from(e)).toList(),
    });

    for (var v in response) {
      final model = ContactModel.fromJson(v);
      list.add(model.toEntity());
    }
    return list;
  }

  @override
  Future<HomeInfo?> getHomeInfo() async {
    final response = await client.from('home').select().single();
    await box.put("home_info", {
      "timestamp": TimeFormatter.getTimestamp(),
      "response": Map<String, dynamic>.from(response),
    });
    var infoModels = HomeInfoModel.fromJson(response);
    return infoModels.toEntity();
  }
}
