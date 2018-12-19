class Language {
  final String icon;
  final String name;
  final String level;

  const Language({this.icon, this.name, this.level});

  Language.fromJson(jsonData)
      : icon = "assets/images/${jsonData['icon']}.png",
        name = jsonData['name'],
        level = jsonData['level'];
}
