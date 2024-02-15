import 'package:flutter/material.dart';
import 'package:streams_exercises/features/numbers/number_repository.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({
    Key? key,
    required this.numberRepository,
  }) : super(key: key);

  final NumberRepository numberRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Screen'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: numberRepository.getNumberStream(),

          // Der StreamBuilder hat einen stream-Parameter, der den Stream angibt, auf den er hört. 
          // In diesem Fall ist es der Stream von Ganzzahlen aus Ihrem NumberRepository.
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                'Number: ${snapshot.data}',
                style: TextStyle(fontSize: 24.0),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
