import 'package:az_sencs/shared/components/components.dart';
import 'package:flutter/material.dart';

import '../../../pdf/pdf_view.dart';

class HrScreen extends StatelessWidget {
  const HrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(
        context,
        const RouteWhereYouGo(),
        'Info about HRM',
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
                          padding:
                              const EdgeInsets.only(right: 15.0, top: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    'الرؤيه   ',
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
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 8.0,
                            left: 8.0,
                            bottom: 8.0,
                            top: 5,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text(
                                    'جعل HRM نموذج لخدمة عالية الجودة وسرعة الاستجابة.',
                                    style: TextStyle(
                                      fontFamily: 'MyFont',
                                    ),
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 48.0, top: 10),
                                child: CircleAvatar(
                                  backgroundColor: Colors.green,
                                  radius: 5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    'الرساله   ',
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
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 8.0,
                            left: 8.0,
                            bottom: 8.0,
                            top: 5,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text(
                                    'تهيئة بيئة عمل ايجابية ومحفزة وجاذبة للكفاءات، وتطبيق سياسات ونظم عادلة وداعمة للاداء والانجاز.',
                                    style: TextStyle(
                                      fontFamily: 'MyFont',
                                    ),
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 48.0, top: 10),
                                child: CircleAvatar(
                                  backgroundColor: Colors.green,
                                  radius: 5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 100.0),
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
                                    ' للمزيد open this link   ',
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
                                      'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/HEM%20AZ-SENCS.pdf?alt=media&token=8aef38b6-7c35-44bc-98fe-2a27671d0f63')),
                          child: const Text(
                            'عرض المحتوى',
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
