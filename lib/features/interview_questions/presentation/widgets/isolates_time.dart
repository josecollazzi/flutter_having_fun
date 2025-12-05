import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

int runHeavyTask(int number) {
  int total = 0;
  for (int i = 0; i < number; i++) {
    total += i;
  }
  return total;
}

class IsolatesTime extends StatefulWidget {
  final int loopSize;
  const IsolatesTime({required this.loopSize, super.key});

  @override
  State<IsolatesTime> createState() => _IsolatesTimeState();
}

class _IsolatesTimeState extends State<IsolatesTime> {
  bool _isLoading = false;
  int _isolateTime = 0;
  int _mainThreatTime = 0;

  Future<void> startBackgroundWork() async {
    setState(() => _isLoading = true);

    final stopwatch = Stopwatch()..start();
    await compute(runHeavyTask, widget.loopSize);
    stopwatch.stop();
    final isolateTime = stopwatch.elapsedMilliseconds;

    final stopwatch2 = Stopwatch()..start();
    runHeavyTask(widget.loopSize);
    stopwatch2.stop();
    final mainThreadTime = stopwatch2.elapsedMilliseconds;

    setState(() {
      _isolateTime = isolateTime;
      _mainThreatTime = mainThreadTime;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isLoading) const CircularProgressIndicator(),
            const SizedBox(height: 20),
            if (_isolateTime > 0 && _mainThreatTime > 0)
              Text(
                "Difference: ${_mainThreatTime - _isolateTime}",
                style: const TextStyle(fontSize: 20),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: startBackgroundWork,
              child: const Text("Run Comparative"),
            ),
          ],
        ),
      ),
    );
  }
}
