import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inprosur_teach_app/presentation/providers/loading_provider.dart';
import 'package:inprosur_teach_app/presentation/providers/manual_loading_provider.dart';

class LoadingOverlay extends ConsumerWidget {
  final Widget child;
  const LoadingOverlay({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(loadingProvider);
    final isManualLoading = ref.watch(manualLoadingProvider);
    return Stack(
      children: [
        child,
        if (isLoading || isManualLoading)
          Container(
            color: Colors.black.withValues(alpha: 0.5),
            child: const Center(child: CircularProgressIndicator()),
          ),
      ],
    );
  }
}
