import 'package:space_app/screens/home/classes/models/planets_list.dart';

List<Planets> planets = getPlanets();

class StateService {
  static final List names = List.generate(4, (index) => planets[index].name);

  static List getSuggestions(String query) {
    final suggestions = names
        .where((name) => name.toLowerCase().contains(query.toLowerCase()))
        .map((name) => {
              "name": name,
              "color": planets[names.indexOf(name)].cardColor,
              "image": planets[names.indexOf(name)].image,
              "model": planets[names.indexOf(name)]
            })
        .toList();

    return suggestions;
  }
}
