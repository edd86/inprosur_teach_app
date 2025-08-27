import 'package:flutter/material.dart';
import 'package:inprosur_teach_app/core/constants/app_routes.dart';

class OptionModel {
  final String title;
  final String subtitle;
  final IconData icon;
  final String route;

  OptionModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.route,
  });

  static List<OptionModel> getOptions() {
    return [
      OptionModel(
        title: 'Información Personal',
        subtitle: 'Modifica y/o actualiza tu información personal',
        icon: Icons.person_pin,
        route: AppRoutes.profilePage,
      ),
    ];
  }
}
