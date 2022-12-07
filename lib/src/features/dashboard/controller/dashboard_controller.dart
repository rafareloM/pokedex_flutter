// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

import 'package:dio_app/src/features/dashboard/models/pokemon_model.dart';
import 'package:dio_app/src/features/dashboard/repository/dashboard_repository.dart';
import 'package:dio_app/src/service/pokemon_state.dart';

part 'dashboard_controller.g.dart';

class DashbordController = _DashBordControllerBase with _$DashBordController;

abstract class _DashBordControllerBase with Store {
  final DashboardRepository repository;

  _DashBordControllerBase(
    this.repository,
  );

  List<Pokemon> pokemons = [];

  @observable
  PokemonState pokemonState = PokemonState.empty;

  @action
  Future<void> initPokemon() async {
    pokemonState = PokemonState.loading;
    var data = await repository.getPokemons();
    if (data != null) {
      pokemons.addAll(data);
      pokemonState = PokemonState.success;
    } else {
      pokemonState = PokemonState.failure;
    }
  }
}
