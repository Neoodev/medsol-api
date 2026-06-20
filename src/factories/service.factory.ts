import { UserService } from '../services/user.service';

// Factory pattern: centralizes service instantiation so controllers
// depend on the factory rather than constructing services directly.
class ServiceFactory {
  private static userService: UserService;

  static getUserService(): UserService {
    if (!ServiceFactory.userService) {
      ServiceFactory.userService = new UserService();
    }
    return ServiceFactory.userService;
  }
}

export default ServiceFactory;
