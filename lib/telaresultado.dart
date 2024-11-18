import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final VoidCallback resetQuiz;

  Result(this.score, this.resetQuiz);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            score <= 5
                ? "Infelizmente, você não sabe muito sobre games!"
                : score <= 8
                    ? "Você até que sabe um pouco sobre games!"
                    : "Você recebeu o prêmio Davy Jones dos games!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          if (score <= 5)
            Image.asset(
              'assets/gemido.gif',
              height: 220,
            )
          else if (score <= 8)
            Image.asset(
              'assets/davymaiado.gif',
              height: 220,
            )
          else
            Image.asset(
              'assets/davy-jones.gif',
              height: 220,
            ),
          SizedBox(height: 20),
          Text(
            'Pontuação final: $score',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: resetQuiz,
            child: Text('Reiniciar Quiz'),
          ),
        ],
      ),
    );
  }
}
