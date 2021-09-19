import 'package:flutter/material.dart';

class BadgeIcon extends StatelessWidget {
  final icon;
  final iconPath;
  final size;
  final color;
  final isBadgeVisible;
  final isCloser;
  BadgeIcon({
    this.icon,
    this.size = 32.0,
    this.color = Colors.white,
    this.isBadgeVisible = false,
    this.iconPath,
    this.isCloser = true,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: icon != null
              ? Icon(
                  icon,
                  size: size,
                  color: color,
                )
              : ImageIcon(
                  AssetImage(iconPath),
                  color: Colors.white,
                  size: size,
                ),
        ),
        if (isBadgeVisible)
          Positioned(
            right: isCloser ? 8 : 0,
            child: Container(
              width: 9.0,
              height: 9.0,
              decoration: new BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    blurRadius: 8.0,
                  ),
                ],
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          )
      ],
    );
  }
}
