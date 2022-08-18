class LoginData {
  LoginData({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.gender,
    this.dateOfBirth,
    this.address,
    this.city,
    this.state,
    this.pinCode,
    this.country,
    this.patientType,
    this.appId,
  });

  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final int? phoneNumber;
  final String? gender;
  final String? dateOfBirth;
  final String? address;
  final String? city;
  final String? state;
  final int? pinCode;
  final String? country;
  final String? patientType;
  final int? appId;

  factory LoginData.fromMap(Map<String, dynamic> json) => LoginData(
    id: (json["id"]==null)?0:json["id"],
    firstName: (json["first_name"]==null)?"":json["first_name"],
    lastName: (json["last_name"]==null)?"":json["last_name"],
    email: (json["email"]==null)?"":json["email"],
    phoneNumber: (json["phone_number"]==null)?0:json["phone_number"],
    gender: (json["gender"]==null)?"":json["gender"],
    dateOfBirth: (json["date_of_birth"]==null)?"":json["date_of_birth"],
    address: (json["address"]==null)?"":json["address"],
    city: (json["city"]==null)?"":json["city"],
    state: (json["state"]==null)?"":json["state"],
    pinCode: (json["pin_code"]==null)?0:json["pin_code"],
    country: (json["country"]==null)?"":json["country"],
    patientType: (json["patient_type"]==null)?"":json["patient_type"],
    appId: (json["app_id"]==null)?0:json["app_id"],
  );

  Map<String, dynamic> toMap() => {
    "id": id ?? 0,
    "first_name": firstName ?? "",
    "last_name": lastName ?? "",
    "email": email ?? "",
    "phone_number": phoneNumber ?? 0,
    "gender": gender ?? "",
    "date_of_birth": dateOfBirth ?? "",
    "address": address ?? "",
    "city": city ?? "",
    "state": state  ?? "",
    "pin_code": pinCode ?? 0 ,
    "country": country ?? "",
    "patient_type": patientType ?? "",
    "app_id": appId ?? 0,
  };
}