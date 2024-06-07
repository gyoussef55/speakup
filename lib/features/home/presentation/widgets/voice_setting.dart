import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VoiceSetting extends ConsumerStatefulWidget {
  const VoiceSetting({
    super.key,
    required this.title,
    required this.sliderValue,
    required this.leadingTitle,
    required this.trailingTitle,
    this.leadingIconTipMessage,
    this.trailingIconTipMessage,
  });
  final String title;
  final StateProvider sliderValue;
  final String leadingTitle;
  final String trailingTitle;
  final String? leadingIconTipMessage;
  final String? trailingIconTipMessage;

  @override
  ConsumerState<VoiceSetting> createState() => _VoiceSettingState();
}

class _VoiceSettingState extends ConsumerState<VoiceSetting> {
  static const _sliderFactor = 0.01;
  double _sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    _sliderValue = ref.watch(widget.sliderValue) / _sliderFactor;
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title),
          Slider(
              value: _sliderValue,
              label: _sliderValue.round().toString(),
              max: 100,
              min: 0,
              onChanged: (value) {
                ref.read(widget.sliderValue.notifier).state =
                    (value.round() * _sliderFactor);
              }),
          Row(
            children: [
              Text(widget.leadingTitle),
              const SizedBox(
                width: 5,
              ),
              (widget.leadingIconTipMessage != null)
                  ? Tooltip(
                      message: widget.leadingIconTipMessage!,
                      child: const Icon(
                        Icons.info,
                        color: Colors.black,
                      ))
                  : const SizedBox.shrink(),
              const Spacer(),
              Text(widget.trailingTitle),
              const SizedBox(
                width: 5,
              ),
              (widget.trailingIconTipMessage != null)
                  ? Tooltip(
                      message: widget.trailingIconTipMessage!,
                      child: const Icon(
                        Icons.info,
                        color: Colors.black,
                      ))
                  : const SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
