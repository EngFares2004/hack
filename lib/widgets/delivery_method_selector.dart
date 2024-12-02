import 'package:flutter/cupertino.dart';
import 'package:untitled1/widgets/select_delivery_card.dart';
class DeliveryMethodSelector extends StatefulWidget {
  const DeliveryMethodSelector({Key? key}) : super(key: key);

  @override
  _DeliveryMethodSelectorState createState() => _DeliveryMethodSelectorState();
}

class _DeliveryMethodSelectorState extends State<DeliveryMethodSelector> {
  int selectedMethod = -1;

  void onSelectMethod(int method) {
    setState(() {
      selectedMethod = method;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SelectDeliveryCard (
          label: 'Delivery',
          iconPath: 'assets/icons/delivery.svg',
          isSelected: selectedMethod == 0,
          onTap: () => onSelectMethod(0),
        ),
        const SizedBox(width: 16),
        SelectDeliveryCard (
          label: 'Pickup',
          iconPath: 'assets/icons/shoping.svg',
          isSelected: selectedMethod == 1,
          onTap: () => onSelectMethod(1),
        ),
      ],
    );
  }
}
