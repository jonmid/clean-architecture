import 'package:clean_architecture/data/repositories/product_repository_impl.dart';
import 'package:clean_architecture/domain/repositories/product_repository.dart';
import 'package:clean_architecture/domain/usecases/delete_product.dart';
import 'package:clean_architecture/domain/usecases/get_all_products.dart';
import 'package:clean_architecture/domain/usecases/save_product.dart';
import 'package:clean_architecture/presentation/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initializeDependencies() {
  // Repositories
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(),
  );

  // Use Cases
  getIt.registerLazySingleton(
    () => GetAllProducts(getIt<ProductRepository>()),
  );
  getIt.registerLazySingleton(
    () => SaveProduct(getIt<ProductRepository>()),
  );
  getIt.registerLazySingleton(
    () => DeleteProduct(getIt<ProductRepository>()),
  );

  // BLoCs
  getIt.registerFactory(
    () => ProductBloc(
      getAllProducts: getIt<GetAllProducts>(),
      saveProduct: getIt<SaveProduct>(),
      deleteProduct: getIt<DeleteProduct>(),
    ),
  );
}
