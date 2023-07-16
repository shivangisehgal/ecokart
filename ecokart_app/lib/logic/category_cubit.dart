import '/repositories/category_repo.dart';
import '/models/category.dart';
import '/logic/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitialState()) {
    _initialize();
  }

  final _categoryRepository = CategoryRepository();

  void _initialize() async {
    //category is loading
    emit(CategoryLoadingState(state.categories));

    try {
      //fetch all categories from API
      List<CategoryModel> categories = await _categoryRepository
          .fetchAllCategories();

      //Category is in loaded state (emit)
      emit(CategoryLoadedState(categories));
    }
    catch (ex) {
      //else, Category's state is error (Emit)
      emit(CategoryErrorState(ex.toString(), state.categories));
    }
  }
}
