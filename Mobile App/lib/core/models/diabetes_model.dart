class DiabetesModel {
  double? mild;
  double? moderate;
  double? no;
  double? proliferative;
  double? severe;

  DiabetesModel(
      {this.mild, this.moderate, this.no, this.proliferative, this.severe});

  DiabetesModel.fromJson({json}) {
    mild = json['Mild Diabetes'];
    moderate = json['Moderate Diabetes'];
    no = json['No Diabetes'];
    proliferative = json['Proliferative Diabetes'];
    severe = json['Severe Diabetes'];
  }
}
