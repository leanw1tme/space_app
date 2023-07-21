class Models {
  String name;
  String aniImage;
  String image;
  String subtitle;
  String description;

  Models(this.name, this.aniImage, this.image, this.subtitle, this.description);
}

List<Models> getPlanets() {
  List<Models> listModels = [];
  listModels.add(Models(
      'Mother Earth',
      'assets/ani/riv/earth.riv',
      'assets/img/Earth.svg',
      'The Jewel of the Solar System',
      'Earth is the third planet from the sun and the only known planet to support life. It has a diameter of 12,742 km.'));
  listModels.add(Models(
    'Venus',
    'assets/ani/riv/venus.riv',
    'assets/img/Venus.svg',
    'The Jewel of the Solar System',
    "Venus is the second planet from the sun and is often referred to as the Earth's sister planet.",
  ));
  listModels.add(Models(
    'Mars',
    'assets/ani/riv/mars.riv',
    'assets/img/Mars.svg',
    'The Jewel of the Solar System',
    'Mars is the fourth planet from the sun and the second smallest planet in our solar system.',
  ));
  listModels.add(Models(
    'Uranus',
    'assets/ani/riv/uranus.riv',
    'assets/img/Uranus.svg',
    'The Jewel of the Solar System',
    'Uranus is the seventh planet from the Sun and the third-largest planet in the Solar System.',
  ));
  return listModels.toList();
}
