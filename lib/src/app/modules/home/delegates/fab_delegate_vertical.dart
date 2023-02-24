import 'package:flutter/material.dart';

class FabDelegateVertical extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    final lastFabIndex = context.childCount -1;

    for (int i =  (lastFabIndex >= 0) as int;  --i;) {
      
    }

    context.paintChild(1,
        transform: Matrix4.translationValues(100.0, 150.0, 0));
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
}
