import 'package:flutter/material.dart';
import 'package:inprosur_teach_app/presentation/pages/config/model/option_model.dart';
import 'package:inprosur_teach_app/presentation/pages/config/widget/custom_config_tile.dart';
import 'package:sizer/sizer.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Configuraciones',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 3.w, vertical: 3.h),
        child: ListView(
          children: [
            ...OptionModel.getOptions().map(
              (option) => CustomConfigTile(
                title: option.title,
                subtitle: option.subtitle,
                icon: option.icon,
                route: option.route,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
