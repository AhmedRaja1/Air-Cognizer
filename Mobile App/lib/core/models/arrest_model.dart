class ArrestModel {
  double? mild;
  double? moderate;
  double? no;
  double? proliferative;
  double? severe;

  ArrestModel(
      {this.mild, this.moderate, this.no, this.proliferative, this.severe});

  ArrestModel.fromJson({json}) {
    mild = json['Mild Cardiac Arrest'];
    moderate = json['Moderate Cardiac Arrest'];
    no = json['No Cardiac Arrest'];
    proliferative = json['Proliferative Cardiac Arrest'];
    severe = json['Severe Cardiac Arrest'];
  }
}
