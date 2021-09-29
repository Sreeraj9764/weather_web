
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServiceApi {
  ServiceApi({this.url});
  String url;

Future GetApi()async{
  http.Response response=await http.get(Uri.parse(url),
  );

  if(response.statusCode==200){
    String data=response.body;
    var Dcodedata=jsonDecode(data);
    return Dcodedata;
  }
  else{
    print(response.body.toString()+ "error");
  }

}
}

 // 'https://api.openweathermap.org/data/2.5/weather?lat=$lattitude&lon=$longitude&appid=3c4788da2b03af149027d5dd053b0f13')