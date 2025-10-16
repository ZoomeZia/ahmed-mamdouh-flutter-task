import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasks/core/helpers/local_db.dart';
import 'package:flutter_tasks/feature/packages/data/models/package_model.dart';
import 'package:flutter_tasks/feature/packages/logic/packages_cubit/packages_state.dart';

class PackagesCubit extends Cubit<PackagesState> {
  PackagesCubit() : super(PackagesInitial());

  Future<void> loadPackages() async {
    emit(PackagesLoading());

    try {
      final packageData = await LocalDB.instance.getPackages();
      final packages = packageData
          .map((data) => PackageModel.fromMap(data))
          .toList();

      emit(PackagesLoaded(packages: packages));
    } catch (e) {
      emit(PackagesError(message: e.toString()));
    }
  }

  void selectPackage(int index) {
    final currentState = state;
    if (currentState is PackagesLoaded) {
      emit(currentState.copyWith(selectedPackageIndex: index));
    }
  }

  void clearSelection() {
    final currentState = state;
    if (currentState is PackagesLoaded) {
      emit(currentState.copyWith(selectedPackageIndex: null));
    }
  }
}
