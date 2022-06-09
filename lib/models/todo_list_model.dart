class TODOListViewModel {
  final bool? status;
  final List<ToDoList>? toDoList;

  TODOListViewModel({
    this.status,
    this.toDoList,
  });

  TODOListViewModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as bool?,
      toDoList = (json['ToDoList'] as List?)?.map((dynamic e) => ToDoList.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'ToDoList' : toDoList?.map((e) => e.toJson()).toList()
  };
}

class ToDoList {
  final int? id;
  final String? userId;
  final String? title;
  final String? todayTime;
  final String? tomorowTime;
  final String? alert;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  ToDoList({
    this.id,
    this.userId,
    this.title,
    this.todayTime,
    this.tomorowTime,
    this.alert,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  ToDoList.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      userId = json['user_id'] as String?,
      title = json['title'] as String?,
      todayTime = json['today_time'] as String?,
      tomorowTime = json['tomorow_time'] as String?,
      alert = json['alert'] as String?,
      status = json['status'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'user_id' : userId,
    'title' : title,
    'today_time' : todayTime,
    'tomorow_time' : tomorowTime,
    'alert' : alert,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}