import 'package:flutter_bloc/flutter_bloc.dart';
import 'discount_events.dart';
import 'discount_states.dart';

class DiscountBloc extends Bloc<DiscountEvent, DiscountState> {
  final String validCode = "DISCOUNT50";
  final double subtotal;
  final double tax;

  DiscountBloc({required this.subtotal, required this.tax}) : super(DiscountInitial()) {
    on<ApplyDiscountEvent>((event, emit) async {
      emit(DiscountLoading());
      await Future.delayed(const Duration(seconds: 2));

      double totalAmount = _calculateTotalAmount();

      if (event.voucherCode == validCode) {
        double discountAmount = _calculateDiscountAmount(totalAmount, 0.5);
        double discountedTotal = totalAmount - discountAmount;

        emit(DiscountApplied(
          discountAmount: discountAmount.toInt(),
          totalPrice: discountedTotal.toInt(),
        ));
      } else {
        emit(DiscountError("Invalid discount code"));
      }
    });
  }

  double _calculateTotalAmount() {
    return subtotal + tax;
  }

  double _calculateDiscountAmount(double totalAmount, double discountRate) {
    return totalAmount * discountRate;
  }
}