import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tts_provider.dart';
import '../theme/app_theme.dart';

class TtsSettingsScreen extends StatelessWidget {
  const TtsSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text-to-Speech Settings'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Consumer<TtsProvider>(
        builder: (context, ttsProvider, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Enable/Disable TTS
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          ttsProvider.isEnabled
                              ? Icons.volume_up
                              : Icons.volume_off,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Text-to-Speech',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              ttsProvider.isEnabled
                                  ? 'Tap kata untuk dengar pengucapan'
                                  : 'TTS dinonaktifkan',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      Switch(
                        value: ttsProvider.isEnabled,
                        onChanged: (value) {
                          ttsProvider.setEnabled(value);
                        },
                        activeTrackColor: AppTheme.primaryColor.withValues(alpha: 0.5),
                        thumbColor: WidgetStateProperty.resolveWith((states) {
                          if (states.contains(WidgetState.selected)) {
                            return AppTheme.primaryColor;
                          }
                          return Colors.grey;
                        }),
                      ),
                    ],
                  ),
                ),

                if (ttsProvider.isEnabled) ...[
                  const SizedBox(height: 24),

                  // Speech Rate
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.speed, color: AppTheme.primaryColor),
                            const SizedBox(width: 12),
                            Text(
                              'Kecepatan Ucapan',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Text('Lambat', style: TextStyle(fontSize: 12)),
                            Expanded(
                              child: Slider(
                                value: ttsProvider.speechRate,
                                min: 0.1,
                                max: 1.0,
                                divisions: 9,
                                label: _getSpeedLabel(ttsProvider.speechRate),
                                onChanged: (value) {
                                  ttsProvider.setSpeechRate(value);
                                },
                                activeColor: AppTheme.primaryColor,
                              ),
                            ),
                            const Text('Cepat', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        Center(
                          child: Text(
                            _getSpeedLabel(ttsProvider.speechRate),
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Test TTS
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tes Ucapan',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Klik tombol di bawah untuk mendengar contoh ucapan:',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                ttsProvider.speak('Hello! I am your English teacher.');
                              },
                              icon: const Icon(Icons.play_arrow),
                              label: const Text('Dengarkan'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.primaryColor,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                              ),
                            ),
                            const SizedBox(width: 16),
                            OutlinedButton.icon(
                              onPressed: () {
                                ttsProvider.stop();
                              },
                              icon: const Icon(Icons.stop),
                              label: const Text('Berhenti'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppTheme.primaryColor,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Tips
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.accentColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.lightbulb, color: AppTheme.accentColor),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tips',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: AppTheme.accentColor),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Tap ikon speaker di samping kata untuk mendengar pengucapan dalam bahasa Inggris.',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  String _getSpeedLabel(double rate) {
    if (rate <= 0.2) return 'Sangat Lambat';
    if (rate <= 0.35) return 'Lambat';
    if (rate <= 0.5) return 'Normal';
    if (rate <= 0.7) return 'Cepat';
    if (rate <= 0.85) return 'Sangat Cepat';
    return 'Tercepat';
  }
}
