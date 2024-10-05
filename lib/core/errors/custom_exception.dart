enum ExceptionType {
  ConnectionError,
  // related to http status code exceptions
  NotAuthorized,
  NotAuthenticated,
  NotFound,
  InternalServerException,
  ServiceUnavailableException,
  PageGone,
  ResourceAlreadyExists,
  UnAcceptableOperation,

  // related to bad request status code
  // related to auth requests
  EmailAlreadyExists,
  UserNameAlreadyExists,
  PasswordInvalid,
  InvalidCredentials,
  VerifyTokenInvalid,
  ResetCodeInvalid,
  InvalidResetToken,

  // SQL Lite Exceptions

  duplicatedIdEntry,
  duplicatedColumnName,
  tableNotFound,
  duplicateColumn,
  dataBaseClose,
  columnShouldNotNull,
  syntaxError,

  validationError,

  // socket exception

  // other
  Other,
}

class GenericException implements Exception {
  ExceptionType type;
  String errorMessage;
  GenericException({required this.type, this.errorMessage = "Unknown Error"});

  @override
  String toString() {
    return errorMessage;
  }
}

class ValidationError extends GenericException {
  String fieldName;
  ValidationError({required this.fieldName})
      : super(
          type: ExceptionType.validationError,
          errorMessage: "$fieldName is required",
        );
}

Map<String, GenericException> badRequestException = {
  "RESOURCE_ALREADY_EXISTS": GenericException(
    type: ExceptionType.EmailAlreadyExists,
    errorMessage: "email_already_exists",
  ),
  "USERNAME_ALREADY_EXISTS": GenericException(
    type: ExceptionType.UserNameAlreadyExists,
    errorMessage: "username_already_exists",
  ),
  "PASSWORD_INVALID": GenericException(
    type: ExceptionType.PasswordInvalid,
    errorMessage: "invalid_password",
  ),
  "INVALID_CREDENTIALS": GenericException(
    type: ExceptionType.InvalidCredentials,
    errorMessage: "invalid_credentials",
  ),
  "VERIFY_TOKEN_INVALID": GenericException(
    type: ExceptionType.VerifyTokenInvalid,
    errorMessage: "invalid_verify_token",
  ),
  "RESET_CODE_INVALID": GenericException(
    type: ExceptionType.ResetCodeInvalid,
    errorMessage: "invalid_reset_code",
  ),
  "INVALID_RESET_TOKEN": GenericException(
    type: ExceptionType.InvalidResetToken,
    errorMessage: "invalid_reset_token",
  ),
  "NOT_VERIFIED": GenericException(
    //*********add***********
    type: ExceptionType.InvalidResetToken,
    errorMessage: "User is not verified",
  ),
  "UN_ACCEPTABLE_OPERATION": GenericException(
    type: ExceptionType.UnAcceptableOperation,
    errorMessage: "un_acceptable_operation",
  ),
  "RESOURCE_NOT_FOUND": GenericException(
    type: ExceptionType.NotFound,
    errorMessage: "resource_not_found",
  ),
  "INTERNAL_SERVER_ERROR": GenericException(
    type: ExceptionType.InternalServerException,
    errorMessage: "internal_error",
  ),
  "NOT_AUTHENTICATED": GenericException(
    type: ExceptionType.NotAuthenticated,
    errorMessage: "not_authenticated",
  ),
  "NOT_AUTHORIZED": GenericException(
    type: ExceptionType.NotAuthorized,
    errorMessage: "you_are_not_authorized",
  ),
};

Map<int, GenericException> statusCodesException = {
  401: GenericException(
    type: ExceptionType.NotAuthorized,
    errorMessage: "you_are_not_authorized",
  ),
  404: GenericException(
    type: ExceptionType.NotFound,
    errorMessage: "page_not_found",
  ),
  410: GenericException(
    type: ExceptionType.PageGone,
    errorMessage: "page_gone",
  ),
  500: GenericException(
    type: ExceptionType.InternalServerException,
    errorMessage: "server_down",
  ),
  503: GenericException(
    type: ExceptionType.ServiceUnavailableException,
    errorMessage: "service_unavailable",
  ),
};
