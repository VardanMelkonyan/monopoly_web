class PropertyModel {
  final int id;
  final String title;

  PropertyModel({this.id, this.title});

  @override
  String toString() {
    return title;
  }

  @override
  int get hashCode => super.hashCode;

  @override
  bool operator ==(Object other) {
    if (super != other) return false;
    PropertyModel o = other;
    return o.id == this.id;
  }
}
