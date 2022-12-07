import 'package:dio_app/src/features/dashboard/controller/dashboard_controller.dart';
import 'package:dio_app/src/features/dashboard/widgets/pokemon_tile_widget.dart';
import 'package:dio_app/src/service/pokemon_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DashbordController controller = GetIt.I<DashbordController>();
  @override
  void initState() {
    controller.initPokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokemons')),
      body: Observer(builder: (context) {
        switch (controller.pokemonState) {
          case PokemonState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case PokemonState.failure:
            return const Center(
              child: Text('Ih, deu ruim!'),
            );

          default:
            return ListView(
              children: controller.pokemons
                  .map((e) => PokemonTile(
                        name: e.name,
                        onTap: () {},
                      ))
                  .toList(),
            );
        }
      }),
    );
  }
}
