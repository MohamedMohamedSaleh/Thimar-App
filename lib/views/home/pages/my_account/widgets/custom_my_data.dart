import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';

import '../../../../../core/widgets/app_image.dart';
import '../bloc/profile_bloc.dart';

class CustomMyData extends StatefulWidget {
  const CustomMyData({super.key, this.isMain = true});
  final bool isMain;

  @override
  State<CustomMyData> createState() => _CustomMyDataState();
}

class _CustomMyDataState extends State<CustomMyData> {
  final bloc = KiwiContainer().resolve<ProfileBloc>()..add(GetProfileEvent());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        if (state is GetProfileDataSuccessState) {
          return Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Stack(
                  children: [
                    AppImage(
                      state.data.image,
                      height: 70,
                      width: 75,
                      fit: BoxFit.cover,
                    ),
                    widget.isMain
                        ? const SizedBox()
                        : const Positioned(
                            top: 30,
                            right: 28,
                            child: AppImage(
                              'assets/icon/svg/account/Camera.svg',
                            )),
                  ],
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                state.data.fullname,
                style: TextStyle(
                    color: widget.isMain ? Colors.white : mainColor,
                    fontSize: widget.isMain ? 14 : 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                state.data.phone,
                style: TextStyle(
                  color: widget.isMain
                      ? const Color(0xffA2D273)
                      : const Color(0xffA7A7A7),
                  fontSize: widget.isMain ? 14 : 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          );
        } else {
          return const SizedBox(
            height: 110,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
