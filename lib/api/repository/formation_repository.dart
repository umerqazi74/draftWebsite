import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class FormationRepository{

  Future getFormationData() async {

    final prefs = await SharedPreferences.getInstance();
    String userWalletAddress = prefs.getString('userWalletAddress') ?? "";

    const String url = 'https://fhgwe79cnd.us-east-1.awsapprunner.com/get_formation';

    // Define the headers
    Map<String, String> headers = {
      "UserAddress": userWalletAddress,
      "Content-Type": 'application/json',
    };

    try {
      // Send the GET request
      final http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Parse the JSON response
        Map<String, dynamic> responseResult = jsonDecode(response.body);
        // Convert the JSON to a TeamData object
        // TeamDataModel teamData = TeamDataModel.fromJson(jsonData);
        print('Team data fetched successfully');
        return responseResult;

      } else {
        return {
          "error": true,
          "errorMsg": "Error : ${response.statusCode} code",
        };
      }
    } catch (e) {
      return {
        "error": true,
        "errorMsg": "Please check your internet connection!",
      };
    }
  }

  Future saveFormationData(List<List<String>> selectedMatrix, String selectedFormation) async {

    final prefs = await SharedPreferences.getInstance();
    String userWalletAddress = prefs.getString('userWalletAddress') ?? "";

    const String url = 'https://fhgwe79cnd.us-east-1.awsapprunner.com/save_formation/';

    // Define the headers
    Map<String, String> headers = {
      "UserAddress": userWalletAddress,  // Passing actual userWalletAddress value here
      "Content-Type": 'application/json',
    };


    String jsonBody = json.encode(selectedMatrix);
    try {
      // Send the POST request
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonBody,  // Encoding the body as JSON
      );


      // Check if the request was successful
      if (response.statusCode == 200) {
        // Parse the JSON response
        Map<String, dynamic> responseResult = jsonDecode(response.body);

        return responseResult;

      } else {
        return {
          "error": true,
          "errorMsg": "Error : ${response.statusCode} code",
        };
      }
    } catch (e) {
      return {
        "error": true,
        "errorMsg": "Please check your internet connection!",
      };
    }
  }

  }
