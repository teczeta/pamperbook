import 'dart:convert';
/// error : false
/// code : 2000
/// message : "Success"
/// data : {"appointments":[{"id":2,"appointment_time":"Tue, 28th Apr 2020, 09:04 AM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Test Customer-PERM-MOB"},{"id":4,"appointment_time":"Sat, 2nd May 2020, 09:05 AM","service_name":"Standard Haircut","status":"CANCELLED","customer_name":"Hulk Hogan"},{"id":9,"appointment_time":"Mon, 4th May 2020, 10:05 PM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":10,"appointment_time":"Mon, 4th May 2020, 09:05 PM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":11,"appointment_time":"Tue, 5th May 2020, 07:05 AM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":12,"appointment_time":"Tue, 5th May 2020, 08:05 AM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":13,"appointment_time":"Mon, 4th May 2020, 10:05 AM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":14,"appointment_time":"Mon, 4th May 2020, 11:05 AM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":15,"appointment_time":"Mon, 4th May 2020, 04:05 PM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Margaret Thatcher"},{"id":16,"appointment_time":"Tue, 5th May 2020, 08:05 AM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Margaret Thatcher"},{"id":18,"appointment_time":"Thu, 7th May 2020, 08:05 AM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Margaret Thatcher"},{"id":22,"appointment_time":"Wed, 27th May 2020, 10:05 AM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":23,"appointment_time":"Thu, 7th May 2020, 10:05 PM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":24,"appointment_time":"Thu, 21st May 2020, 12:05 PM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":25,"appointment_time":"Mon, 18th May 2020, 09:05 AM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"Kate Jones"},{"id":26,"appointment_time":"Mon, 25th May 2020, 01:05 PM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"Test Customer-PERM-EMAIL"},{"id":33,"appointment_time":"Mon, 25th May 2020, 10:05 AM","service_name":"Cut & Blow Dry","status":"CANCELLED","customer_name":"Some Customer"},{"id":35,"appointment_time":"Tue, 26th May 2020, 11:05 AM","service_name":"Cut & Blow Dry","status":"CANCELLED","customer_name":"Margaret Thatcher"},{"id":36,"appointment_time":"Tue, 26th May 2020, 11:05 AM","service_name":"Cut & Blow Dry","status":"CANCELLED","customer_name":"Margaret Thatcher"},{"id":37,"appointment_time":"Tue, 26th May 2020, 11:05 AM","service_name":"Cut & Blow Dry","status":"CANCELLED","customer_name":"Margaret Thatcher"},{"id":48,"appointment_time":"Mon, 24th Aug 2020, 12:08 PM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"Margaret Thatcher"},{"id":49,"appointment_time":"Mon, 29th Jun 2020, 02:06 PM","service_name":"Cut & Blow Dry","status":"PENDING","customer_name":"Margaret Thatcher"},{"id":50,"appointment_time":"Mon, 8th Jun 2020, 10:06 AM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":51,"appointment_time":"Sat, 13th Jun 2020, 09:06 AM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"Braden Holtby"},{"id":52,"appointment_time":"Mon, 22nd Jun 2020, 01:06 PM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"test customer"},{"id":159,"appointment_time":"Thu, 18th Jun 2020, 10:06 AM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"Margaret Thatcher"},{"id":162,"appointment_time":"Mon, 15th Jun 2020, 10:06 AM","service_name":"Cut & Blow Dry","status":"PENDING","customer_name":"John Major"},{"id":166,"appointment_time":"Tue, 23rd Jun 2020, 11:06 AM","service_name":"Cut & Blow Dry","status":"PENDING","customer_name":"Margaret Thatcher"},{"id":171,"appointment_time":"Tue, 23rd Jun 2020, 01:06 PM","service_name":"Cut & Blow Dry","status":"PENDING","customer_name":"John Major"},{"id":172,"appointment_time":"Sat, 20th Jun 2020, 06:06 PM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Test Customer-PERM-EMAIL"},{"id":174,"appointment_time":"Thu, 9th Jul 2020, 07:07 PM","service_name":"Cut & Blow Dry","status":"CANCELLED","customer_name":"Hulk Hogan"},{"id":175,"appointment_time":"Thu, 18th Jun 2020, 07:06 AM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"John Major"},{"id":183,"appointment_time":"Fri, 12th Jun 2020, 05:06 PM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Braden Holtby"},{"id":220,"appointment_time":"Tue, 16th Jun 2020, 04:06 PM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"Carol Bramwell"},{"id":1091,"appointment_time":"Thu, 16th Jul 2020, 08:07 AM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"Carol Bramwell"},{"id":1092,"appointment_time":"Sat, 18th Jul 2020, 11:07 AM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"John Major"},{"id":2101,"appointment_time":"Fri, 31st Jul 2020, 10:07 AM","service_name":"Cut & Colour","status":"CONFIRMED","customer_name":"Carol Bramwell"},{"id":23562,"appointment_time":"Mon, 15th Mar 2021, 10:03 AM","service_name":"Standard Haircut","status":"CANCELLED","customer_name":"Hulk Hogan"},{"id":25040,"appointment_time":"Thu, 18th Mar 2021, 11:03 AM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":26740,"appointment_time":"Mon, 22nd Mar 2021, 05:03 PM","service_name":"HD","status":"PENDING","customer_name":"John Major"},{"id":26744,"appointment_time":"Mon, 5th Apr 2021, 02:04 PM","service_name":"HD","status":"CANCELLED","customer_name":"Margaret Thatcher"},{"id":26772,"appointment_time":"Fri, 30th Apr 2021, 03:04 PM","service_name":"HD","status":"CANCELLED","customer_name":"test customer"},{"id":27499,"appointment_time":"Sun, 28th Mar 2021, 07:03 PM","service_name":"Cut & Blow Dry","status":"CANCELLED","customer_name":"Hulk Hogan"},{"id":28021,"appointment_time":"Wed, 24th Mar 2021, 09:03 AM","service_name":"Cut & Colour","status":"CONFIRMED","customer_name":"Margaret Thatcher"},{"id":36675,"appointment_time":"Thu, 15th Apr 2021, 04:04 PM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"John Major"},{"id":36677,"appointment_time":"Thu, 15th Apr 2021, 04:04 PM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"Margaret Thatcher"},{"id":36686,"appointment_time":"Thu, 15th Apr 2021, 03:04 PM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"John Major"},{"id":42350,"appointment_time":"Fri, 23rd Apr 2021, 09:04 AM","service_name":"Cut & Colour","status":"CONFIRMED","customer_name":"Carol Bramwell"},{"id":42352,"appointment_time":"Fri, 23rd Apr 2021, 12:04 PM","service_name":"HD","status":"CONFIRMED","customer_name":"Carol Bramwell"},{"id":42407,"appointment_time":"Thu, 22nd Apr 2021, 05:04 PM","service_name":"Cut & Colour","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":53586,"appointment_time":"Mon, 10th May 2021, 02:05 PM","service_name":"Gent's Haircut","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":53589,"appointment_time":"Mon, 10th May 2021, 02:05 PM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"John Major"},{"id":53591,"appointment_time":"Mon, 10th May 2021, 02:05 PM","service_name":"Cut & Colour","status":"CONFIRMED","customer_name":"Kate Jones"},{"id":54757,"appointment_time":"Tue, 11th May 2021, 08:05 PM","service_name":"HD","status":"CANCELLED","customer_name":"John Major"},{"id":54758,"appointment_time":"Tue, 11th May 2021, 08:05 PM","service_name":"Skin Fade","status":"CONFIRMED","customer_name":"Margaret Thatcher"},{"id":84194,"appointment_time":"Mon, 28th Jun 2021, 10:06 AM","service_name":"Gent's Haircut","status":"CONFIRMED","customer_name":"Marc-Andre Fleury"},{"id":85135,"appointment_time":"Mon, 28th Jun 2021, 12:06 PM","service_name":"Skin Fade","status":"PENDING","customer_name":"William Karlsson"},{"id":98985,"appointment_time":"Mon, 19th Jul 2021, 09:07 AM","service_name":"Quick Pluck","status":"PENDING","customer_name":"Matt Kirwan"},{"id":98988,"appointment_time":"Mon, 19th Jul 2021, 09:07 AM","service_name":"Quick Pluck","status":"CANCELLED","customer_name":"Marc-andre Kirwan"},{"id":98997,"appointment_time":"Mon, 19th Jul 2021, 10:07 AM","service_name":"Colour Consultation","status":"PENDING","customer_name":"Marc-andre Kirwan"},{"id":108758,"appointment_time":"Mon, 26th Jul 2021, 11:07 AM","service_name":"Quick Pluck","status":"PENDING","customer_name":"Marc-andre Kirwan"},{"id":111281,"appointment_time":"Mon, 2nd Aug 2021, 11:08 AM","service_name":"Cut & Colour","status":"CONFIRMED","customer_name":"Carol Bramwell"},{"id":111486,"appointment_time":"Fri, 6th Aug 2021, 08:08 AM","service_name":"Skin Fade","status":"CONFIRMED","customer_name":"Test Customer"},{"id":123392,"appointment_time":"Mon, 16th Aug 2021, 09:08 AM","service_name":"HD","status":"CONFIRMED","customer_name":"William Karlsson"},{"id":138383,"appointment_time":"Fri, 10th Sep 2021, 07:09 AM","service_name":"Colour Consultation","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":142546,"appointment_time":"Sat, 11th Sep 2021, 08:09 AM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"Carol Bramwell"},{"id":143124,"appointment_time":"Thu, 9th Sep 2021, 10:09 AM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"Carol Bramwell"},{"id":144071,"appointment_time":"Sun, 12th Sep 2021, 03:09 PM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"Carol Bramwell"},{"id":162799,"appointment_time":"Fri, 8th Oct 2021, 08:10 AM","service_name":"Cut & Colour","status":"CONFIRMED","customer_name":"Carol Bramwell"},{"id":162805,"appointment_time":"Thu, 30th Sep 2021, 06:09 PM","service_name":"HD","status":"CONFIRMED","customer_name":"John Major"},{"id":162814,"appointment_time":"Wed, 13th Oct 2021, 06:10 PM","service_name":"Colour Consultation","status":"CONFIRMED","customer_name":"Carol Bramwell"},{"id":162816,"appointment_time":"Fri, 1st Oct 2021, 06:10 PM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":162822,"appointment_time":"Thu, 4th Nov 2021, 05:11 PM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"John Major"},{"id":528627,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"PENDING","customer_name":"Jenny Jones"},{"id":528628,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"PENDING","customer_name":"Jenny Jones"},{"id":528629,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"PENDING","customer_name":"Jenny Jones"},{"id":528630,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"PENDING","customer_name":"Jenny Jones"}]}

ViewAppoitmentListResponse viewAppoitmentListResponseFromJson(String str) => ViewAppoitmentListResponse.fromJson(json.decode(str));
String viewAppoitmentListResponseToJson(ViewAppoitmentListResponse data) => json.encode(data.toJson());
class ViewAppoitmentListResponse {
  ViewAppoitmentListResponse({
      bool? error, 
      int? code, 
      String? message, 
      Data? data,}){
    _error = error;
    _code = code;
    _message = message;
    _data = data;
}

  ViewAppoitmentListResponse.fromJson(dynamic json) {
    _error = json['error'];
    _code = json['code'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  int? _code;
  String? _message;
  Data? _data;
ViewAppoitmentListResponse copyWith({  bool? error,
  int? code,
  String? message,
  Data? data,
}) => ViewAppoitmentListResponse(  error: error ?? _error,
  code: code ?? _code,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  int? get code => _code;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['code'] = _code;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// appointments : [{"id":2,"appointment_time":"Tue, 28th Apr 2020, 09:04 AM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Test Customer-PERM-MOB"},{"id":4,"appointment_time":"Sat, 2nd May 2020, 09:05 AM","service_name":"Standard Haircut","status":"CANCELLED","customer_name":"Hulk Hogan"},{"id":9,"appointment_time":"Mon, 4th May 2020, 10:05 PM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":10,"appointment_time":"Mon, 4th May 2020, 09:05 PM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":11,"appointment_time":"Tue, 5th May 2020, 07:05 AM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":12,"appointment_time":"Tue, 5th May 2020, 08:05 AM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":13,"appointment_time":"Mon, 4th May 2020, 10:05 AM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":14,"appointment_time":"Mon, 4th May 2020, 11:05 AM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":15,"appointment_time":"Mon, 4th May 2020, 04:05 PM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Margaret Thatcher"},{"id":16,"appointment_time":"Tue, 5th May 2020, 08:05 AM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Margaret Thatcher"},{"id":18,"appointment_time":"Thu, 7th May 2020, 08:05 AM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Margaret Thatcher"},{"id":22,"appointment_time":"Wed, 27th May 2020, 10:05 AM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":23,"appointment_time":"Thu, 7th May 2020, 10:05 PM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":24,"appointment_time":"Thu, 21st May 2020, 12:05 PM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":25,"appointment_time":"Mon, 18th May 2020, 09:05 AM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"Kate Jones"},{"id":26,"appointment_time":"Mon, 25th May 2020, 01:05 PM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"Test Customer-PERM-EMAIL"},{"id":33,"appointment_time":"Mon, 25th May 2020, 10:05 AM","service_name":"Cut & Blow Dry","status":"CANCELLED","customer_name":"Some Customer"},{"id":35,"appointment_time":"Tue, 26th May 2020, 11:05 AM","service_name":"Cut & Blow Dry","status":"CANCELLED","customer_name":"Margaret Thatcher"},{"id":36,"appointment_time":"Tue, 26th May 2020, 11:05 AM","service_name":"Cut & Blow Dry","status":"CANCELLED","customer_name":"Margaret Thatcher"},{"id":37,"appointment_time":"Tue, 26th May 2020, 11:05 AM","service_name":"Cut & Blow Dry","status":"CANCELLED","customer_name":"Margaret Thatcher"},{"id":48,"appointment_time":"Mon, 24th Aug 2020, 12:08 PM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"Margaret Thatcher"},{"id":49,"appointment_time":"Mon, 29th Jun 2020, 02:06 PM","service_name":"Cut & Blow Dry","status":"PENDING","customer_name":"Margaret Thatcher"},{"id":50,"appointment_time":"Mon, 8th Jun 2020, 10:06 AM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":51,"appointment_time":"Sat, 13th Jun 2020, 09:06 AM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"Braden Holtby"},{"id":52,"appointment_time":"Mon, 22nd Jun 2020, 01:06 PM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"test customer"},{"id":159,"appointment_time":"Thu, 18th Jun 2020, 10:06 AM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"Margaret Thatcher"},{"id":162,"appointment_time":"Mon, 15th Jun 2020, 10:06 AM","service_name":"Cut & Blow Dry","status":"PENDING","customer_name":"John Major"},{"id":166,"appointment_time":"Tue, 23rd Jun 2020, 11:06 AM","service_name":"Cut & Blow Dry","status":"PENDING","customer_name":"Margaret Thatcher"},{"id":171,"appointment_time":"Tue, 23rd Jun 2020, 01:06 PM","service_name":"Cut & Blow Dry","status":"PENDING","customer_name":"John Major"},{"id":172,"appointment_time":"Sat, 20th Jun 2020, 06:06 PM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Test Customer-PERM-EMAIL"},{"id":174,"appointment_time":"Thu, 9th Jul 2020, 07:07 PM","service_name":"Cut & Blow Dry","status":"CANCELLED","customer_name":"Hulk Hogan"},{"id":175,"appointment_time":"Thu, 18th Jun 2020, 07:06 AM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"John Major"},{"id":183,"appointment_time":"Fri, 12th Jun 2020, 05:06 PM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"Braden Holtby"},{"id":220,"appointment_time":"Tue, 16th Jun 2020, 04:06 PM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"Carol Bramwell"},{"id":1091,"appointment_time":"Thu, 16th Jul 2020, 08:07 AM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"Carol Bramwell"},{"id":1092,"appointment_time":"Sat, 18th Jul 2020, 11:07 AM","service_name":"Standard Haircut","status":"CONFIRMED","customer_name":"John Major"},{"id":2101,"appointment_time":"Fri, 31st Jul 2020, 10:07 AM","service_name":"Cut & Colour","status":"CONFIRMED","customer_name":"Carol Bramwell"},{"id":23562,"appointment_time":"Mon, 15th Mar 2021, 10:03 AM","service_name":"Standard Haircut","status":"CANCELLED","customer_name":"Hulk Hogan"},{"id":25040,"appointment_time":"Thu, 18th Mar 2021, 11:03 AM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":26740,"appointment_time":"Mon, 22nd Mar 2021, 05:03 PM","service_name":"HD","status":"PENDING","customer_name":"John Major"},{"id":26744,"appointment_time":"Mon, 5th Apr 2021, 02:04 PM","service_name":"HD","status":"CANCELLED","customer_name":"Margaret Thatcher"},{"id":26772,"appointment_time":"Fri, 30th Apr 2021, 03:04 PM","service_name":"HD","status":"CANCELLED","customer_name":"test customer"},{"id":27499,"appointment_time":"Sun, 28th Mar 2021, 07:03 PM","service_name":"Cut & Blow Dry","status":"CANCELLED","customer_name":"Hulk Hogan"},{"id":28021,"appointment_time":"Wed, 24th Mar 2021, 09:03 AM","service_name":"Cut & Colour","status":"CONFIRMED","customer_name":"Margaret Thatcher"},{"id":36675,"appointment_time":"Thu, 15th Apr 2021, 04:04 PM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"John Major"},{"id":36677,"appointment_time":"Thu, 15th Apr 2021, 04:04 PM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"Margaret Thatcher"},{"id":36686,"appointment_time":"Thu, 15th Apr 2021, 03:04 PM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"John Major"},{"id":42350,"appointment_time":"Fri, 23rd Apr 2021, 09:04 AM","service_name":"Cut & Colour","status":"CONFIRMED","customer_name":"Carol Bramwell"},{"id":42352,"appointment_time":"Fri, 23rd Apr 2021, 12:04 PM","service_name":"HD","status":"CONFIRMED","customer_name":"Carol Bramwell"},{"id":42407,"appointment_time":"Thu, 22nd Apr 2021, 05:04 PM","service_name":"Cut & Colour","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":53586,"appointment_time":"Mon, 10th May 2021, 02:05 PM","service_name":"Gent's Haircut","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":53589,"appointment_time":"Mon, 10th May 2021, 02:05 PM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"John Major"},{"id":53591,"appointment_time":"Mon, 10th May 2021, 02:05 PM","service_name":"Cut & Colour","status":"CONFIRMED","customer_name":"Kate Jones"},{"id":54757,"appointment_time":"Tue, 11th May 2021, 08:05 PM","service_name":"HD","status":"CANCELLED","customer_name":"John Major"},{"id":54758,"appointment_time":"Tue, 11th May 2021, 08:05 PM","service_name":"Skin Fade","status":"CONFIRMED","customer_name":"Margaret Thatcher"},{"id":84194,"appointment_time":"Mon, 28th Jun 2021, 10:06 AM","service_name":"Gent's Haircut","status":"CONFIRMED","customer_name":"Marc-Andre Fleury"},{"id":85135,"appointment_time":"Mon, 28th Jun 2021, 12:06 PM","service_name":"Skin Fade","status":"PENDING","customer_name":"William Karlsson"},{"id":98985,"appointment_time":"Mon, 19th Jul 2021, 09:07 AM","service_name":"Quick Pluck","status":"PENDING","customer_name":"Matt Kirwan"},{"id":98988,"appointment_time":"Mon, 19th Jul 2021, 09:07 AM","service_name":"Quick Pluck","status":"CANCELLED","customer_name":"Marc-andre Kirwan"},{"id":98997,"appointment_time":"Mon, 19th Jul 2021, 10:07 AM","service_name":"Colour Consultation","status":"PENDING","customer_name":"Marc-andre Kirwan"},{"id":108758,"appointment_time":"Mon, 26th Jul 2021, 11:07 AM","service_name":"Quick Pluck","status":"PENDING","customer_name":"Marc-andre Kirwan"},{"id":111281,"appointment_time":"Mon, 2nd Aug 2021, 11:08 AM","service_name":"Cut & Colour","status":"CONFIRMED","customer_name":"Carol Bramwell"},{"id":111486,"appointment_time":"Fri, 6th Aug 2021, 08:08 AM","service_name":"Skin Fade","status":"CONFIRMED","customer_name":"Test Customer"},{"id":123392,"appointment_time":"Mon, 16th Aug 2021, 09:08 AM","service_name":"HD","status":"CONFIRMED","customer_name":"William Karlsson"},{"id":138383,"appointment_time":"Fri, 10th Sep 2021, 07:09 AM","service_name":"Colour Consultation","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":142546,"appointment_time":"Sat, 11th Sep 2021, 08:09 AM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"Carol Bramwell"},{"id":143124,"appointment_time":"Thu, 9th Sep 2021, 10:09 AM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"Carol Bramwell"},{"id":144071,"appointment_time":"Sun, 12th Sep 2021, 03:09 PM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"Carol Bramwell"},{"id":162799,"appointment_time":"Fri, 8th Oct 2021, 08:10 AM","service_name":"Cut & Colour","status":"CONFIRMED","customer_name":"Carol Bramwell"},{"id":162805,"appointment_time":"Thu, 30th Sep 2021, 06:09 PM","service_name":"HD","status":"CONFIRMED","customer_name":"John Major"},{"id":162814,"appointment_time":"Wed, 13th Oct 2021, 06:10 PM","service_name":"Colour Consultation","status":"CONFIRMED","customer_name":"Carol Bramwell"},{"id":162816,"appointment_time":"Fri, 1st Oct 2021, 06:10 PM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"Hulk Hogan"},{"id":162822,"appointment_time":"Thu, 4th Nov 2021, 05:11 PM","service_name":"Cut & Blow Dry","status":"CONFIRMED","customer_name":"John Major"},{"id":528627,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"PENDING","customer_name":"Jenny Jones"},{"id":528628,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"PENDING","customer_name":"Jenny Jones"},{"id":528629,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"PENDING","customer_name":"Jenny Jones"},{"id":528630,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"PENDING","customer_name":"Jenny Jones"}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      List<Appointments>? appointments,}){
    _appointments = appointments;
}

  Data.fromJson(dynamic json) {
    if (json['appointments'] != null) {
      _appointments = [];
      json['appointments'].forEach((v) {
        _appointments?.add(Appointments.fromJson(v));
      });
    }
  }
  List<Appointments>? _appointments;
Data copyWith({  List<Appointments>? appointments,
}) => Data(  appointments: appointments ?? _appointments,
);
  List<Appointments>? get appointments => _appointments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_appointments != null) {
      map['appointments'] = _appointments?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 2
/// appointment_time : "Tue, 28th Apr 2020, 09:04 AM"
/// service_name : "Standard Haircut"
/// status : "CONFIRMED"
/// customer_name : "Test Customer-PERM-MOB"

Appointments appointmentsFromJson(String str) => Appointments.fromJson(json.decode(str));
String appointmentsToJson(Appointments data) => json.encode(data.toJson());
class Appointments {
  Appointments({
      int? id, 
      String? appointmentTime, 
      String? serviceName, 
      String? status, 
      String? customerName,}){
    _id = id;
    _appointmentTime = appointmentTime;
    _serviceName = serviceName;
    _status = status;
    _customerName = customerName;
}

  Appointments.fromJson(dynamic json) {
    _id = json['id'];
    _appointmentTime = json['appointment_time'];
    _serviceName = json['service_name'];
    _status = json['status'];
    _customerName = json['customer_name'];
  }
  int? _id;
  String? _appointmentTime;
  String? _serviceName;
  String? _status;
  String? _customerName;
Appointments copyWith({  int? id,
  String? appointmentTime,
  String? serviceName,
  String? status,
  String? customerName,
}) => Appointments(  id: id ?? _id,
  appointmentTime: appointmentTime ?? _appointmentTime,
  serviceName: serviceName ?? _serviceName,
  status: status ?? _status,
  customerName: customerName ?? _customerName,
);
  int? get id => _id;
  String? get appointmentTime => _appointmentTime;
  String? get serviceName => _serviceName;
  String? get status => _status;
  String? get customerName => _customerName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['appointment_time'] = _appointmentTime;
    map['service_name'] = _serviceName;
    map['status'] = _status;
    map['customer_name'] = _customerName;
    return map;
  }

}