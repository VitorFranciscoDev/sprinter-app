/// Represents authentication-related errors that can occur during user authentication flows
enum AuthenticationError {
  /// A generic server-side failure occurred
  internalServerError,

  /// The request was malformed or contained invalid parameters
  badRequestError,

  /// The requested resource or user account could not be found
  notFoundError,

  /// The provided credentials do not match the account
  invalidCredentialsError,

  /// The provided name is too short
  nameIsTooShortError,

  /// The provided name is too long
  nameIsTooLongError,

  /// The email address provided is not in a valid format
  invalidEmailError,

  /// The password does not meet minimum security requirements
  weakPasswordError,

  /// An account with this email address already exists
  userAlreadyExistsError,
}