import 'package:flutter_tts/flutter_tts.dart';

FlutterTts flutterTts = FlutterTts();

void textToSpeech(String text) async {

  await flutterTts.setLanguage('tr-TR');
  await flutterTts.setVolume(2);
  await flutterTts.setSpeechRate(0.5);
  await flutterTts.setPitch(1);
  await flutterTts.speak(text);

}