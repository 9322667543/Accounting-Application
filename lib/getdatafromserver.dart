// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart';

import 'constants.dart' as constant;


Future<String> getdata(String apidetails, Map Jsonbody) async {
  var response;
  try {
    var url = constant.baseurl + apidetails;
    response= await post(Uri.parse(url), body: Jsonbody);

  
  } catch (ex) {
    print(ex);
  }
    return response.body;
}
