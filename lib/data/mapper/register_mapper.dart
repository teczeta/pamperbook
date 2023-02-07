
class RegisterMapper {
  bool? _error;
  bool? _showLoader;
  String? _intialCountryValue;
  int? _code;
  String? _message;


  RegisterMapper({int? code, bool? error, String? message, bool? showLoader,String? initialCountryValue}) {
    _error = error;
    _code = code;
    _message = message;
    _showLoader = showLoader;
    _intialCountryValue = initialCountryValue;
  }

  bool? get showLoader => _showLoader;

  int? get code => _code;

  String? get message => _message;

  bool? get error => _error;

  String? get initialCountryValue => _intialCountryValue;

  RegisterMapper copyWith({
    int? code,
    bool? error,
    String? message,
    bool? showLoader,
    String? initialCountryValue
  }) =>
  RegisterMapper(

    code: code ?? _code,
    error: error ?? _error,
    message: message ?? _message,
    showLoader: showLoader ?? _showLoader,
    initialCountryValue: initialCountryValue ?? _intialCountryValue
  );
}