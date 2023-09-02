class Actualites {
  int? id;
  String? date;
  String? dateGmt;
  Guid? title;
  Content? content;
  Content? excerpt;
  YoastHeadJson? yoastHeadJson;

  Actualites(
      {this.id,
        this.date,
        this.dateGmt,
        this.title,
        this.content,
        this.excerpt,
        this.yoastHeadJson,});

  Actualites.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    title = json['title'] != null ? new Guid.fromJson(json['title']) : null;
    content =
    json['content'] != null ? new Content.fromJson(json['content']) : null;
    excerpt =
    json['excerpt'] != null ? new Content.fromJson(json['excerpt']) : null;
    yoastHeadJson = json['yoast_head_json'] != null
        ? new YoastHeadJson.fromJson(json['yoast_head_json'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['date'] = date;
    data['date_gmt'] = dateGmt;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (content != null) {
      data['content'] = content!.toJson();
    }
    if (excerpt != null) {
      data['excerpt'] = excerpt!.toJson();
    }
    if (yoastHeadJson != null) {
      data['yoast_head_json'] = yoastHeadJson!.toJson();
    }
    return data;
  }
}

class Guid {
  String? rendered;

  Guid({this.rendered});

  Guid.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rendered'] = rendered;
    return data;
  }
}

class Content {
  String? rendered;
  bool? protected;

  Content({this.rendered, this.protected});

  Content.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
    protected = json['protected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rendered'] = rendered;
    data['protected'] = protected;
    return data;
  }
}

class YoastHeadJson {
  List<OgImage>? ogImage;

  YoastHeadJson(
      {
        this.ogImage,});

  YoastHeadJson.fromJson(Map<String, dynamic> json) {
    if (json['og_image'] != null) {
      ogImage = <OgImage>[];
      json['og_image'].forEach((v) {
        ogImage!.add(new OgImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (ogImage != null) {
      data['og_image'] = ogImage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OgImage {
  String? url;

  OgImage({this.url,});

  OgImage.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = url;
    return data;
  }
}