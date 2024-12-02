abstract class DiscountEvent {}

class ApplyDiscountEvent extends DiscountEvent {
  final String voucherCode;

  ApplyDiscountEvent(this.voucherCode);
}
