import 'package:flutter/material.dart';
import 'package:streams_exercises/features/time/time_repository.dart';

class TimeScreen extends StatelessWidget {
  TimeScreen({Key? key, required TimeRepository timeRepository}) : super(key: key);

  final TimeRepository timeRepository = TimeRepository(); // Instanz von TimeRepository

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Screen'),
      ),
      body: StreamBuilder<DateTime>(
        stream: timeRepository.dateTimeStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final currentTime = snapshot.data!;
            return Center(
              child: Text(
                'Current Time: $currentTime',
                style: TextStyle(fontSize: 24.0),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
