class AttackModel {
  double? mild;
  double? moderate;
  double? no;
  double? proliferative;
  double? severe;

  AttackModel(
      {this.mild, this.moderate, this.no, this.proliferative, this.severe});

  AttackModel.fromJson({json}) {
    mild = json['Mild Heart Attack'];

    moderate = json['Moderate Heart Attack'];
    no = json['No Heart Attack'];
    proliferative = json['Proliferative Heart Attack'];
    severe = json['Severe Heart Attack'];
  }
}
