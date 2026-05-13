import 'package:flutter/material.dart';

/// Widget wrapper yang menyesuaikan layout berdasarkan ukuran layar.
/// Desktop/Web wide: maxWidth 1200px
/// Tablet: maxWidth 800px
/// Mobile: full width
class ResponsiveWrapper extends StatelessWidget {
  final Widget child;
  final double desktopMaxWidth;
  final double tabletMaxWidth;
  final EdgeInsetsGeometry? padding;

  const ResponsiveWrapper({
    super.key,
    required this.child,
    this.desktopMaxWidth = 1200,
    this.tabletMaxWidth = 800,
    this.padding,
  });

  static bool isWideScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 900;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 600;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final maxWidth = screenWidth > 900
        ? desktopMaxWidth
        : (screenWidth > 600 ? tabletMaxWidth : double.infinity);

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: padding != null
            ? Padding(padding: padding!, child: child)
            : child,
      ),
    );
  }
}

/// Grid yang responsive - 3 kolom di desktop, 2 di tablet, 1 di mobile
class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final double runSpacing;

  const ResponsiveGrid({
    super.key,
    required this.children,
    this.spacing = 16,
    this.runSpacing = 16,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth > 900 ? 3 : (screenWidth > 600 ? 2 : 1);

    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      children: children.map((child) {
        final itemWidth = (screenWidth > 900
                ? desktopMaxWidth
                : (screenWidth > 600 ? tabletMaxWidth : screenWidth)) -
            (spacing * (crossAxisCount - 1));
        return SizedBox(
          width: itemWidth / crossAxisCount,
          child: child,
        );
      }).toList(),
    );
  }

  static const double desktopMaxWidth = 1200;
  static const double tabletMaxWidth = 800;
}

/// Layout builder untuk sidebar di desktop
class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget? tabletBody;
  final Widget? desktopBody;
  final bool showAppBar;

  const ResponsiveLayout({
    super.key,
    required this.mobileBody,
    this.tabletBody,
    this.desktopBody,
    this.showAppBar = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 900 && desktopBody != null) {
      return desktopBody!;
    } else if (screenWidth > 600 && tabletBody != null) {
      return tabletBody!;
    } else {
      return mobileBody;
    }
  }
}
