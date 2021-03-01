class TheAppPath {
  String id;
  final bool isUnknown;
  final bool isSettings;
  final bool isTesting;

  TheAppPath.home()
      : id = null,
        isUnknown = false,
        isSettings = false,
        isTesting = false;

  TheAppPath.details(this.id)
      : isUnknown = false,
        isSettings = false,
        isTesting = false;

  TheAppPath.settings()
      : id = null,
        isUnknown = false,
        isSettings = true,
        isTesting = false;

  TheAppPath.testing()
      : id = null,
        isUnknown = false,
        isSettings = false,
        isTesting = true;

  TheAppPath.unknown()
      : id = null,
        isUnknown = true,
        isSettings = false,
        isTesting = false;

  bool get isDetailsPage => id != null;

  bool get isUnknownPage =>
      isUnknown == true && isSettings == false && isTesting == false;

  bool get isSettingsPage =>
      isSettings == true && isUnknown == false && isTesting == false;

  bool get isTestingPage =>
      isTesting == true && isUnknown == false && isSettings == false;

  bool get isHomePage =>
      id == null &&
      isUnknown == false &&
      isSettings == false &&
      isTesting == false;
}
