import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PlayersDataRepository {
  bool? isDraftPage;
  PlayersDataRepository({this.isDraftPage});

  Future getPlayersData() async {
    try {
      bool isDraft = isDraftPage??false;
      // await storeWalletValue("0xD5037920E24bc0862580C445162C194e07Ef80f8");
      String userWalletAddress = await loadWalletValue();

      var apiUrl = "https://fhgwe79cnd.us-east-1.awsapprunner.com/get_players/";

      if(!isDraft){
        apiUrl = "https://fhgwe79cnd.us-east-1.awsapprunner.com/get_account_players/";
      }


      // final headers = {
      //   'UserAddress': '0xD5037920E24bc0862580C445162C194e07Ef80f8',
      // };

      final headers = {
        'UserAddress': isDraft?"":userWalletAddress,
      };

      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers
      );


      if (response.statusCode == 200) {
        final responseResult = json.decode(response.body);
        print(responseResult);
        return responseResult;
      } else {
        return {
          "error": true,
          "error_msg": "Error : ${response.statusCode} code",
        };
      }
    } catch (e) {
      print("Catch Running");
      return {
        "error": true,
        "error_msg": "No Internet Connection!",
      };
    }
  }

  Future<void> storeWalletValue(String userWalletAddress) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userWalletAddress', userWalletAddress);
  }

  Future<String> loadWalletValue() async {
    final prefs = await SharedPreferences.getInstance();

    String userWalletAddress = prefs.getString('userWalletAddress') ?? "";
    return userWalletAddress;
  }


}
