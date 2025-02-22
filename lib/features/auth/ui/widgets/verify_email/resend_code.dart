import 'dart:async';

import 'package:flutter/material.dart';

class ResendCode extends StatefulWidget {
  const ResendCode({super.key});

  @override
  State<ResendCode> createState() => _ResendCodeState();
}

class _ResendCodeState extends State<ResendCode> {
  int _secondsRemaining = 59;
  Timer? _timer;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    setState(() {
      _isButtonEnabled = false;
      _secondsRemaining = 59;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _isButtonEnabled = true;
        });
        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Didn\'t receive the code?'),
        _isButtonEnabled == false
            ? Text(_isButtonEnabled
                ? "Resend Email"
                : "Resend in $_secondsRemaining sec")
            : TextButton(
                onPressed: () {
                  if (_isButtonEnabled) {
                    startTimer();
                  }
                },
                child: Text('Resend'),
              ),
      ],
    );
  }
}
