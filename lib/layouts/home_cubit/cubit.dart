import 'package:bloc/bloc.dart';
import 'package:esraa_news_app/layouts/home_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);
}
