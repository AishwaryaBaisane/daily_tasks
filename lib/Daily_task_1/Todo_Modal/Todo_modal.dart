
class TodoModal {
  int userId;
  int id;
  String title;
  bool completed;

  TodoModal({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodoModal.fromJson(Map<String, dynamic> json) => TodoModal(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}
