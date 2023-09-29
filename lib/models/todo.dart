class Todo {
  int? id;
  String? title;
  String? description;

  Todo({
    this.id,
    this.title,
    this.description,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json['id'],
        title: json['title'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
      };
}
