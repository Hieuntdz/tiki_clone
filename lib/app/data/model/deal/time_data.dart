
class TimeData {
  List<TimeValues> _values;
  String _queryName;
  bool _multiSelect;

  List<TimeValues> get values => _values;
  String get queryName => _queryName;
  bool get multiSelect => _multiSelect;

  TimeData({
      List<TimeValues> values,
      String queryName, 
      bool multiSelect}){
    _values = values;
    _queryName = queryName;
    _multiSelect = multiSelect;
}

  TimeData.fromJson(dynamic json) {
    if (json["values"] != null) {
      _values = [];
      json["values"].forEach((v) {
        _values.add(TimeValues.fromJson(v));
      });
    }
    _queryName = json["query_name"];
    _multiSelect = json["multi_select"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_values != null) {
      map["values"] = _values.map((v) => v.toJson()).toList();
    }
    map["query_name"] = _queryName;
    map["multi_select"] = _multiSelect;
    return map;
  }

}


class TimeValues {
  String _queryValue;
  String _fromDate;
  String _toDate;
  String _display;
  bool _active;

  String get queryValue => _queryValue;
  String get fromDate => _fromDate;
  String get toDate => _toDate;
  String get display => _display;
  bool get active => _active;

  TimeValues({
      String queryValue, 
      String fromDate, 
      String toDate, 
      String display, 
      bool active}){
    _queryValue = queryValue;
    _fromDate = fromDate;
    _toDate = toDate;
    _display = display;
    _active = active;
}

  TimeValues.fromJson(dynamic json) {
    _queryValue = json["query_value"];
    _fromDate = json["from_date"];
    _toDate = json["to_date"];
    _display = json["display"];
    _active = json["active"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["query_value"] = _queryValue;
    map["from_date"] = _fromDate;
    map["to_date"] = _toDate;
    map["display"] = _display;
    map["active"] = _active;
    return map;
  }

}