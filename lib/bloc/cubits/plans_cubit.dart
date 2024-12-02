import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/plan_model.dart';


class PlansCubit extends Cubit<PlansState> {
  PlansCubit() : super(PlansInitialState());
  //==================================
  //================================== Variables
  //==================================
  List<PlanModel> plans = [];
  //==================================
  //================================== Functions
  //==================================
  Future<List<PlanModel>> _requestPlansAPI()async{
    await Future.delayed(Duration(seconds: 2));
    return [
      PlanModel(title: 'Cat Food', description: ' Adult Tuna Flavour is a delicious comp..',price:180,imageUrl: 'Catfood.png'),
      PlanModel(title: 'Cat Toy', description: 'Generic Cute Cat Toys Funny Interactiv..',price:160, imageUrl: 'cats toy.png'),
      PlanModel(title: 'Fish Tank', description: 'JumblPets Starter Fish Aquarium Kit, C..',price:190, imageUrl: 'FishTank.png'),
      PlanModel(title: 'Bird Cage', description: 'Metal Bird Cage',price:170, imageUrl: 'Bridcage.png'),

    ];
  }
  void getPlans() async{
    emit(PlansLoadingState());
    try{
      plans = await _requestPlansAPI();
      if(plans.isNotEmpty)emit(PlansLoadedState(plans: plans));
      else emit(PlansEmptyState());
    }
    catch(e){
      emit(PlansErrorState(message: e.toString()));
    }

  }
}

abstract class PlansState {
  dynamic data;

  PlansState({this.data});
}

//============================== States
class PlansInitialState extends PlansState {}
class PlansLoadingState extends PlansState {}
class PlansEmptyState extends PlansState {}
class PlansLoadedState extends PlansState {
  List<PlanModel> plans;

  PlansLoadedState({this.plans = const []});
}
class PlansErrorState extends PlansState {
  String message;

  PlansErrorState({this.message = ''});
}
