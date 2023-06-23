import 'package:flutter/material.dart';

import '../models/planets_list.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Planets> _models = [];
  List<Planets> get model => _models;

  void toggleFavorite(Planets model) {
    final isExist = _models.contains(model);
    if (isExist) {
      _models.remove(model);
    } else {
      _models.add(model);
    }
    notifyListeners();
  }

  bool isExist(Planets model) {
    final isExist = _models.contains(model);
    return isExist;
  }
}
