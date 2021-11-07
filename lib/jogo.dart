import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _mensagem = "Escolha uma opção abaixo:";
  var _imagemApp = AssetImage("images/padrao.png");
  void _opcaSelecionado(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];
    print("Escolha do App: " + escolhaApp);
    print("Escolha do usuario: " + escolhaUsuario);

    //exibir escolha do app
    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }
    //validação ganhador
    if ( //jogador ganha
        (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
            (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
            (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this._mensagem = "Parabéns!!! Você ganhou!!! ";
      });
    } else if ( //app ganha
        (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
            (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
            (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        this._mensagem = "Você perdeu, tente novamente ";
      });
    } else {
      setState(() {
        this._mensagem = "Empatamos!!! ";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JokenPo"),
      ),
      body: Center(
        child: Container(
          // padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.amber),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Text(
                  "Escolha do App:",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Image(
                image: this._imagemApp,
                height: 150,
              ),
              //foto padrao
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Text(
                  this._mensagem,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _opcaSelecionado("pedra"),
                    child: Image.asset(
                      "images/pedra.png",
                      height: 100,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _opcaSelecionado("papel"),
                    child: Image.asset(
                      "images/papel.png",
                      height: 100,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _opcaSelecionado("tesoura"),
                    child: Image.asset(
                      "images/tesoura.png",
                      height: 100,
                    ),
                  ),
                ],
              ),
              //linha 3 imagens
            ],
          ),
        ),
      ),
    );
  }
}
