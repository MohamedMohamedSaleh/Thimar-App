import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/features/cart/cart_cubit.dart';
import 'package:vegetable_orders_project/features/products/update_amount/update_amount_cubit.dart';
import 'package:vegetable_orders_project/features/products/update_amount/update_amount_states.dart';

class CustomPlusOrMinusProduct extends StatefulWidget {
  CustomPlusOrMinusProduct({
    super.key,
    this.isProductDetails = true,
    required this.id,
    required this.amount,
  });
  final bool isProductDetails;
  final int id;
  int amount;

  @override
  State<CustomPlusOrMinusProduct> createState() =>
      _CustomPlusOrMinusProductState();
}

class _CustomPlusOrMinusProductState extends State<CustomPlusOrMinusProduct> {
  late UpdateAmountCubit updateCubit;
  @override
  void initState() {
    super.initState();
    updateCubit = BlocProvider.of(context);
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
                if(widget.amount >=1){
                updateCubit.addOne(id: widget.id, amount: widget.amount);

                updateCubit.updateData(amount: (widget.amount), id: widget.id, isAdd: true);
                if (!widget.isProductDetails) {
                  BlocProvider.of<CartCubit>(context)
                      .showCart(isLoading: false);
                }
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
              child: BlocConsumer<UpdateAmountCubit, UpdateAmountStates>(
                  listener: (context, state) {
                if ((state is AddOneSuccessState && state.id == widget.id)) {
                  widget.amount++;
                } else if (state is MinusOneSuccessState &&
                    state.id == widget.id) {
                  widget.amount--;
                }
              }, builder: (context, state) {
                return Text(
                  '${widget.amount}',
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
                if(widget.amount>= 2){
                updateCubit.minusOne(id: widget.id, amount: widget.amount);

                updateCubit.updateData(amount: (widget.amount), id: widget.id, isAdd: false);

                if (!widget.isProductDetails) {
                  BlocProvider.of<CartCubit>(context)
                      .showCart(isLoading: false);
                }
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
