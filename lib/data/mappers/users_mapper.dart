import 'package:users_app_bloc/data/entities/users.dart';
import 'package:users_app_bloc/data/models/users_detail_response.dart';
import 'package:users_app_bloc/data/models/users_reponse.dart';

class UsersMapper {
  static Users userResponseToEntity(UsersResponse usersResponse) => Users(
        id: usersResponse.id,
        name: usersResponse.name,
        userName: usersResponse.username,
        email: usersResponse.email,
        address: Address(
          street: usersResponse.address.street,
          suite: usersResponse.address.suite,
          city: usersResponse.address.city,
          zipcode: usersResponse.address.zipcode,
          geo: Geo(
              lat: usersResponse.address.geo.lat,
              lng: usersResponse.address.geo.lng),
        ),
        phone: usersResponse.phone,
        website: usersResponse.website,
        company: Company(
            name: usersResponse.company.name,
            catchPhrase: usersResponse.company.catchPhrase,
            bs: usersResponse.company.bs),
      );
}
