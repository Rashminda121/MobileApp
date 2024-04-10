import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_app/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String email;
  String phoneNumber;
  String profilePicture;
  String? username; // Making username optional by adding '?'

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    this.username, // Making username optional
  });

String get fullName => '$firstName $lastName';
String get formattedPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);

static List <String> nameParts(fullName) => fullName.split ("");

static String generatedUsername(fullName) {
    List <String> nameParts = fullName.split ("");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
}
static UserModel empty () => UserModel(
    id: "",
    firstName: "",
    lastName: "",
    username: "",
    email: "",
    phoneNumber: "",
    profilePicture: "",
);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
  if (document.data() != null) {
    final data = document.data()!;
  
    return UserModel(
      id: document.id,
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      username: data['username'] ?? '',
      email: data['email'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      profilePicture: data['profilePicture'] ?? '',
    );
  }
  
  // Return a default UserModel if document data is null
  return UserModel.empty();
}
}