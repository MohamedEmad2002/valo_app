import 'package:http/http.dart' as http;

import '../../constant/constants.dart';

class WebServices{
  Future<dynamic> getAgent() async{
    final response =await http.get(Uri.parse(api));
    return response;
  }
}