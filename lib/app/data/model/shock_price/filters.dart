import 'package:tiki_clone/app/data/model/deal/time_data.dart';

class Filters {
  Tags tags;
  TimeData times;

  Filters({this.tags, this.times});

  Filters.fromJson(Map<String, dynamic> json) {
    tags = json['tags'] != null ? new Tags.fromJson(json['tags']) : null;
    times = json['times'] != null ? new TimeData.fromJson(json['times']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tags != null) {
      data['tags'] = this.tags.toJson();
    }
    if (this.times != null) {
      data['times'] = this.times.toJson();
    }
    return data;
  }
}

class Tags {
  String queryName;
  bool multiSelect;
  List<TagValues> values;

  Tags({this.queryName, this.multiSelect, this.values});

  Tags.fromJson(Map<String, dynamic> json) {
    queryName = json['query_name'];
    multiSelect = json['multi_select'];
    if (json['values'] != null) {
      values = new List<TagValues>();
      json['values'].forEach((v) {
        values.add(new TagValues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['query_name'] = this.queryName;
    data['multi_select'] = this.multiSelect;
    if (this.values != null) {
      data['values'] = this.values.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TagValues {
  int id;
  String queryValue;
  String name;
  String thumbnailUrl;

  TagValues({this.id, this.queryValue, this.name, this.thumbnailUrl});

  TagValues.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    queryValue = json['query_value'];
    name = json['name'];
    thumbnailUrl = json['thumbnail_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['query_value'] = this.queryValue;
    data['name'] = this.name;
    data['thumbnail_url'] = this.thumbnailUrl;
    return data;
  }
}
