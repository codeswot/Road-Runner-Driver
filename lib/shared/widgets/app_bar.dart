import 'package:flutter/material.dart';
import 'package:road_runner_rider/shared/shared.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, this.title, this.onBack, this.bottom})
      : super(key: key);
  final String? title;
  final Widget? bottom;
  final VoidCallback? onBack;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    padding: const EdgeInsets.all(0),
                    tooltip: 'Back',
                    onPressed: onBack ?? () => context.pop(),
                    icon: const Icon(Icons.arrow_back)),
                Text(
                  title ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenRatio.widthRatio * 23,
                  ),
                ),
                const IconButton(
                    tooltip: 'empty', onPressed: null, icon: SizedBox.shrink()),
              ],
            ),
          ),
          if (bottom != null) ...[
            // SizedBox(height: 40 * ScreenRatio.heightRatio),
            bottom!,
          ]
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(bottom != null ? 100 : 70);
}
