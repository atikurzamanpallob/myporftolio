// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:myportfolioapp/features/home/data/models/contact_model.dart';
import 'package:myportfolioapp/features/home/data/models/home_info_model.dart';
import 'package:myportfolioapp/features/home/domain/entity/contact_info.dart';
import 'package:myportfolioapp/features/home/domain/entity/home_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class HomeDatasource {
  Future<HomeInfo?> getHomeInfo();
  Future<List<ContactInfo>> getContactInfo();
}

class HomeDataSourceImp implements HomeDatasource {
  SupabaseClient client;
  HomeDataSourceImp(this.client);

  @override
  Future<List<ContactInfo>> getContactInfo() async {
    List<ContactInfo> list = [];
    final response = await client.from('contacts').select();
    response.forEach((v) {
      final model = ContactModel.fromJson(v);
      list.add(model.toEntity());
    });
    return list;
  }

  @override
  Future<HomeInfo?> getHomeInfo() async {
    final response = await client.from('home').select().single();
    var infoModels = HomeInfoModel.fromJson(response);
    return infoModels.toEntity();
  }
}
