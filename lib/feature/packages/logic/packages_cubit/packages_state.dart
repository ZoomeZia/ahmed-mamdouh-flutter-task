import 'package:flutter_tasks/feature/packages/data/models/package_model.dart';

sealed class PackagesState {}

final class PackagesInitial extends PackagesState {}

final class PackagesLoading extends PackagesState {}

final class PackagesLoaded extends PackagesState {
  final List<PackageModel> packages;
  final int? selectedPackageIndex;

  PackagesLoaded({
    required this.packages,
    this.selectedPackageIndex,
  });

  PackagesLoaded copyWith({
    List<PackageModel>? packages,
    int? selectedPackageIndex,
  }) {
    return PackagesLoaded(
      packages: packages ?? this.packages,
      selectedPackageIndex: selectedPackageIndex ?? this.selectedPackageIndex,
    );
  }
}

final class PackagesError extends PackagesState {
  final String message;

  PackagesError({required this.message});
}
