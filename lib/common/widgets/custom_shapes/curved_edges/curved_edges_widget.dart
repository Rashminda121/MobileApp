import 'package:flutter/material.dart';
import 'package:mobile_app/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class TCurvendEdgesWidget extends StatelessWidget {
  const TCurvendEdgesWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child: child,
    );
  }
}
