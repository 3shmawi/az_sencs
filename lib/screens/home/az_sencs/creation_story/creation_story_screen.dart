
import 'package:az_sencs/shared/components/components.dart';
import 'package:flutter/material.dart';

class CreationStoryScreen extends StatelessWidget {
  const CreationStoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(
        context,
        const RouteWhereYouGo(),
        'Info about Creation Story',
      ),
      body: Stack(
        children: [
          const MyBackgroundColor(),
          Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5.0,left: 10),
                child: Container(

                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Text(
                                  ' تم إنشاء الفريق عام 2010 بواسطة فكرة طرحها مجموعة من طلاب قسم النظم والحاسبات  ',
                                  style: TextStyle(
                                      fontFamily: 'MyFont',
                                      fontWeight: FontWeight.bold),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Text(
                                  'نشأة الفريق  ',
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
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 14),
                                child: Text(
                                  ' كانت الفكره بواسطة البشمهندس محمد طاهر وتبناها الأستاذ الدكتور علاء حموده',
                                  style: TextStyle(
                                      fontFamily: 'MyFont',
                                      fontWeight: FontWeight.bold),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Text(
                                  'المؤسس   ',
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
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 48),
                                child: Text(
                                  'وبعد ثلاث سنوات من نشأة الفريق وُلِد في محرابه معرض هندسة النظم والحاسبات كلية الهندسة جامعة الأزهر ، ومنذ ذلك الحين استمر المعرض فى التطور عام بعد الاخر وتنوعت الانشطة مابين التدريب والمدرسة الصيفية والكورسات والمنح المجانية وتنظيم المؤتمرات العملية والندوات وتنظيم الورش العملية والمعرض فى كل عام . ومنذ اللحظة الأولى لنا وما زلنا معكم ننسج خيوط الفكرة و نربطها بالواقع بأيادٍ أعطت الكثير ومازالت تسارع في العطاء  لنبنى مهندسا  قادرا عاملا مبدعا  فى شتى المجالات، بروعة التنفيذ كنا معكم وسنبقى دائما وابدا.  \n#لنُمَهِدَ_دَرْباً \n#صُنِع َفي الأزهر ',
                                  style: TextStyle(
                                      fontFamily: 'MyFont',
                                      fontWeight: FontWeight.bold),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Text(
                                  'ثم...  ',
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

                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
