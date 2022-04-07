import 'package:flutter/material.dart';
import 'package:senior_project/models/module.dart';
import 'package:senior_project/theme.dart';

class ModuleButton extends StatelessWidget {
  final void Function()? onTap;
  final Module module;

  const ModuleButton({Key? key, required this.onTap, required this.module})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: CustomColors.white,
            radius: 70,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/${module.iconFile}'),
              radius: 65,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            module.name,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: CustomColors.white),
          ),
        ],
      ),
    );
  }
}
