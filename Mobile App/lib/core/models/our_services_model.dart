class OurServicesModel {
  late String title;
  late String iconPath;
  late String route;

  OurServicesModel(
      {required this.iconPath, required this.title, required this.route});

  OurServicesModel.fromJson({json}) {
    title = json['title'];
    iconPath = json['icon'];
    route = json['route'];
  }
}
