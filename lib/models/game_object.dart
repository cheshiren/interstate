class GameObject {
  String id;
  String name;
  String nameA;
  dynamic description;
  List<Map> actions;
  List<String> scenes;
  bool hidden;
  Map<String, dynamic> states;
  int counter;
  Map<String, Function> daemon;

  GameObject({
    this.id = '',
    this.scenes = const [],
    this.name = '',
    this.nameA = '',
    this.description = '',
    this.actions = const [],
    this.hidden = true,
    this.states = const {},
    this.counter = 0,
    this.daemon = const {},
  });
}
