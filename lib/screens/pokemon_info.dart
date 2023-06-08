import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litedex/model/pokemon.dart';
import 'package:litedex/linear_progress_indicator.dart';

class PokemonInfo extends StatelessWidget {
  final Pokemon? pokemon;

  const PokemonInfo({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getTitle(),
      ),
      body: showInformation(context),
    );
  }

  Text getTitle() {
    if (pokemon != null) {
      return Text(pokemon!.name.toUpperCase());
    } else {
      return const Text("Pokémon não encontrado...");
    }
  }

  Flex showInformation(BuildContext context) {
    if (pokemon != null) {
      return pokemonInfoScreen(context);
    } else {
      return noInfoScreen();
    }
  }

  Row pokemonInfoScreen(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                child: SvgPicture.network(
                  '${pokemon?.image}',
                  fit: BoxFit.scaleDown,
                ),
                width: MediaQuery.of(context).size.width - 100,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  side: BorderSide(
                    color: Colors.black,
                    width: 4.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
                  child: Column(  
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "# ${pokemon?.id}",
                        style: const TextStyle(
                          fontSize: 24.0,
                          color: Color.fromARGB(255, 90, 101, 252),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Name: ${pokemon?.name}",
                        style: const TextStyle(
                          fontSize: 24.0,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "HP: ${pokemon?.hp}",
                        style: const TextStyle(
                          fontSize: 24.0,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Attack: ${pokemon?.attack}",
                        style: const TextStyle(
                          fontSize: 24.0,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Defese: ${pokemon?.defense}",
                        style: const TextStyle(
                          fontSize: 24.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Row noInfoScreen() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Pokémon não encontrado...",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
          ],
        )
      ],
    );
  }
}
