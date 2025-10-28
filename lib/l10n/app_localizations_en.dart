// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'FlutterMaps';

  @override
  String get markerID => 'Monument to the Revolution';

  @override
  String get alertDialogTitle => 'Add a title for the marker on the map';

  @override
  String get alertDialogHint => 'House of ...';

  @override
  String get alertDialogCancel => 'Cancel';

  @override
  String get alertDialogSave => 'Save';
}
