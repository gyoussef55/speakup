import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speakup/features/saved_files/presentation/providers/module.dart';

import '../../../../core/audio_player/custom_audio_player_provider.dart';
import '../../../../core/constants/styles.dart';
import '../../domain/entities/audio_file.dart';

class AudioFileCard extends ConsumerStatefulWidget {
  const AudioFileCard({required this.name, super.key});

  final String name;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AudioFileCardState();
}

class _AudioFileCardState extends ConsumerState<AudioFileCard> {
  Future<void> setAudioSource(Uint8List bytes) async {
    await ref
        .read(customAudioPlayerProvider(widget.key!).notifier)
        .setAudioSource(bytes);
  }

  Future<void> togglePlayButton() async {
    await ref
        .read(customAudioPlayerProvider(widget.key!).notifier)
        .togglePlayButton();
  }

  AudioFile? _audioFile;

  @override
  Widget build(BuildContext context) {
    bool isPlaying = ref.watch(customAudioPlayerProvider(widget.key!));
    return Container(
      color: Styles.cardBackgroundColor,
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        leading: IconButton(
          color: Styles.iconColor,
          iconSize: 42,
          onPressed: () async {
            if (_audioFile == null) {
              _audioFile ??= await ref
                  .read(audioFilesNotifierProvider.notifier)
                  .getAudioFile(widget.name);
              await setAudioSource(_audioFile!.data);
            }
            togglePlayButton();
          },
          isSelected: isPlaying,
          selectedIcon: const Icon(
            Icons.pause_circle_filled_outlined,
          ),
          icon: const Icon(
            Icons.play_circle_fill_outlined,
          ),
        ),
        title: Text(widget.name),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              color:Styles.iconColor,
                onPressed: () {
                  ref
                      .read(audioFilesNotifierProvider.notifier)
                      .shareAudioFile(widget.name);
                },
                icon: const Icon(Icons.share)),
            IconButton(
                onPressed: () {
                  ref
                      .read(audioFilesNotifierProvider.notifier)
                      .deleteAudioFile(widget.name);
                  ref
                      .read(customAudioPlayerProvider(widget.key!).notifier)
                      .stop();
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red.shade400,
                )),
          ],
        ),
      ),
    );
  }
}
