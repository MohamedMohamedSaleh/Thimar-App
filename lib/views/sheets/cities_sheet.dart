import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/models/cities_model.dart';

class CitiesSheet extends StatefulWidget {
  const CitiesSheet({super.key});

  @override
  State<CitiesSheet> createState() => _CitiesSheetState();
}

class _CitiesSheetState extends State<CitiesSheet> {
  late CitiesDataModel model;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getCityData();
  }

  void getCityData() async {
    var response =
        await Dio().get("https://thimar.amr.aait-d.com/api/cities/1");
    model = CitiesDataModel.fromJson(response.data);
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "اختر مدينتك",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12,),
            isLoading
                ? const Expanded(
                    child: Center(
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                : Expanded(
                  child: Container(
                      color: Colors.white,
                      child: ListView.builder(
                        itemBuilder: (context, index) => _Item(
                          city: model.cityData[index],
                        ),
                        itemCount: model.cityData.length,
                      ),
                    ),
                ),
          ],
        ));
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
    required this.city,
  }) : super(key: key);
  final CityModel city;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: () {
          Navigator.pop(context, city);
        },
        child: Container(
          height: 32,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(.5),
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Text(city.name),
          ),
        ),
      ),
    );
  }
}
