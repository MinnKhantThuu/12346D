import 'package:app/provider/setting_provider.dart';
import 'package:app/screen/profile.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/uis.dart';
import 'package:app/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';

import '../model/slide.dart';
import '../provider/slide_provider.dart';
import '../provider/auth_provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    double mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        centerTitle: true,
        title: GestureDetector(
          onTap: () {
            v();
            Navigator.of(context).pushNamed(Profile.routeName);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text(
                // text: 'မောင်ပြုံး',
                text: context.read<AuthProvider>().user.name,
                family: 'Myanmar',
                weight: FontWeight.bold,
              ),
              text(
                // text: '2000000',
                text: context.read<AuthProvider>().user.money.toString(),
                family: 'Fira',
                weight: FontWeight.bold,
              ),
            ],
          ),
        ),
        // actions: [
        //   Stack(
        //     children: [
        //       Padding(
        //         padding: EdgeInsets.all(
        //           10,
        //         ),
        //         child: GestureDetector(
        //           onTap: () {
        //             v();
        //           },
        //           child: Icon(
        //             Icons.mail,
        //             color: ACCENT_2,
        //             size: 35,
        //           ),
        //         ),
        //       ),
        //       Positioned(
        //         top: 5,
        //         right: 5,
        //         child: Container(
        //           width: 20,
        //           height: 20,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: ACCENT_3,
        //           ),
        //           child: Center(
        //             child: text(
        //               text: '99',
        //               family: 'Fira',
        //               size: 10,
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   )
        // ],
      ),
      body: Container(
        width: mWidth,
        height: mHeight,
        decoration: BoxDecoration(
          gradient: gradient(),
        ),
        child: Stack(
          children: [
            Center(
              child: Row(
                children: [
                  Expanded(child: Image.asset('assets/images/dolay.png')),
                  Expanded(child: Image.asset('assets/images/messi.png'))
                ],
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SizedBox(
                      width: mWidth,
                      height: 150,
                      child: _getSlide(context),
                    ),
                  ),
                  text(
                    text: 'ဟိန်းဟိန်း',
                    family: 'Myanmar',
                    weight: FontWeight.bold,
                    size: 35,
                  ),
                  Expanded(
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      itemCount: category.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                      ),
                      itemBuilder: (context, i) => gridLayout(
                          context, category[i].name, category[i].route),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    child: Center(
                      child: Marquee(
                        text: context
                            .watch<SettingProvider>()
                            .setting
                            .homeMarquee,
                        style: TextStyle(
                          fontFamily: 'Myanmar',
                          color: Color(0xff399EDD),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: SafeArea(child: UiDrawer()),
    );
  }

  Widget _getSlide(BuildContext context) {
    List<Slide> slide = context.watch<SlideProvider>().slide;
    if (slide.isNotEmpty) {
      return Swiper(
        itemBuilder: (context, i) => Image.network(
          slide[i].image,
          fit: BoxFit.cover,
        ),
        itemCount: slide.length,
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        autoplayDelay: 3000,
      );
    }
    return Center(
      child: text(
        text: 'No Slide Found',
        family: 'Fira',
        size: 26,
      ),
    );
  }

  Widget gridLayout(context, String title, String route) {
    return InkWell(
      onTap: () {
        v();
        Navigator.of(context).pushNamed(route);
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: SECONDARY_COLOR,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                offset: Offset(1, 1),
                blurRadius: 3,
              ),
            ]),
        child: Center(
          child: text(
            text: title,
            color: Colors.white,
            size: 25,
            weight: FontWeight.bold,
            family: 'Myanmar',
          ),
        ),
      ),
    );
  }
}
