class PostStep {
  int id;
  String description;
  int stepCount;
  String imageUrl;

  PostStep({
    this.id,
    this.description,
    this.stepCount,
    this.imageUrl,
  });

  factory PostStep.fromJson(Map<String, dynamic> json) => PostStep(
        id: json["id"],
        description: json["description"],
        stepCount: json["stepCount"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "stepCount": stepCount,
        "imageUrl": imageUrl,
      };
}
