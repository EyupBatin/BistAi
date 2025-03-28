class UserClass {
  String? id;
  String? name;
  String? surname;
  String? phone;
  String? password;

  UserClass({
    required this.id,
    required this.name,
    required this.surname,
    required this.phone,
    required this.password,
  });

  @override
  String toString() {
    return 'User{id:$id,name:$name,surname:$surname,phone:$phone,password:$password}';
  }

  factory UserClass.fromJson(Map<String, dynamic> json) {
    return UserClass(
      id: json['id'] ?? '',  // Default to empty string if null
      name: json['name'] ?? '',  // Default to empty string if null
      surname: json['surname'] ?? false,  // Default to false if null
      phone: json['phone'],
      password: json['password'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id ?? '',  // Ensure non-null value
      'name': name ?? '',  // Ensure non-null value
      'surname':surname ?? '',
      'phone':phone ?? '',
      'password':password??'',
    };
  }
}
