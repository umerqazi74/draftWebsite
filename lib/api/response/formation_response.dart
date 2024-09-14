class FormationResponse {
  List<Formation>? l442;
  List<Formation>? l433R;
  List<Formation>? l442D;
  List<Formation>? l424;
  List<Formation>? l532;
  List<Formation>? l352;
  List<Formation>? l343;
  bool? error;
  String? errorMsg;

  FormationResponse({
    this.l442,
    this.l433R,
    this.l442D,
    this.l424,
    this.l532,
    this.l352,
    this.l343,
    this.error,
    this.errorMsg,
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
    error = json['error'];
    errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (l442 != null) {
      data['4-4-2'] = l442!.map((v) => v.toJson()).toList();
    }
    if (l433R != null) {
      data['4-3-3R'] = l433R!.map((v) => v.toJson()).toList();
    }
    if (l442D != null) {
      data['4-4-2D'] = l442D!.map((v) => v.toJson()).toList();
    }
    if (l424 != null) {
      data['4-2-4'] = l424!.map((v) => v.toJson()).toList();
    }
    if (l532 != null) {
      data['5-3-2'] = l532!.map((v) => v.toJson()).toList();
    }
    if (l352 != null) {
      data['3-5-2'] = l352!.map((v) => v.toJson()).toList();
    }
    if (l343 != null) {
      data['3-4-3'] = l343!.map((v) => v.toJson()).toList();
    }
    data['error'] = error;
    data['errorMsg'] = errorMsg;
    return data;
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

