
import 'package:az_sencs/shared/components/components.dart';
import 'package:flutter/material.dart';


import '../../../../shared/network/remote/open_link_handler.dart';
import '../../../pdf/pdf_view.dart';

class PrScreen extends StatelessWidget {
  const PrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(
        context,
        const RouteWhereYouGo(),
        'Info about PR',
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
                                    'توفير كافة رغبات واحتياجات الفريق المادية والعلمية والقانونية. ',
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
                                    'إيصال رؤية ورسالة الفريق إلى الشريحة المستهدفة، القادرة على تلبية احتياجات الإدارة. ',
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
                                    'عمل التصاريح القانونية الالزمة الستمرارية نشاط الفريق وتوسعه. ',
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
                                    'إتمام الصفقات التي تيِّسر الوصول ألهداف الفريق وتحقيق رؤيته. ',
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
                                    'رفع إنتاجية الفريق، بتوفير ما يحتاجه الأعضاء من مدربين وأدوات. ',
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
                                    'دارة ماديات الفريق وتوزيع الصادرات والواردات بما يحقق أكبر إشباع ممكن لرغبات واحتياجات الفريق.  ',
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
                          padding: const EdgeInsets.only(top: 10.0),
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
                                      'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/%D9%84%D8%AC%D9%86%D8%A9%20%D8%A7%D9%84%D8%B9%D9%84%D8%A7%D9%82%D8%A7%D8%AA%20%D8%A7%D9%84%D8%B9%D8%A7%D9%85%D8%A9%20%D9%86%D9%87%D8%A7%D8%A6%D9%8A.pdf?alt=media&token=7a1cfd8f-51ac-433f-bbec-76cd8179343a')),
                          child: const Text(
                            'show pdf',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
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
                                    ' يمكنك فتح الكورسات الموجوده ب \nال pdf من خلال تحميل ال pdf \nمن هذا اللينك بمجرد فتح اللينك \nسوف يتم تحميل الملف عندها \nيمكنك فتحه من ال downloads :) ',
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
                          onPressed: () => UrlHandler.open(
                              'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/%D9%84%D8%AC%D9%86%D8%A9%20%D8%A7%D9%84%D8%B9%D9%84%D8%A7%D9%82%D8%A7%D8%AA%20%D8%A7%D9%84%D8%B9%D8%A7%D9%85%D8%A9%20%D9%86%D9%87%D8%A7%D8%A6%D9%8A.pdf?alt=media&token=7a1cfd8f-51ac-433f-bbec-76cd8179343a'),
                          child: const Text(
                            'download now',
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
