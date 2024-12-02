import 'package:flutter/material.dart';
import 'package:untitled1/configuration/theme.dart';
import '../models/selectobject_model.dart';

class SelectedGovernorate extends StatefulWidget {
  const SelectedGovernorate({super.key});

  @override
  State<SelectedGovernorate> createState() => _SelectedGovernorateState();
}

class _SelectedGovernorateState extends State<SelectedGovernorate> {
  SelectObject value = SelectObject(value: -1, title: '', subtitle: '');

  final List<SelectObject> governorates = [
    SelectObject(title: "Cairo", subtitle: "Capital city of Egypt", value: 1),
    SelectObject(title: "Alexandria", subtitle: "Mediterranean port city", value: 2),
    SelectObject(title: "Giza", subtitle: "Pyramids and ancient monuments", value: 3),
    SelectObject(title: "Luxor", subtitle: "Known for its ancient temples", value: 4),
    SelectObject(title: "Aswan", subtitle: "Famous for its Nubian culture", value: 5),
    SelectObject(title: "Sharm El Sheikh", subtitle: "Popular Red Sea resort", value: 6),
    SelectObject(title: "Port Said", subtitle: "Mediterranean port city", value: 7),
    SelectObject(title: "Suez", subtitle: "Suez Canal city", value: 8),
    SelectObject(title: "Ismailia", subtitle: "Situated on the Suez Canal", value: 9),
    SelectObject(title: "Mansoura", subtitle: "City in the Nile Delta", value: 10),
    SelectObject(title: "Tanta", subtitle: "Located in the Nile Delta", value: 11),
    SelectObject(title: "Damanhour", subtitle: "Capital of Beheira Governorate", value: 12),
    SelectObject(title: "Fayoum", subtitle: "Known for its ancient ruins and lakes", value: 13),
    SelectObject(title: "Minya", subtitle: "Located in Upper Egypt", value: 14),
    SelectObject(title: "Assiut", subtitle: "Located in Upper Egypt", value: 15),
    SelectObject(title: "Beni Suef", subtitle: "Located in Middle Egypt", value: 16),
    SelectObject(title: "Sohag", subtitle: "Located in Upper Egypt", value: 17),
    SelectObject(title: "Kafr El Sheikh", subtitle: "Located in the Nile Delta", value: 18),
    SelectObject(title: "Gharbia", subtitle: "Located in the Nile Delta", value: 19),
    SelectObject(title: "Qena", subtitle: "Located in Upper Egypt", value: 20),
    SelectObject(title: "Damietta", subtitle: "Located on the Mediterranean coast", value: 21),
    SelectObject(title: "Monufia", subtitle: "Located in the Nile Delta", value: 22),
    SelectObject(title: "Sharkia", subtitle: "Located in the Nile Delta", value: 23),
    SelectObject(title: "Red Sea", subtitle: "Known for its coastal resorts", value: 24),
    SelectObject(title: "Beheira", subtitle: "Located in the Nile Delta", value: 25),
    SelectObject(title: "New Valley", subtitle: "Desert region of Egypt", value: 26),
    SelectObject(title: "Matrouh", subtitle: "Mediterranean coast, famous for beaches", value: 27),
    SelectObject(title: "North Sinai", subtitle: "Bordering Israel and the Gaza Strip", value: 28),
    SelectObject(title: "South Sinai", subtitle: "Famous for Sharm El Sheikh and diving spots", value: 29),
    SelectObject(title: "Helwan", subtitle: "Located near Cairo", value: 30),
  ];

  @override
  Widget build(BuildContext context) {
    // ترتيب المحافظات حسب العنوان
    governorates.sort((a, b) => a.title.compareTo(b.title));

    return InkWell(
      onTap: () async {
        SelectObject? result = await displayBottomSheet(context, value, governorates);
        if (result != null) {
          setState(() {
            value = result;
          });
        }
      },
      child: Container(
        height: 52,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: App_theme.borderGray, width: 1),
          color: App_theme.backgroundwhite,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                value.value == -1 ? "Select Governorate..." : value.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14), // إضافة حجم خط
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}

Future<SelectObject?> displayBottomSheet(BuildContext context, SelectObject value, List<SelectObject> options) {
  return showModalBottomSheet<SelectObject>(
    context: context,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: App_theme.backgroundwhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 32, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Select Governorate",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600), // زيادة حجم النص
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: App_theme.borderGray, width: 2),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.close,
                          color: App_theme.black,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pop(context, options[index]);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: App_theme.primary, width: 1),
                            ),
                            child: CircleAvatar(
                              radius: 7,
                              backgroundColor: Colors.transparent,
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor: value.value == options[index].value
                                    ? App_theme.primary
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  options[index].title,
                                  style: TextStyle(fontSize: 14), // زيادة حجم النص هنا
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  options[index].subtitle,
                                  style: const TextStyle(
                                    color: App_theme.hinttextcolor,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: options.length,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
