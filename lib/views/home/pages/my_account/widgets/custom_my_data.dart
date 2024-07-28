import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';

import '../../../../../core/widgets/app_image.dart';
import '../bloc/edit_profile/edit_profile_bloc.dart';
import '../bloc/get_profile/profile_bloc.dart';

class CustomMyData extends StatefulWidget {
  const CustomMyData({super.key, this.isMain = true});
  final bool isMain;

  @override
  State<CustomMyData> createState() => _CustomMyDataState();
}

class _CustomMyDataState extends State<CustomMyData> {
  final bloc = KiwiContainer().resolve<ProfileBloc>()..add(GetProfileEvent());
  final editProfileBloc = KiwiContainer().resolve<EditProfilBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        if (state is GetProfileDataSuccessState) {
          return Column(
            children: [
              FadeIn(
                duration: const Duration(milliseconds: 500),
                child: StatefulBuilder(
                  builder: (context, setState1) => Container(
                    alignment: Alignment.center,
                    clipBehavior: Clip.antiAlias,
                    height: 70,
                    width: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: editProfileBloc.imagePath != null
                            ? FileImage(
                                File(
                                  editProfileBloc.imagePath!,
                                ),
                              )
                            : CachedNetworkImageProvider(
                                state.data.image,
                              ) as ImageProvider,
                      ),
                    ),
                    child: widget.isMain
                        ? const SizedBox()
                        : GestureDetector(
                            onTap: () async {
                              final file = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              if (file != null) {
                                editProfileBloc.imagePath = file.path;
                                setState1(() {});
                              }
                            },
                            child: const AppImage(
                              'assets/icon/svg/account/Camera.svg',
                              height: 25,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
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
                "+${state.data.phone}",
                style: TextStyle(
                  color: widget.isMain
                      ? const Color(0xffA2D273)
                      : const Color(0xffA7A7A7),
                  fontSize: widget.isMain ? 14 : 16,
                  fontWeight: FontWeight.w400,
                ),
                textDirection: TextDirection.ltr,
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
