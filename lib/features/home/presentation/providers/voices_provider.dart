
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speakup/features/home/domain/entities/voices.dart';
import 'package:speakup/features/home/domain/usecases/module.dart';

import '../../../../core/usecases/usecase.dart';

final voicesProvider = FutureProvider<Voices>((ref) async{
    
    final voicesOrFailure= await ref.read(getVoicesProvider).excute(NoParams());
    return voicesOrFailure.fold((l) => Voices(voices: {}), (r) => r);
    
});