import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/features/notifications/notifications_bloc.dart';
import 'package:vegetable_orders_project/views/home/widgets/shimmer_loading.dart';

import '../../../../features/notifications/model.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final bloc = KiwiContainer().resolve<NotificationsBloc>()
    ..add(GetNotificationsEvent());

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  Future<void> refreshCallback() async {
    bloc.add(GetNotificationsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        thereIsIcon: false,
        title: "الإشعارات",
      ),
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: state is GetNotificationsLoading || bloc.isLoading
                ? ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 18,
                    ),
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(top: 22, bottom: 15),
                    itemBuilder: (context, index) =>
                        notificationShimmerLoading(),
                    itemCount: 15,
                  )
                : state is GetNotificationsEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppImage(
                              'assets/icon/not_found.png',
                              width: 270.w,
                              // height: 180,
                            ),
                            Text(
                              'لا توجد بيانات',
                              style: TextStyle(
                                  fontSize: 25.sp,
                                  color: mainColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                          ],
                        ),
                      )
                    : RefreshIndicator(
                        displacement: 20,
                        strokeWidth: 3,
                        backgroundColor: Colors.green[100],
                        onRefresh: refreshCallback,
                        child: ListView.builder(
                          // physics: ,
                          padding: const EdgeInsets.only(top: 22, bottom: 15),
                          itemBuilder: (context, index) => _Item(
                            model: bloc.list[index],
                          ),
                          itemCount: bloc.list.length,
                        ),
                      ),
          );
        },
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.model});
  final Notifications model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(11),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.035),
                blurRadius: 20,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsetsDirectional.only(end: 10),
                height: 33,
                width: 33,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: const Color(0xff4C8613).withAlpha(13)),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Image.network(
                    model.image ?? "assets/images/vegetable_basket.png",
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      model.body,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff989898),
                      ),
                    ),
                    Text(
                      model.createdAt,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff091022),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
