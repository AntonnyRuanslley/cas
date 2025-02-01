import 'package:flutter/material.dart';

import '../widgets/custom/empty_list.dart';
import '../widgets/custom/page_base_structure.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageBaseStructure(
      title: "Relatório",
      child: EmptyList(message: "Em desencolvimento..."),
    );
  }
}
