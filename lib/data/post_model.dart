class PostModel {
	int? userId;
	int? id;
	String? title;
	String? body;

	PostModel({this.userId, this.id, this.title, this.body});

	factory PostModel.fromMap(Map<String, dynamic> json) => PostModel(
				userId: json['userId'] as int?,
				id: json['id'] as int?,
				title: json['title'] as String?,
				body: json['body'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'userId': userId,
				'id': id,
				'title': title,
				'body': body,
			};
}
