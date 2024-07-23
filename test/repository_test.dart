import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

class RepositoryTest {
  static Future<void> profile() async {
    group('Profile Repository Test:', () {
      const String baseUrl = 'https://fakestoreapi.com';
      test('Fetch user from API', () async {
        final response = await http.get(Uri.parse('$baseUrl/users'));
        final List<dynamic> products = json.decode(response.body);

        expect(response.statusCode, 200);
        expect(products.length, greaterThan(0));

        expect(products[0]['id'], isA<num>());
        expect(products[0]['email'], isNotEmpty);
        expect(products[0]['username'], isNotEmpty);
        expect(products[0]['password'], isNotEmpty);
        expect(products[0]['name'], isA<Map>());
        expect(products[0]['name']['firstname'], isNotEmpty);
        expect(products[0]['name']['lastname'], isNotEmpty);
        expect(products[0]['phone'], isNotEmpty);
        expect(products[0]['address'], isA<Map>());
        expect(products[0]['address']['city'], isNotEmpty);
        expect(products[0]['address']['street'], isNotEmpty);
        expect(products[0]['address']['number'], isA<num>());
        expect(products[0]['address']['zipcode'], isNotEmpty);
        expect(products[0]['address']['geolocation'], isA<Map>());
        expect(products[0]['address']['geolocation']['lat'], isNotEmpty);
        expect(products[0]['address']['geolocation']['long'], isNotEmpty);
      });

    });
  }
}
// {
//     "address": {
//       "geolocation": {
//         "lat": "-37.3159",
//         "long": "81.1496"
//       },
//       "city": "kilcoole",
//       "street": "new road",
//       "number": 7682,
//       "zipcode": "12926-3874"
//     },
//     "id": 1,
//     "email": "john@gmail.com",
//     "username": "johnd",
//     "password": "m38rmF$",
//     "name": {
//       "firstname": "john",
//       "lastname": "doe"
//     },
//     "phone": "1-570-236-7033",
//     "__v": 0
//   },