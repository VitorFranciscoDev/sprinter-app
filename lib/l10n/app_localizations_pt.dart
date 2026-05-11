// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get internalServerError =>
      'Algo deu errado do nosso lado. Tente novamente mais tarde ou entre em contato com o suporte se o problema persistir.';

  @override
  String get badRequestError =>
      'A requisição está malformada ou contém dados inválidos. Verifique os dados enviados e tente novamente.';

  @override
  String get notFoundError =>
      'O recurso solicitado não pôde ser encontrado. Ele pode ter sido excluído ou nunca existiu.';

  @override
  String get invalidCredentialsError =>
      'O e-mail ou senha informados estão incorretos. Verifique e tente novamente.';

  @override
  String get nameIsTooShortError =>
      'O nome informado é muito curto. Use pelo menos o número mínimo de caracteres exigido.';

  @override
  String get nameIsTooLongError =>
      'O nome informado excede o comprimento máximo permitido. Encurte-o e tente novamente.';

  @override
  String get biographyIsTooLongError =>
      'A biografia informada excede o comprimento máximo permitido. Encurte-a e tente novamente.';
  
  @override
  String get invalidEmailError =>
      'O endereço de e-mail informado não é válido. Insira um e-mail com formato correto (ex: usuario@exemplo.com).';

  @override
  String get weakPasswordError =>
      'Sua senha é muito fraca. Use uma combinação de letras maiúsculas, minúsculas, números e caracteres especiais.';

  @override
  String get userAlreadyExistsError =>
      'Já existe uma conta com este e-mail. Tente fazer login ou use um e-mail diferente para se cadastrar.';
}
