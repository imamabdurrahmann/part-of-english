import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double size;
  final BoxFit fit;
  final Color? color;

  const LogoWidget({
    super.key,
    this.size = 100,
    this.fit = BoxFit.contain,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Image.asset(
        'assets/images/logo.png',
        fit: fit,
        width: size,
        height: size,
        color: color,
        filterQuality: FilterQuality.high,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(size * 0.2),
            ),
            child: Icon(
              Icons.school,
              size: size * 0.5,
              color: Theme.of(context).primaryColor,
            ),
          );
        },
      ),
    );
  }
}
