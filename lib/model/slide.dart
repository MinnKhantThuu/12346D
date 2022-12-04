class Slide {
  String id, caption, image, appId;
  Slide(
      {required this.id,
      required this.caption,
      required this.image,
      required this.appId});

  factory Slide.fromJson(dynamic json) {
    return Slide(
      id: json['_id'],
      caption: json['caption'],
      image: json['image'],
      appId: json['appId'],
    );
  }
}
