class BusinessDetailsMapper {
  BusinessDetailsMapper({
      bool? error, 
      int? code, 
      String? message, 
      String? initialValue, 
      bool? showLoader,}){
    _error = error;
    _code = code;
    _message = message;
    _initialValue = initialValue;
    _showLoader = showLoader;
}

  bool? _error;
  int? _code;
  String? _message;
  String? _initialValue;
  bool? _showLoader;
BusinessDetailsMapper copyWith({  bool? error,
  int? code,
  String? message,
  String? initialValue,
  bool? showLoader,
}) => BusinessDetailsMapper(  error: error ?? _error,
  code: code ?? _code,
  message: message ?? _message,
  initialValue: initialValue ?? _initialValue,
  showLoader: showLoader ?? _showLoader,
);
  bool? get error => _error;
  int? get code => _code;
  String? get message => _message;
  String? get initialValue => _initialValue;
  bool? get showLoader => _showLoader;


}