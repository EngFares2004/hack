abstract class DiscountState {}

class DiscountInitial extends DiscountState {}

class DiscountLoading extends DiscountState {}

class DiscountApplied extends DiscountState {
  final int discountAmount;
  final int totalPrice;

  DiscountApplied({required this.discountAmount, required this.totalPrice});
}

class DiscountError extends DiscountState {
  final String error;

  DiscountError(this.error);
}