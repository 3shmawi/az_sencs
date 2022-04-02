
import 'package:az_sencs/shared/components/components.dart';
import 'package:flutter/material.dart';


import '../../../../shared/network/remote/open_link_handler.dart';
import '../../../pdf/pdf_view.dart';

class JavaScreen extends StatelessWidget {
  const JavaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(
        context,
        const RouteWhereYouGo(),
        'Info about Java',
      ),
      body: Stack(
        children: [
          const MyBackgroundColor(),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0, left: 10, bottom: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    ' تم جمع المعلومات الكافيه عن لجنة ال Java  \n في pdf للاطلاع عليه open this link  :)',
                                    style: TextStyle(
                                        fontFamily: 'MyFont',
                                        fontWeight: FontWeight.bold),
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () => navigateTo(
                              context,
                              const PdfView(
                                  url:
                                  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/JAVA.pdf?alt=media&token=787b99d1-399c-4482-827f-fddc0006c8e7')),
                          child: const Text(
                            'show pdf',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
