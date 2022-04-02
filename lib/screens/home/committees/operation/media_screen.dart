
import 'package:az_sencs/shared/components/components.dart';
import 'package:flutter/material.dart';

import '../../../pdf/pdf_view.dart';

class MediaScreen extends StatelessWidget {
  const MediaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(
        context,
        const RouteWhereYouGo(),
        'Info about Media',
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
                        const SizedBox(height: 10,),
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
                                    'خطة تأهيل \nلجنة الميديا   ',
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
                                    'التأهيل في برنامج الفوتوشوب وذلك عن طريق بلاي لست يتم التطبيق عليها.  ',
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
                                    'التأهيل في برنامج الاليستريتور عن طريق بلاي ليست أيضا. ',
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
                                    'تمكنهم في مجال الجرافيك وإالمامهم بفنيات مختلفة . ',
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
                                    'التدريب على بوستات البيدج. ',
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
                          padding: const EdgeInsets.only(top: 80.0),
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
                                  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/%D8%A8%D9%84%D8%A7%D9%86%20%D8%A7%D9%84%D9%85%D8%AF%D9%8A%D8%A7%20.pdf?alt=media&token=156bc2ce-279b-4a24-a913-5be073ae1721')),
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
