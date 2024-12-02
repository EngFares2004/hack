import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bloc/cubits/plans_cubit.dart';
import '../configuration/theme.dart';
import '../models/plan_model.dart';

class Plans extends StatelessWidget {
  const Plans({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PlansCubit>(context).getPlans();
    return Scaffold(
      backgroundColor: App_theme.backgroundwhite,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Plans',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color:  App_theme.black),
        ),
        backgroundColor: App_theme.backgroundwhite,
        elevation: 1,
        actions: [
          SvgPicture.asset('assets/icons/search.svg', color: App_theme.black, width: 24,),
          const SizedBox(width: 16), // تقليل المسافة
        ],
      ),
      body: BlocBuilder<PlansCubit, PlansState>(
        builder: (context, state) {
          if (state is PlansLoadingState) {
            return const Center(child: CircularProgressIndicator(
              color: App_theme.primary,
            ));
          }
          if (state is PlansLoadedState) {
            List<PlanModel> plans = state.plans;
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.separated(
                itemCount: plans.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12), // تقليل المسافة الداخلية
                    leading: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage('assets/images/${plans[index].imageUrl}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Plan ${plans[index].title}',
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color:  App_theme.black),
                        ),
                        const SizedBox(height: 2), // تقليل المسافة بين العناوين
                        Text(
                          'Description: ${plans[index].description}',
                          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: App_theme.hinttextcolor),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${plans[index].price.toStringAsFixed(2)} AED',
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: App_theme.primary),
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 18, color:  App_theme.black),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                    child: Divider(),
                  );
                },
              ),
            );
          } else if (state is PlansEmptyState) {
            return const Center(
              child: Text('No plans found'),
            );
          } else if (state is PlansErrorState) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
