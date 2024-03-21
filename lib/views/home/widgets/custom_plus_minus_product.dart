import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/features/cart/cart_bloc.dart';

class CustomPlusOrMinusProduct extends StatefulWidget {
  const CustomPlusOrMinusProduct({
    super.key,
    this.isProductDetails = true,
    required this.id,
    required this.index,
  });
  final bool isProductDetails;
  final int id;
  final int index;

  @override
  State<CustomPlusOrMinusProduct> createState() =>
      _CustomPlusOrMinusProductState();
}

class _CustomPlusOrMinusProductState extends State<CustomPlusOrMinusProduct> {
  final bloc = KiwiContainer().resolve<CartBloc>();
  // late UpdateAmountCubit updateCubit;
  int amountProduct = 1;
  @override
  void initState() {
    super.initState();
    // updateCubit = BlocProvider.of(context);
  }

  // int amount = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.isProductDetails ? 33 : 26,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: const Color(0xff4C8613).withOpacity(0.11),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: widget.isProductDetails ? 5 : 2,
              vertical: widget.isProductDetails ? 3 : 2),
          child: Row(children: [
            InkWell(
              onTap: () {
                if (widget.isProductDetails) {
                  if (bloc.amountProduct >= 1) {
                    bloc.add(CounterProductsEvent(isAdd: true));
                    setState(() {});
                  }
                } else if (bloc.list[widget.index].amount >= 1) {
                  // updateCubit.addOne(id: widget.id, amount: widget.amount);

                  bloc.add(UpdateProductCartEvent(
                      amount: ++bloc.list[widget.index].amount, id: widget.id));
                }
              },
              child: SizedBox(
                height: widget.isProductDetails ? 27 : 21,
                width: widget.isProductDetails ? 27 : 21,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          widget.isProductDetails ? 9 : 6),
                      color: Colors.white),
                  child: Icon(
                    Icons.add,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: widget.isProductDetails ? 15 : 8),
              child: BlocBuilder(
                  bloc: bloc,
                  builder: (context, state) {
                    return Text(
                      '${widget.isProductDetails ? bloc.amountProduct : bloc.list[widget.index].amount}',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: widget.isProductDetails ? 15 : 11,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }),
            ),
            InkWell(
              onTap: () {
                if (widget.isProductDetails) {
                  if (bloc.amountProduct > 1) {
                    bloc.add(CounterProductsEvent(isAdd: false));
                    setState(() {});
                  }
                } else if (bloc.list[widget.index].amount >= 2) {
                  bloc.add(UpdateProductCartEvent(
                      amount: --bloc.list[widget.index].amount, id: widget.id));
                }
              },
              child: SizedBox(
                height: widget.isProductDetails ? 27 : 21,
                width: widget.isProductDetails ? 27 : 21,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          widget.isProductDetails ? 9 : 6),
                      color: Colors.white),
                  child: Icon(
                    Icons.remove,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
