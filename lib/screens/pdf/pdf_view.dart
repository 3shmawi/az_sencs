import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../shared/components/components.dart';


class PdfView extends StatelessWidget {
  final String url;

  const PdfView({required this.url, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(context, null, 'PDF View',),
      body: Stack(
        children: [
          const MyBackgroundColor(),
          Padding(
            padding: const EdgeInsets.only(right: 6.0, left: 12.0, top: 100),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(15)),
              child: SfPdfViewer.network(
                url,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
