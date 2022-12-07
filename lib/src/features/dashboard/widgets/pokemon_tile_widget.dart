import 'package:flutter/material.dart';

class PokemonTile extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  const PokemonTile({Key? key, required this.name, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            overlayColor: MaterialStateProperty.all(Colors.red),
            borderRadius: BorderRadius.circular(16),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(name),
            ),
          ),
        ),
      ),
    );
  }
}
