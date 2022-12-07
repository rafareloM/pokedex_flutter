import 'package:dio/dio.dart';
import 'package:dio_app/src/features/dashboard/models/pokemon_model.dart';

class DashboardRepository {
  var dio = Dio();
  Future<List<Pokemon>?> getPokemons() async {
    try {
      var response = await dio.get('https://pokeapi.co/api/v2/pokemon/');
      if (response.statusCode == 200) {
        final List<dynamic> body = await response.data['results'];
        return body.map((e) => Pokemon.fromMap(e)).toList();
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
