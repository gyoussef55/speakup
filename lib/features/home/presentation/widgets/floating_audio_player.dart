import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speakup/core/audio_player/custom_audio_player_provider.dart';
import 'package:speakup/features/home/domain/entities/generated_audio.dart';
import 'package:speakup/features/home/presentation/providers/audio_generated_provider.dart';

import '../../../../core/constants/styles.dart';

class FloatingAudioPlayer extends ConsumerStatefulWidget {
  const FloatingAudioPlayer({super.key});

  @override
  ConsumerState createState() => _FloatingAudioPlayerState();
}

class _FloatingAudioPlayerState extends ConsumerState<FloatingAudioPlayer> {
  Future<void> setAudioSource(Uint8List bytes) async {
    await ref
        .read(customAudioPlayerProvider(null).notifier)
        .setAudioSource(bytes);
  }

  Future<void> togglePlayButton() async {
    await ref.read(customAudioPlayerProvider(null).notifier).togglePlayButton();
  }

  bool isSaving = false;
  @override
  void initState() {
    super.initState();
    setAudioSource(ref.read(generatedAudioNotifierProvider)!.bytes);
  }

  @override
  Widget build(BuildContext context) {
    final generatedAudio = ref.watch(generatedAudioNotifierProvider);

    ref.listen<GeneratedAudio?>(generatedAudioNotifierProvider, (prev, next) {
      if (next != null && prev?.bytes != next.bytes) {
        setAudioSource(next.bytes);
      }
    });

    return Container(
      color: Styles.cardBackgroundColor,
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        leading: IconButton(
          color: Styles.iconColor,
          iconSize: 42,
          icon: const Icon(
            Icons.play_circle_fill_outlined,
          ),
          isSelected: ref.watch(customAudioPlayerProvider(null)),
          selectedIcon: const Icon(Icons.pause_circle_filled_outlined),
          onPressed: togglePlayButton,
        ),
        title: Text(generatedAudio!.name),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                color: Styles.iconColor,
                onPressed: () {
                  ref
                      .read(generatedAudioNotifierProvider.notifier)
                      .shareGeneratedAudio();
                },
                icon: const Icon(Icons.share)),
            IconButton(
                color: Styles.iconColor,
                onPressed: (isSaving)
                    ? null
                    : () {
                        setState(() {
                          isSaving = true;
                        });
                        ref
                            .read(generatedAudioNotifierProvider.notifier)
                            .saveGeneratedAudio()
                            .then((value) {
                          setState(() {
                            isSaving = false;
                          });
                        });
                      },
                icon: const Icon(Icons.download_for_offline_rounded)),
            IconButton(
                color: Styles.iconColor,
                onPressed: () {
                  ref
                      .read(generatedAudioNotifierProvider.notifier)
                      .disposeGeneratedAudio();
                  ref.read(customAudioPlayerProvider(null).notifier).stop();
                },
                icon: const Icon(
                  Icons.close_outlined,
                )),
          ],
        ),
      ),
    );
  }
}
