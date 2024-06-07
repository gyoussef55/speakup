import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speakup/features/home/presentation/widgets/floating_audio_player.dart';
import 'package:speakup/features/home/presentation/widgets/voice_setting.dart';
import '../../../../core/constants/app_strings.dart';
import '../../domain/entities/generated_audio.dart';
import '../providers/audio_generated_provider.dart';
import '../providers/voice_settings_providers.dart';
import '../providers/voices_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final textFieldController = TextEditingController();

  String voiceId = '';
  bool isGeneratingAudio = false;

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuEntry> voices = [];
    GeneratedAudio? generatedAudio = ref.watch(generatedAudioNotifierProvider);
    ref.watch(voicesProvider).value?.voices.forEach((key, value) {
      voices.add(DropdownMenuEntry(value: value, label: key));
    });
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.25,
                      child: TextField(
                        controller: textFieldController,
                        textAlignVertical: TextAlignVertical.top,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        expands: true,
                        maxLength: 2500,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: AppStrings.hintTextField,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    DropdownMenu(
                      hintText: AppStrings.hintTextDropDownMenu,
                      width: width - 32,
                      menuHeight: height * 0.25,
                      dropdownMenuEntries: voices,
                      onSelected: (value) {
                        voiceId = value;
                      },
                    ),
                    const SizedBox(height: 16),
                    ExpansionTile(
                      title: const Text(AppStrings.expansionTileTitle),
                      children: [
                        VoiceSetting(
                          title: AppStrings.stabilityVoiceSettingTitle,
                          sliderValue: stabilityProvider,
                          leadingTitle:
                              AppStrings.stabilityVoiceSettingLeadingTitle,
                          trailingTitle:
                              AppStrings.stabilityVoiceSettingTrailingTitle,
                          trailingIconTipMessage: AppStrings
                              .stabilityVoiceSettingTrailingIconTipMessage,
                          leadingIconTipMessage: AppStrings
                              .stabilityVoiceSettingleadingIconTipMessage,
                        ),
                        VoiceSetting(
                          title: AppStrings.similarityVoiceSettingTitle,
                          sliderValue: similarityProvider,
                          leadingTitle:
                              AppStrings.similarityVoiceSettingLeadingTitle,
                          trailingTitle:
                              AppStrings.similarityVoiceSettingTrailingTitle,
                          leadingIconTipMessage: AppStrings
                              .similarityVoiceSettingLeadingIconTipMessage,
                          trailingIconTipMessage: AppStrings
                              .similarityVoiceSettingTrailingIconTipMessage,
                        ),
                        VoiceSetting(
                          title: AppStrings.styleVoiceSettingTitle,
                          sliderValue: styleProvider,
                          leadingTitle:
                              AppStrings.styleVoiceSettingLeadingTitle,
                          trailingTitle:
                              AppStrings.styleVoiceSettingTrailingTitle,
                          trailingIconTipMessage: AppStrings
                              .styleVoiceSettingTrailingIconTipMessage,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (isGeneratingAudio)
                            ? null
                            : () {
                                if (textFieldController.text.isNotEmpty &&
                                    voiceId.isNotEmpty) {
                                  setState(() {
                                    isGeneratingAudio = true;
                                  });

                                  ref
                                      .read(generatedAudioNotifierProvider
                                          .notifier)
                                      .generateAudio({
                                    'text': textFieldController.text,
                                    'similarity': ref
                                        .read(similarityProvider.notifier)
                                        .state,
                                    'stability': ref
                                        .read(stabilityProvider.notifier)
                                        .state,
                                    'style':
                                        ref.read(styleProvider.notifier).state,
                                    'voiceId': voiceId,
                                  }).then((value) {
                                    setState(() {
                                      isGeneratingAudio = false;
                                    });
                                  });
                                }
                              },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (isGeneratingAudio)
                              Container(
                                height: 20,
                                width: 20,
                                margin: const EdgeInsets.all(4),
                                child: const CircularProgressIndicator(),
                              ),
                            Text(AppStrings.generateAudioButton,
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .fontSize)),
                          ],
                        ),
                      ),
                    ),
                    (generatedAudio != null)
                        ? const SizedBox(
                            height: 100,
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
          (generatedAudio != null)
              ? const Align(
                  alignment: Alignment.bottomCenter,
                  child: FloatingAudioPlayer())
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
