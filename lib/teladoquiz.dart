import 'package:flutter/material.dart';
import 'dart:async';
import 'telaresultado.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _questionIndex = 0;
  int _score = 0;
  int _timer = 10;
  Timer? _timerController;

  late List<int?> _answeredScores;

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'Qual é o nome do personagem principal de "The Legend of Zelda?"',
      'imageUrl': 'assets/link.gif',
      'answers': [
        {'text': 'Zelda', 'score': 0},
        {'text': 'Link', 'score': 1},
        {'text': 'Ganondorf', 'score': 0},
        {'text': 'Epona', 'score': 0},
      ],
    },
    {
      'questionText': 'Qual jogo é famoso por ter roubado o prêmio de Read Dead 2?',
      'imageUrl': 'assets/m.gif',  
      'answers': [
        {'text': 'God Of War', 'score': 1},
        {'text': 'War of God', 'score': 0},
        {'text': 'Bom de Guerra', 'score': 0},
        {'text': 'Guerra de Bom', 'score': 0},
      ],
    },
    {
      'questionText': 'Qual desses jogos não é de futebol?',
      'imageUrl': 'assets/xd.gif',  
      'answers': [
        {'text': 'Fifa', 'score': 0},
        {'text': 'Futebol', 'score': 0},
        {'text': 'Ea Fc', 'score': 0},
        {'text': 'Todas as opções', 'score': 1},
      ],
    },
    {
      'questionText': 'Qual dessas é a pior empresa?',
      'imageUrl': 'assets/vish.gif',  
      'answers': [
        {'text': 'Activision', 'score': 0},
        {'text': 'Epic Games', 'score': 0},
        {'text': 'Ubisoft', 'score': 1},
        {'text': 'Square Enix', 'score': 0},
      ],
    },
    {
      'questionText': 'Qual desses jogos tem o protagonista Artur Morgan?',
      'imageUrl': 'assets/arthur.gif',  
      'answers': [
        {'text': 'Red Dead 2', 'score': 1},
        {'text': 'Red Dead 1', 'score': 0},
        {'text': 'God Of War', 'score': 0},
        {'text': 'Resident Evil 4', 'score': 0},
      ],
    },
    {
      'questionText': 'Qual o nome do jogo que você sobrevive em uma pizzaria?',
      'imageUrl': 'assets/pizza.gif',  
      'answers': [
        {'text': 'Outlast', 'score': 0},
        {'text': 'Five Nights at Freddy\'s', 'score': 1},
        {'text': 'Silent Hill', 'score': 0},
        {'text': 'Resident Evil', 'score': 0},
      ],
    },
    {
      'questionText': 'Em qual desses jogos você encontra o personagem "Petches"?',
      'imageUrl': 'assets/opaaa.gif',  
      'answers': [
        {'text': 'The Witcher', 'score': 0},
        {'text': 'Dark Souls', 'score': 1},
        {'text': 'Assassin\'s Creed', 'score': 0},
        {'text': 'Skyrim', 'score': 0},
      ],
    },
    {
      'questionText': 'Em qual jogo se encontra esse boss?',
      'imageUrl': 'assets/elden.png', 
      'answers': [
        {'text': 'Elden Ring', 'score': 1},
        {'text': 'Vampire Survivors', 'score': 0},
        {'text': 'The Witcher', 'score': 0},
        {'text': 'Final Fantasy', 'score': 0},
      ],
    },
    {
      'questionText': 'Na imagem acima, isso é...',
      'imageUrl': 'assets/loja.png',  
      'answers': [
        {'text': 'Safadesas', 'score': 0},
        {'text': 'Missão Aleatória', 'score': 0},
        {'text': 'Loja de Sapatos', 'score': 1},
      ],
    },
    {
      'questionText': 'Qual é o nome do criador de "Super Mario"?',
      'imageUrl': 'assets/mario.gif',  
      'answers': [
        {'text': 'Hideo Kojima', 'score': 0},
        {'text': 'Shigeru Miyamoto', 'score': 1},
        {'text': 'Satoru Iwata', 'score': 0},
        {'text': 'Masahiro Sakurai', 'score': 0},
      ],
    },
    {
      'questionText': 'Esse personagem se encontra em qual jogo?',
      'imageUrl': 'assets/ghost2.gif',  
      'answers': [
        {'text': 'Halo', 'score': 0},
        {'text': 'Call of Duty', 'score': 1},
        {'text': 'Gears of War', 'score': 0},
        {'text': 'Destiny', 'score': 0},
      ],
    },
    {
      'questionText': 'Qual é o nome do mundo de "Final Fantasy VII"?',
      'imageUrl': 'assets/final2.gif', 
      'answers': [
        {'text': 'Hyrule', 'score': 0},
        {'text': 'Spira', 'score': 0},
        {'text': 'Ivalice', 'score': 0},
        {'text': 'Gaia', 'score': 1},
      ],
    },
    {
      'questionText': 'Qual o vilão principal do jogo "Batman: Arkham Asylum"?',
      'imageUrl': 'assets/batman2.gif',  
      'answers': [
        {'text': 'Bane', 'score': 0},
        {'text': 'Two-Face', 'score': 0},
        {'text': 'Joker', 'score': 1},
        {'text': 'Riddler', 'score': 0},
      ],
    },
    {
      'questionText': 'Qual é o nome da principal personagem de "Tomb Raider"?',
      'imageUrl': 'assets/lara.gif',  
      'answers': [
        {'text': 'Lara Croft', 'score': 1},
        {'text': 'Aloy', 'score': 0},
        {'text': 'Chloe Frazer', 'score': 0},
        {'text': 'Ellie', 'score': 0},
      ],
    },
    {
      'questionText': 'Qual desses jogos ganhou o prêmio de Melhor Jogo do Ano de 2020?',
      'imageUrl': 'assets/game.png', 
      'answers': [
        {'text': 'Hades', 'score': 0},
        {'text': 'Ghost of Tsushima', 'score': 0},
        {'text': 'Final Fantasy VII Remake', 'score': 0},
        {'text': 'The Last of Us Part 2', 'score': 1},
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
    _answeredScores = List<int?>.filled(_questions.length, null);
    _startTimer();
  }

  void _answerQuestion(int score) {
    setState(() {
      if (_answeredScores[_questionIndex] == null) {
        _score += score;
        _answeredScores[_questionIndex] = score;
      }
      _questionIndex++;
      _timer = 10;
    });
    _startTimer();
  }

  void _goBack() {
    setState(() {
      if (_questionIndex > 0) {
        if (_answeredScores[_questionIndex - 1] != null) {
          _score -= _answeredScores[_questionIndex - 1]!;
          _answeredScores[_questionIndex - 1] = null;
        }
        _questionIndex--;
        _timer = 10;
      }
    });
    _startTimer();
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
      _answeredScores = List<int?>.filled(_questions.length, null);
      _timer = 10;
    });
    _startTimer();
  }

  void _startTimer() {
    if (_timerController != null) {
      _timerController!.cancel();
    }

    _timerController = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timer > 0) {
          _timer--;
        } else {
          timer.cancel();
          if (_questionIndex < _questions.length) {
            _answerQuestion(0); 
          }
        }
      });
    });
  }

  void _goToHome() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _timerController?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz de Games'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: _questionIndex < _questions.length
            ? Quiz(
                question: _questions[_questionIndex]['questionText'] as String,
                answers: _questions[_questionIndex]['answers'] as List<Map<String, Object>>?,
                answerQuestion: _answerQuestion,
                goBack: _goBack,
                imageUrl: _questions[_questionIndex]['imageUrl'] as String,
                questionIndex: _questionIndex,
                timer: _timer,
                goToHome: _goToHome,
              )
            : Result(_score, _resetQuiz),
      ),
    );
  }
}

class Quiz extends StatelessWidget {
  final String question;
  final List<Map<String, Object>>? answers;
  final Function answerQuestion;
  final Function goBack;
  final String imageUrl;
  final int questionIndex;
  final int timer;
  final Function goToHome;

  Quiz({
    required this.question,
    required this.answers,
    required this.answerQuestion,
    required this.goBack,
    required this.imageUrl,
    required this.questionIndex,
    required this.timer,
    required this.goToHome,
  });

  @override
  Widget build(BuildContext context) {
    double progress = (questionIndex + 1) / 15;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Questão ${questionIndex + 1} de 15',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 10),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tempo restante: $timer s',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 20),
        if (imageUrl.isNotEmpty)
          Image.asset(
            imageUrl,
            height: 220,
            fit: BoxFit.cover,
          ),
        SizedBox(height: 20),
        Text(
          question,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          runSpacing: 10,
          children: answers!
              .map((answer) => ElevatedButton(
                    onPressed: () => answerQuestion(answer['score'] as int),
                    child: Text(
                      answer['text'] as String,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ))
              .toList(),
        ),
        SizedBox(height: 20),
        if (questionIndex > 0)
          ElevatedButton(
            onPressed: () => goBack(),
            child: Text('Voltar para a pergunta anterior'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              textStyle: TextStyle(fontSize: 18),
            ),
          ),
        if (questionIndex == 0)
          ElevatedButton(
            onPressed: () => goToHome(),
            child: Text('Voltar para a Tela Inicial'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.green,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              textStyle: TextStyle(fontSize: 18),
            ),
          ),
      ],
    );
  }
}
