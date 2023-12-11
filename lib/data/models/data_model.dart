class DataModel {
    int? userId;
    int? id;
    String? title;
    String? body;

    DataModel({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    DataModel copyWith({
        int? userId,
        int? id,
        String? title,
        String? body,
    }) => 
        DataModel(
            userId: userId ?? this.userId,
            id: id ?? this.id,
            title: title ?? this.title,
            body: body ?? this.body,
        );

    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        id: json["id"],
        userId: json["userId"],
        title: json["title"],
        body: json["body"]
      );
}


