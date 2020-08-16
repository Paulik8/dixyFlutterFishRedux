// To parse this JSON data, do
//
//     final appModel = appModelFromJson(jsonString);

import 'dart:convert';

List<AppModel> appModelFromJson(String str) => List<AppModel>.from(json.decode(str).map((x) => AppModel.fromJson(x)));

String appModelToJson(List<AppModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppModel {
    AppModel({
        this.app,
        this.version,
        this.city,
        this.email,
        this.currency,
        this.foundeddate,
        this.info,
    });

    final String app;
    final String version;
    final String city;
    final String email;
    final String currency;
    final String foundeddate;
    final Info info;

    AppModel copyWith({
        String app,
        String version,
        String city,
        String email,
        String currency,
        String foundeddate,
        Info info,
    }) => 
        AppModel(
            app: app ?? this.app,
            version: version ?? this.version,
            city: city ?? this.city,
            email: email ?? this.email,
            currency: currency ?? this.currency,
            foundeddate: foundeddate ?? this.foundeddate,
            info: info ?? this.info,
        );

    factory AppModel.fromJson(Map<String, dynamic> json) => AppModel(
        app: json["app"],
        version: json["version"],
        city: json["city"],
        email: json["email"],
        currency: json["currency"],
        foundeddate: json["foundeddate"],
        info: Info.fromJson(json["info"]),
    );

    Map<String, dynamic> toJson() => {
        "app": app,
        "version": version,
        "city": city,
        "email": email,
        "currency": currency,
        "foundeddate": foundeddate,
        "info": info.toJson(),
    };
}

class Info {
    Info({
        this.employees,
    });

    final List<Employee> employees;

    Info copyWith({
        List<Employee> employees,
    }) => 
        Info(
            employees: employees ?? this.employees,
        );

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        employees: List<Employee>.from(json["employees"].map((x) => Employee.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "employees": List<dynamic>.from(employees.map((x) => x.toJson())),
    };
}

class Employee {
    Employee({
        this.gender,
        this.firstname,
        this.lastname,
        this.birthday,
        this.position,
        this.ssn,
        this.username,
    });

    final Gender gender;
    final String firstname;
    final String lastname;
    final String birthday;
    final String position;
    final String ssn;
    final String username;

    Employee copyWith({
        Gender gender,
        String firstname,
        String lastname,
        String birthday,
        String position,
        String ssn,
        String username,
    }) => 
        Employee(
            gender: gender ?? this.gender,
            firstname: firstname ?? this.firstname,
            lastname: lastname ?? this.lastname,
            birthday: birthday ?? this.birthday,
            position: position ?? this.position,
            ssn: ssn ?? this.ssn,
            username: username ?? this.username,
        );

    factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        gender: genderValues.map[json["gender"]],
        firstname: json["firstname"],
        lastname: json["lastname"],
        birthday: json["birthday"],
        position: json["position"],
        ssn: json["ssn"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "gender": genderValues.reverse[gender],
        "firstname": firstname,
        "lastname": lastname,
        "birthday": birthday,
        "position": position,
        "ssn": ssn,
        "username": username,
    };
}

enum Gender { FEMALE, MALE }

final genderValues = EnumValues({
    "Female": Gender.FEMALE,
    "Male": Gender.MALE
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
