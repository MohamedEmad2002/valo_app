// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:untitled1/data/web_services/web_services.dart';

class RepoLayer {
  WebServices apiProvider;
  RepoLayer({
    required this.apiProvider,
  });

  Future<dynamic> getAgent() async{
    return apiProvider.getAgent();
  }
}
