import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speakup/core/constants/app_strings.dart';
import 'package:speakup/features/saved_files/presentation/providers/module.dart';
import 'package:speakup/features/saved_files/presentation/widgets/audio_file_card.dart';

class SavedFiles extends ConsumerWidget {
  const SavedFiles({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   
    final audioFiles = ref.watch(audioFilesNotifierProvider);
    
    if (audioFiles.names.isEmpty) {
      return  Center(
        child: Text(AppStrings.noSavedFiles, style: TextStyle(fontSize: Theme.of(context).textTheme.titleMedium!.fontSize)),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            height: 8,
          ),
          itemCount: audioFiles.names.length,
          itemBuilder: (context, index) {
            return AudioFileCard(
              key: UniqueKey(),
              name: audioFiles.names[index],
            );
          },
        ),
      );
    }
  }
}
