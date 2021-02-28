class TheAppPath {
  String id;
  final bool isUnknown;
  final bool isSettings;

  TheAppPath.home()
      : id = null,
        isUnknown = false,
        isSettings = false;

  TheAppPath.details(this.id)
      : isUnknown = false,
        isSettings = false;

  TheAppPath.settings()
      : isUnknown = false,
        isSettings = true;

  TheAppPath.unknown()
      : id = null,
        isUnknown = true,
        isSettings = false;

  bool get isDetailsPage => id != null;

  bool get isHomePage => id == null && isUnknown == false;

  bool get isUnknownPage => isUnknown;

  bool get isSettingsPage => isSettings;
}
