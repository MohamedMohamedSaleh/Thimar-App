import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';

import 'shimmer_widget.dart';

class ShimmerLoadingProduct extends StatelessWidget {
  const ShimmerLoadingProduct({super.key, this.isMain = true});
  final bool isMain;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 163 / 250,
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemCount: 10,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      itemBuilder: (context, index) {
        return _productShimmerWidget(isMain: isMain);
      },
    );
  }

  Widget _productShimmerWidget({required bool isMain}) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ShimmerWidget.rectangular(
                    height: 120,
                    shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(13),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 0,
                      top: 0,
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(13),
                              topLeft: Radius.circular(13)),
                          child: ShimmerWidget.rectangular(
                            height: 20,
                            width: 60,
                          )))
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerWidget.rectangular(
                      height: 16,
                      width: 70,
                      shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ShimmerWidget.rectangular(
                      height: 16,
                      width: 50,
                      shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                ShimmerWidget.rectangular(
                  height: 30,
                  width: 30,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            isMain
                ? const ShimmerWidget.rectangular(
                    height: 30,
                    shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      );
}

Widget categoryShimmerLoading() => Column(
      children: [
        ShimmerWidget.rectangular(
          height: 35,
          width: 60,
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        ShimmerWidget.rectangular(
          height: 16,
          width: 50,
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        )
      ],
    );

Widget sliderShimmerLoading() => Column(
      children: [
        const ShimmerWidget.rectangular(
          height: 150,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              5,
              (index) => const Padding(
                padding: EdgeInsets.only(left: 4),
                child: ShimmerWidget.circular(
                  width: 8,
                  height: 8,
                ),
              ),
            ),
          ],
        )
      ],
    );

Widget orderShimmerLoading() => Shimmer.fromColors(
      baseColor: mainColor.withOpacity(.5),
      highlightColor: mainColor.withOpacity(.35),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: mainColor.withOpacity(.35),
            borderRadius: BorderRadius.circular(11)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerWidget.rectangular(
                        color: mainColor.withOpacity(.8),
                        height: 18,
                        width: 70,
                        shapeBorder: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ShimmerWidget.rectangular(
                        color: mainColor.withOpacity(.8),
                        height: 14,
                        width: 60,
                        shapeBorder: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ShimmerWidget.rectangular(
                    color: mainColor.withOpacity(.8),
                    height: 18,
                    width: 70,
                    shapeBorder: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 16,
              ),
              Row(
                children: [
                  ShimmerWidget.rectangular(
                    color: mainColor.withOpacity(.8),
                    height: 26,
                    width: 26,
                    shapeBorder: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  ShimmerWidget.rectangular(
                    color: mainColor.withOpacity(.8),
                    height: 26,
                    width: 26,
                    shapeBorder: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  ShimmerWidget.rectangular(
                    color: mainColor.withOpacity(.8),
                    height: 26,
                    width: 26,
                    shapeBorder: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  ShimmerWidget.rectangular(
                    color: mainColor.withOpacity(.8),
                    height: 26,
                    width: 26,
                    shapeBorder: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  ),
                  const Spacer(),
                  ShimmerWidget.rectangular(
                    color: mainColor.withOpacity(.8),
                    height: 18,
                    width: 60,
                    shapeBorder: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );

Widget notificationShimmerLoading() => Shimmer.fromColors(
      baseColor: mainColor.withOpacity(.5),
      highlightColor: mainColor.withOpacity(.5),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: mainColor.withOpacity(.3),
          borderRadius: BorderRadius.circular(11),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerWidget.rectangular(
                color: mainColor.withOpacity(.8),
                height: 30,
                width: 30,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerWidget.rectangular(
                      color: mainColor.withOpacity(.8),
                      height: 14,
                      width: 120,
                      shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    ShimmerWidget.rectangular(
                      color: mainColor.withOpacity(.8),
                      height: 11,
                      width: double.infinity,
                      shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    ShimmerWidget.rectangular(
                      color: mainColor.withOpacity(.8),
                      height: 10,
                      width: 100,
                      shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
