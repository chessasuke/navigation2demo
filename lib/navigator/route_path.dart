class TheAppPath {
  String id;
  final bool isUnknown;

  TheAppPath.home()
      : id = null,
        isUnknown = false;

  TheAppPath.details(this.id) : isUnknown = false;

  TheAppPath.unknown()
      : id = null,
        isUnknown = true;

  bool get isDetailsPage => id != null;

  bool get isHomePage => id == null && isUnknown == false;

  bool get isUnknownPage => isUnknown;
}
