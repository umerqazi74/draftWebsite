import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../response/formation_response.dart';



class FormationDropdownScreen extends StatefulWidget {
  const FormationDropdownScreen({super.key});

  @override
  _FormationDropdownScreenState createState() => _FormationDropdownScreenState();
}

class _FormationDropdownScreenState extends State<FormationDropdownScreen> {
  Future<FormationResponse>? _futureFormationResponse;
  String? _selectedFormation;
  List<List<int>>? _selectedMatrix;

  @override
  void initState() {
    super.initState();
    _futureFormationResponse = fetchFormations();
  }

  Future<FormationResponse> fetchFormations() async {
    try {
      final response = await http.get(
        Uri.parse('https://fhgwe79cnd.us-east-1.awsapprunner.com/get_formation'),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        return FormationResponse.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to load formations');
      }
    } catch (e) {
      print('Error fetching data: $e');
      throw Exception('Failed to load formations');
    }
  }

  void _onFormationSelected(String? value, FormationResponse formationResponse) {
    setState(() {
      _selectedFormation = value;

      // Based on selected formation, update the matrix
      switch (value) {
        case '4-4-2':
          _selectedMatrix = formationResponse.l442?.first.formationMatrix;
          break;
        case '4-3-3R':
          _selectedMatrix = formationResponse.l433R?.first.formationMatrix;
          break;
        case '4-4-2D':
          _selectedMatrix = formationResponse.l442D?.first.formationMatrix;
          break;
        case '4-2-4':
          _selectedMatrix = formationResponse.l424?.first.formationMatrix;
          break;
        case '5-3-2':
          _selectedMatrix = formationResponse.l532?.first.formationMatrix;
          break;
        case '3-5-2':
          _selectedMatrix = formationResponse.l352?.first.formationMatrix;
          break;
        case '3-4-3':
          _selectedMatrix = formationResponse.l343?.first.formationMatrix;
          break;
        default:
          _selectedMatrix = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formation Selector'),
      ),
      body: FutureBuilder<FormationResponse>(
        future: _futureFormationResponse,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            FormationResponse formationResponse = snapshot.data!;

            return Column(
              children: [
                // Dropdown for formation selection
                DropdownButton<String>(
                  value: _selectedFormation,
                  hint: Text('Select a Formation'),
                  items: <String>[
                    '4-4-2',
                    '4-3-3R',
                    '4-4-2D',
                    '4-2-4',
                    '5-3-2',
                    '3-5-2',
                    '3-4-3',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    _onFormationSelected(value, formationResponse);
                  },
                ),

                // Display matrix rows
                _selectedMatrix == null
                    ? Container()
                    : Expanded(
                  child: ListView.builder(
                    itemCount: _selectedMatrix?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _selectedMatrix![index]
                              .map((value) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '$value',
                              style: TextStyle(fontSize: 18),
                            ),
                          ))
                              .toList(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}

class Formation {
  List<List<int>> formationMatrix;

  Formation(this.formationMatrix);

  factory Formation.fromJson(List<dynamic> json) {
    List<List<int>> matrix = json.map((row) => List<int>.from(row)).toList();
    return Formation(matrix);
  }

  List<dynamic> toJson() {
    return formationMatrix.map((row) => row.toList()).toList();
  }
}

class FormationResponse {
  List<Formation>? l442;
  List<Formation>? l433R;
  List<Formation>? l442D;
  List<Formation>? l424;
  List<Formation>? l532;
  List<Formation>? l352;
  List<Formation>? l343;

  FormationResponse({
    this.l442,
    this.l433R,
    this.l442D,
    this.l424,
    this.l532,
    this.l352,
    this.l343,
  });

  FormationResponse.fromJson(Map<String, dynamic> json) {
    if (json['4-4-2'] != null) {
      l442 = [Formation.fromJson(json['4-4-2'])];
    }
    if (json['4-3-3R'] != null) {
      l433R = [Formation.fromJson(json['4-3-3R'])];
    }
    if (json['4-4-2D'] != null) {
      l442D = [Formation.fromJson(json['4-4-2D'])];
    }
    if (json['4-2-4'] != null) {
      l424 = [Formation.fromJson(json['4-2-4'])];
    }
    if (json['5-3-2'] != null) {
      l532 = [Formation.fromJson(json['5-3-2'])];
    }
    if (json['3-5-2'] != null) {
      l352 = [Formation.fromJson(json['3-5-2'])];
    }
    if (json['3-4-3'] != null) {
      l343 = [Formation.fromJson(json['3-4-3'])];
    }
  }
}
