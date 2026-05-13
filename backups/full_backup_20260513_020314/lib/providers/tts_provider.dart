import 'package:flutter/material.dart';
import '../services/tts_service.dart';

class TtsProvider extends ChangeNotifier {
  final TtsService _ttsService = TtsService();
  bool _isInitialized = false;
  bool _isSpeaking = false;
  bool _isEnabled = true;
  double _speechRate = 0.4;
  double _pitch = 1.0;

  bool get isInitialized => _isInitialized;
  bool get isSpeaking => _isSpeaking;
  bool get isEnabled => _isEnabled;
  double get speechRate => _speechRate;
  double get pitch => _pitch;

  TtsProvider() {
    _initialize();
  }

  Future<void> _initialize() async {
    await _ttsService.initialize();
    _isInitialized = true;
    notifyListeners();
  }

  Future<void> speak(String text) async {
    if (!_isEnabled) return;

    _isSpeaking = true;
    notifyListeners();

    await _ttsService.speak(text);

    _isSpeaking = false;
    notifyListeners();
  }

  Future<void> stop() async {
    await _ttsService.stop();
    _isSpeaking = false;
    notifyListeners();
  }

  void toggleEnabled() {
    _isEnabled = !_isEnabled;
    if (!_isEnabled) {
      _ttsService.stop();
      _isSpeaking = false;
    }
    notifyListeners();
  }

  void setEnabled(bool value) {
    if (_isEnabled != value) {
      _isEnabled = value;
      if (!_isEnabled) {
        _ttsService.stop();
        _isSpeaking = false;
      }
      notifyListeners();
    }
  }

  Future<void> setSpeechRate(double rate) async {
    _speechRate = rate;
    await _ttsService.setSpeechRate(rate);
    notifyListeners();
  }

  Future<void> setPitch(double pitch) async {
    _pitch = pitch;
    await _ttsService.setPitch(pitch);
    notifyListeners();
  }

  @override
  void dispose() {
    _ttsService.dispose();
    super.dispose();
  }
}
