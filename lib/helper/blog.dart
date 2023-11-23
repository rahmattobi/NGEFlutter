class Blog {
  int? id;
  String? img;
  String? title;
  String? desc;
  String? tgl;
  List<String>? galery;
  String? type;

  Blog(
      {this.id,
      this.img,
      this.title,
      this.desc,
      this.tgl,
      this.galery,
      this.type});

  Blog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    title = json['title'];
    desc = json['desc'];
    tgl = json['tgl'];
    galery = json['galery'].cast<String>();
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['img'] = img;
    data['title'] = title;
    data['desc'] = desc;
    data['tgl'] = tgl;
    data['galery'] = galery;
    data['type'] = type;
    return data;
  }
}
