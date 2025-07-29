
import 'package:flutter/material.dart';
import 'package:inprosur_teach_app/core/constants/app_theme.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        Positioned(
          top: 5,
          right: 5,
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppTheme().tertiaryLight,
              shape: BoxShape.circle,
            ),
            child: Text(
              '5',
              style: TextStyle(
                color: AppTheme().primaryLight,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
