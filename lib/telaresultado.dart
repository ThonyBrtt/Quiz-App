import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final VoidCallback resetQuiz;
  final int totalQuestions = 15;

  Result(this.score, this.resetQuiz);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            score == 0
                ? "Ta de passeio ne sacana kkkkkkkk"
                : score <= 5
                    ? "Infelizmente, você não sabe muito sobre games!"
                    : score <= 8
                        ? "Você até que sabe um pouco sobre games!"
                        : "Você recebeu o prêmio Davy Jones dos games!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          if (score == 0)
            Image.asset(
              'assets/slk.gif',  
              height: 220,
            )
          else if (score <= 5)
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
            'Acertos: $score/$totalQuestions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
