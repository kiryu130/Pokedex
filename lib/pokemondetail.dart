import 'package:flutter/material.dart';
import 'package:pokedex/pokemon.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokeDetail({this.pokemon});

  bodyWidget(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height + 1,
            width: MediaQuery.of(context).size.width + 10,
            left: -5,
            bottom: MediaQuery.of(context).size.height * 0.6,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(75.0),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Hero(
                    tag: pokemon.img,
                    child: Container(
                      height: 200.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(pokemon.img))),
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  pokemon.name,
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.type
                      .map((t) => FilterChip(
                          backgroundColor: Colors.indigo[700],
                          label: Text(
                            t,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          labelPadding: EdgeInsets.only(left: 25, right: 25),
                          onSelected: (b) {}))
                      .toList(),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: [
                          Text(
                            "${pokemon.height}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              Text("Height",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text("${pokemon.weight}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                          Row(
                            children: [
                              Text(
                                "Weight",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]),
                Text("Weakness",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.weaknesses
                      .map((t) => FilterChip(
                          backgroundColor: Colors.red,
                          label: Text(
                            t,
                            style: TextStyle(color: Colors.white),
                          ),
                          onSelected: (b) {}))
                      .toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Prev Evolution",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: pokemon.prevEvolution == null
                              ? <Widget>[
                                  Text("-",
                                      style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.white,
                                      ))
                                ]
                              : pokemon.prevEvolution
                                  .map((p) => FilterChip(
                                        backgroundColor: Colors.green,
                                        label: Text(
                                          p.name,
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        onSelected: (b) {},
                                      ))
                                  .toList(),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Next Evolution",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: pokemon.nextEvolution == null
                              ? <Widget>[
                                  Text("-",
                                      style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.white,
                                      ))
                                ]
                              : pokemon.nextEvolution
                                  .map((n) => FilterChip(
                                        backgroundColor: Colors.green,
                                        label: Text(
                                          n.name,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onSelected: (b) {},
                                      ))
                                  .toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        elevation: 10.0,
        backgroundColor: Colors.amber[800],
        title: Text(pokemon.name),
      ),
      body: bodyWidget(context),
    );
  }
}
