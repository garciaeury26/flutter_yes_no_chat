import 'package:dio/dio.dart';
import 'package:yes_no_maiby/domain/entities/message.dart';
import 'package:yes_no_maiby/infrastructure/models/yes_no_model.dart';

class GetYesOrNo {
  final _dio = Dio();

  Future<Message> getData() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final data = YesOrNoModel.fromJsonMap(response.data);
    return Message(
        text: data.answer,
        fromWho: FromWho.her,
        imageUrl: data.image);
  }
}
