import 'package:flutter/material.dart';
import 'package:lab1_221075/data/ispiti.dart';
import 'package:lab1_221075/models/ispit.dart';
import 'package:lab1_221075/screens/details_screen.dart';
import 'package:lab1_221075/widgets/ispit_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // sort chronologically by date
    final List<Exam> sorted = [...listExams]
      ..sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: Text('Распоред на испити - 221075'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: sorted.length,
        itemBuilder: (context, i) {
          final exam = sorted[i];
          return ExamCard(
            exam: exam,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ExamDetailScreen(exam: exam)),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        height: 56,
        child: Center(
          child: Chip(
            label: Text('Вкупно испити: ${sorted.length}'),
            avatar: const Icon(Icons.format_list_bulleted),
          ),
        ),
      ),
    );
  }
}
