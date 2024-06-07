class AppStrings {
  static const String appName = 'SpeakUp';
  static const String homeTab = 'Home';
  static const String savedFilesTab = 'Saved Files';
  static const String hintTextField = 'Enter your text here';
  static const String hintTextDropDownMenu = 'Select a voice';
  static const String expansionTileTitle = 'Voice Settings';

  static const String stabilityVoiceSettingTitle = 'Stability';
  static const String stabilityVoiceSettingLeadingTitle = 'More variable';
  static const String stabilityVoiceSettingTrailingTitle = 'More stable';
  static const String stabilityVoiceSettingleadingIconTipMessage =
      'Increasing stability will make the voice more consistent between re-generations, but it can also make it sounds a bit monotone. On longer text fragments we recommend lowering this value.';
  static const String stabilityVoiceSettingTrailingIconTipMessage =
      'Increasing variability can make speech more expressive with output varying between re-generations. It can also lead to instabilities.';

  static const String similarityVoiceSettingTitle =
      'Clarity + Similarity Enhancement';
  static const String similarityVoiceSettingLeadingTitle = 'Low';
  static const String similarityVoiceSettingTrailingTitle = 'High';
  static const String similarityVoiceSettingLeadingIconTipMessage =
      'Low values are recommended if background artifacts are present in generated speech.';
  static const String similarityVoiceSettingTrailingIconTipMessage =
      'High enhancement boosts overall voice clarity and target speaker similarity. Very high values can cause artifacts, so adjusting this setting to find the optimal value is encouraged.';

  static const String styleVoiceSettingTitle = 'Style Exaggeration';
  static const String styleVoiceSettingLeadingTitle = 'None (Fastest)';
  static const String styleVoiceSettingTrailingTitle = 'Exaggerated';
  static const String styleVoiceSettingTrailingIconTipMessage =
      'High values are recommended if the style of the speech should be exaggerated compared to the uploaded audio. Higher values can lead to more instability in the generated speech. Setting this to 0.0 will greatly increase generation speed and is the default setting.';

  static const String generateAudioButton = 'Generate';

  static const String noSavedFiles = 'No saved files found';

  static const String serverFailureMessage = 'Please try again later';
  static const String sharingFailureMessage =
      'The requested action could not be completed';
  static const String savingFailureMessage = 'Failed to save';
  static const String permissionFailureMessage = 'Permission denied';
  static const String fetchingFailureMessage =
      'The selected file could not be fetched';
  static const String deletingFailureMessage =
      'The selected file could not be deleted';
  static const String networkFailureMessage =
      'Please check your internet connection and try again';

  static const String audioSavedMessage = 'Audio saved';
  static const String audioDeletedMessage = 'Audio deleted';
}
