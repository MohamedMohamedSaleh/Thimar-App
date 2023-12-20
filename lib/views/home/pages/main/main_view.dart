import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_input.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List images = [
      'https://st2.depositphotos.com/1011549/5583/i/950/depositphotos_55831725-stock-photo-fresh-fruits-and-vegetables.jpg',
      'https://st2.depositphotos.com/1011549/5583/i/950/depositphotos_55831725-stock-photo-fresh-fruits-and-vegetables.jpg',
      'https://st2.depositphotos.com/1011549/5583/i/950/depositphotos_55831725-stock-photo-fresh-fruits-and-vegetables.jpg',
      'https://st2.depositphotos.com/1011549/5583/i/950/depositphotos_55831725-stock-photo-fresh-fruits-and-vegetables.jpg',
    ];
    return Scaffold(
      appBar: const MainAppBar(),
      body: ListView(
        // padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomAppInput(
              labelText: "ابحث عن ماتريد؟",
              prefixIcon: "assets/icon/svg/search.svg",
              fillColor: const Color(0xff4C8613).withOpacity(.03),
              paddingBottom: 0,
            ),
          ),
          StatefulBuilder(
            builder: (context, setState1) {
              return Column(
                children: [
                  CarouselSlider(
                    items: List.generate(
                      images.length,
                      (index) => AppImage(
                        images[index],
                        fit: BoxFit.fill,
                      ),
                    ),
                    options: CarouselOptions(
                      height: 164,
                      onPageChanged: (index, reason) {
                        currentIndex = index;
                        setState1(() {});
                      },
                      autoPlay: true,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      images.length,
                      (index) => Padding(
                        padding: const EdgeInsetsDirectional.only(end: 4),
                        child: CircleAvatar(
                          radius: (index == currentIndex) ? 5 : 4,
                          backgroundColor: (index == currentIndex)
                              ? Theme.of(context).primaryColor
                              : const Color(0xff61880c).withOpacity(.5),
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 55,
        child: Row(
          children: [
            Image.asset(
              'assets/images/vegetable_basket.png',
              fit: BoxFit.scaleDown,
              height: 21,
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              'سلة ثمار',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            Expanded(
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                        text: "التوصيل إلى",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                    const TextSpan(text: '\n'),
                    TextSpan(
                      text: "شارع الملك فهد - جدة",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Badge(
              offset: const Offset(5, -5),
              alignment: AlignmentDirectional.topStart,
              label: const Text(
                "3",
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Theme.of(context).primaryColor,
              child: Container(
                height: 33,
                width: 33,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(.13),
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
