import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/theme/theme.dart';

class CountDown extends StatefulWidget {
  final DateTime date;

  const CountDown({
    required this.date,
    super.key,
  });

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  Timer? _timer;
  int days = 0;
  int hours = 0;
  int minutes = 0;
  int seconds = 0;

  @override
  void initState() {
    super.initState();
    _refreshTimer();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _refreshTimer();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _refreshTimer() {
    final now = DateTime.now();
    final difference = widget.date.difference(now);

    setState(() {
      days = difference.inDays;
      hours = difference.inHours.remainder(24);
      minutes = difference.inMinutes.remainder(60);
      seconds = difference.inSeconds.remainder(60);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTime(
          context,
          days,
          context.t.countdownDays(days),
        ),
        const SizedBox(width: kSpacer),
        _buildTime(
          context,
          hours,
          context.t.countdownHours(hours),
        ),
        const SizedBox(width: kSpacer),
        _buildTime(
          context,
          minutes,
          context.t.countdownMinutes(minutes),
        ),
        const SizedBox(width: kSpacer),
        _buildTime(
          context,
          seconds,
          context.t.countdownSeconds(seconds),
        ),
      ],
    );
  }

  Widget _buildTime(BuildContext context, int time, String label) {
    return Column(
      children: [
        Text(
          '$time',
          style: context.textTheme.displayMedium?.copyWith(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: context.textTheme.bodyMedium?.copyWith(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
