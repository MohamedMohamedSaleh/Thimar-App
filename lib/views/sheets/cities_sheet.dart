import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/features/get_cities/bloc/get_cities_bloc.dart';
import 'package:vegetable_orders_project/models/cities_model.dart';

class CitiesSheet extends StatefulWidget {
  const CitiesSheet({super.key});

  @override
  State<CitiesSheet> createState() => _CitiesSheetState();
}

class _CitiesSheetState extends State<CitiesSheet> {
  final bloc = KiwiContainer().resolve<GetCitiesBloc>()..add(GetCitiesEvent());

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.h,
      child: ColoredBox(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20).w,
          child: Column(
            children: [
              Text(
                "اختر مدينتك",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12.h,
              ),
              BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  if (state is GetCitiesLoadingState) {
                    return Expanded(
                      child: Center(
                        child: SizedBox(
                          height: 30.w,
                          width: 30.w,
                          child: const CircularProgressIndicator(),
                        ),
                      ),
                    );
                  } else if (state is GetCitieSuccessState) {
                    return Expanded(
                      child: Container(
                        color: Colors.white,
                        child: ListView.builder(
                          itemBuilder: (context, index) => _Item(
                            city: state.cityData[index],
                          ),
                          itemCount: state.cityData.length,
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.city,
  }) : super();
  final CityModel city;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: InkWell(
        onTap: () {
          Navigator.pop(context, city);
        },
        child: Container(
          height: 32.h,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(.5),
              borderRadius: BorderRadius.circular(9).w),
          child: Center(
            child: Text(city.name),
          ),
        ),
      ),
    );
  }
}
