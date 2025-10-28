// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'FlutterMaps';

  @override
  String get markerID => 'Monumento a la Revolución';

  @override
  String get alertDialogTitle => 'Añade un titulo para el marcador en el mapa';

  @override
  String get alertDialogHint => 'Casa de ...';

  @override
  String get alertDialogCancel => 'Cancelar';

  @override
  String get alertDialogSave => 'Guardar';
}
