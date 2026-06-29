// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get internalServerError =>
      'Algo salió mal de nuestro lado. Por favor, inténtalo de nuevo más tarde o contacta al soporte si el problema persiste.';

  @override
  String get badRequestError =>
      'La solicitud está mal formada o contiene datos inválidos. Por favor, verifica tu entrada e inténtalo de nuevo.';

  @override
  String get notFoundError =>
      'El recurso solicitado no pudo encontrarse. Puede que haya sido eliminado o que nunca haya existido.';

  @override
  String get invalidCredentialsError =>
      'El correo electrónico o la contraseña que ingresaste son incorrectos. Verifícalos e inténtalo de nuevo.';

  @override
  String get nameIsTooShortError =>
      'El nombre ingresado es muy corto. Por favor, usa al menos el número mínimo de caracteres requeridos.';

  @override
  String get nameIsTooLongError =>
      'El nombre ingresado supera la longitud máxima permitida. Por favor, acórtalo e inténtalo de nuevo.';

  @override
  String get biographyIsTooLongError =>
      'La biografía ingresada supera la longitud máxima permitida. Por favor, acórtala e inténtalo de nuevo.';

  @override
  String get invalidEmailError =>
      'La dirección de correo ingresada no es válida. Por favor, ingresa un correo con formato correcto (ej. usuario@ejemplo.com).';

  @override
  String get weakPasswordError =>
      'Tu contraseña es muy débil. Usa una combinación de letras mayúsculas, minúsculas, números y caracteres especiales.';

  @override
  String get userAlreadyExistsError =>
      'Ya existe una cuenta con este correo electrónico. Intenta iniciar sesión en su lugar o usa un correo diferente para registrarte.';

  @override
  String get outOfStockError =>
      'Este producto actualmente está agotado. Por favor, revisa más tarde o elige un producto diferente.';

  @override
  String get unauthorizedError =>
      'No tienes permiso para realizar esta acción. Por favor, inicia sesión con la cuenta correcta.';

  @override
  String get loginSubtitle =>
      'Inicia sesión en la aplicación para comenzar a realizar actividades.';

  @override
  String get email => 'Correo electrónico';

  @override
  String get password => 'Contraseña';

  @override
  String get name => 'Nombre';

  @override
  String get loginAction => 'Acceso';

  @override
  String get forgotYourPassword => '¿Olvidaste tu contraseña?';

  @override
  String get or => 'o';

  @override
  String get noAccountQuestion => '¿No tienes cuenta?';

  @override
  String get hasAccountQuestion => '¿Ya tienes cuenta?';

  @override
  String get signUp => 'Registrarse';

  @override
  String get signIn => 'Iniciar sesión';

  @override
  String get defaultErrorMessage => 'Se ha producido un error.';

  @override
  String get dismiss => 'Descartar';
}
