class Student {
  String id;
  String name;
  String code;
  String classRoom;

  Student(this.id, this.name, this.code, this.classRoom);

  Student.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        code = json['code'],
        classRoom = json['class_room'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'code': code,
        'class_room': classRoom,
      };
}
