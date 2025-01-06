import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:healthcare_360_mobile/core/models/our_services_model.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';

class MenuViewModel with ChangeNotifier {
  static const _filePath = 'assets/services.json';

  // ignore: prefer_final_fields
  List<OurServicesModel> _ourServices = [];
  List<OurServicesModel> get ourServices => _ourServices;

  _loadJsonData() async {
    final body = await rootBundle.loadString(_filePath);
    final file = await jsonDecode(body);
    List _servicesList = file['services'];
    if (_servicesList.isNotEmpty) {
      // ignore: avoid_function_literals_in_foreach_calls
      _servicesList.forEach((json) {
        _ourServices.add(OurServicesModel.fromJson(json: json));
      });
      log('Loaded Data: ' + _servicesList.length.toString());
      notifyListeners();
    }
  }

  MenuViewModel() {
    _loadJsonData();
  }
}
