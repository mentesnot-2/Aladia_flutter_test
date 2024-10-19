import '../../data/models/user_model.dart';
import '../../data/repositories/auth_repository.dart';

class CheckUserExistenceUseCase {
  final AuthRepository repository;

  CheckUserExistenceUseCase(this.repository);

  Future<UserModel> call(String email) async {
    return await repository.checkUserExistence(email);
  }
}
