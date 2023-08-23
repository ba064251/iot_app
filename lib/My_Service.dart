import 'package:http/http.dart' as http;


class MyService{

  static Future<dynamic> fetch()async{

    try{
      var request = http.Request('GET', Uri.parse('http://tazzz.codetech.pk/Api/All-reading.php?'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var res = await response.stream.bytesToString();
        return res;
      }
      else {
        print(response.reasonPhrase);
        return 0;
      }
    }catch(ex){
      print("${ex.toString()}");
    }

  }

}