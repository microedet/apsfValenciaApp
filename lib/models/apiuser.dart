// To parse this JSON data, do
//
//     final apiUser = apiUserFromMap(jsonString);

import 'dart:convert';

class ApiUser {
    ApiUser({
        this.id,
        required this.password,
        required this.username,
        required this.email,
        required this.isActive,
        required this.isCliente,
        required this.firstName,
        required this.lastName,
        
    });

    int ?id;
    String password;
    String username;
    String email;
    bool isActive;
    bool isCliente;
    String firstName;
    String lastName;
    

    factory ApiUser.fromJson(String str) => ApiUser.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ApiUser.fromMap(Map<String, dynamic> json) => ApiUser(
        id: json["id"],
        password: json["password"],
        username: json["username"],
        email: json["email"],
        isActive: json["is_active"],
        isCliente: json["is_Cliente"],
        firstName: json["first_name"],
        lastName: json["last_name"],
            );

    Map<String, dynamic> toMap() => {
        "id": id,
        "password": password,
        "username": username,
        "email": email,
        "is_active": isActive,
        "is_Cliente": isCliente,
        "first_name": firstName,
        "last_name": lastName,
       
    };
}
