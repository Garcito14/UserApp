import 'package:users_app_bloc/data/models/users_detail_response.dart';

class Users {
  final int id;
  final String name;
  final String userName;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  Users(
      {required this.id,
      required this.name,
      required this.userName,
      required this.email,
      required this.address,
      required this.phone,
      required this.website,
      required this.company});
}
