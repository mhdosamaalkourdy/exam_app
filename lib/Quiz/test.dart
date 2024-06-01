import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Quiz/Model.dart';
import 'package:quiz_app/Quiz/loginScreen.dart';


class Quiz extends StatelessWidget {
  const Quiz({super.key});

  Future<List<QModel>> getQuiz() async {
    Dio req = Dio();
    try {
      Response response =
      await req.get("https://665ac4eb003609eda45ec183.mockapi.io/bnm/question");
      List<QModel> quiz = List.generate(
        response.data.length,
            (index) => QModel.fromMap(response.data[index]),
      );
      return quiz;
    } catch (e) {
      print("Failed to load quiz data: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff8D376F),
      appBar: AppBar(
               backgroundColor: const Color(0xff8D376F),
        leading: const Icon(Icons.arrow_back),
      ),

      body: FutureBuilder<List<QModel>>(
        future: getQuiz(),
        builder: (context, snapshot) {
          if  (snapshot.hasError || !snapshot.hasData ) {
            return const Center(
              child: Text('Failed to load quiz data'),
            );
            }
            else {
            return QuestionPage(quiz: snapshot.data!, numQuestionIndex: 0, answers: const []);
          }
        },
      ),
    );
  }
}

class QuestionPage extends StatelessWidget {
  final List<QModel> quiz;
  final int numQuestionIndex;
  final List<int> answers;

  const QuestionPage({
    required this.quiz,
    required this.numQuestionIndex,
    required this.answers,
  });

  void _onOptionSelected(BuildContext context, int answerIndex) {
    final newAnswers = List<int>.from(answers)..add(answerIndex);
    if (numQuestionIndex < quiz.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuestionPage(
            quiz: quiz,
            numQuestionIndex: numQuestionIndex + 1,
            answers: newAnswers,
          ),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final quizItem = quiz[numQuestionIndex];
    return Scaffold(
      backgroundColor: Colors.pink[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: (numQuestionIndex + 1) / quiz.length,
              backgroundColor: const Color(0xffDA8BD9),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.purple),
            ),
            const SizedBox(height: 20),
            CircleAvatar(
              backgroundColor: Colors.purple[300],
              child: Text('${numQuestionIndex + 1}', style: const TextStyle(color: Colors.white)),
            ),
           
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  quizItem.qus,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: quizItem.answer.length,
                itemBuilder: (context, ind) {
                  return OptionButton(
                    text: quizItem.answer[ind],
                    onPressed: () => _onOptionSelected(context, ind),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  OptionButton({
    required this.text,
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}


