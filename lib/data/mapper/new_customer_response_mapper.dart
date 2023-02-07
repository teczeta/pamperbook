

class NewCustomerResponseMapper{
  bool? _error;
  bool? _showLoader;
  int? _code;
  String? _message;


  NewCustomerResponseMapper(int? code, bool? error, String? message,bool showLoader){
    _error = error;
    _code = code;
    _message = message;
    _showLoader = showLoader;
  }

  bool? get showLoader => _showLoader;

  int? get code => _code;

  String? get message => _message;

  bool? get error => _error;



}