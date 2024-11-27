import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class ViewPDF extends StatelessWidget {
  const ViewPDF({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: PDF().cachedFromUrl(
             'https://ontheline.trincoll.edu/images/bookdown/sample-local-pdf.pdf',
             placeholder: (progress) => Center(child: Text('$progress %')),
             errorWidget: (error) => Center(child: Text(error.toString())),
           ),

      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: PDF(
      //     enableSwipe: true,
      //     swipeHorizontal: false,
      //     autoSpacing: false,
      //     pageFling: false,
      //     backgroundColor: Colors.grey,
      //     onError: (error) {
      //       print(error.toString());
      //     },
      //     onPageError: (page, error) {
      //       print('$page: ${error.toString()}');
      //     },
      //   ).fromAsset('assets/pdf/flutter_tutorial.pdf'),
      // ),
    );
  }
}
