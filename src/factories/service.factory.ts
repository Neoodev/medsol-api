import { GenericService } from '../services/generic.service';
import { UserService } from '../services/user.service';

// Factory pattern: centralizes service instantiation so controllers
// depend on the factory rather than constructing services directly.
class ServiceFactory {
  private static userService: UserService;
  private static genericService: GenericService;
  static getUserService(): UserService {
    if (!ServiceFactory.userService) {
      ServiceFactory.userService = new UserService();
    }
    return ServiceFactory.userService;
  }

  static getGenericService(): GenericService {
    if (!ServiceFactory.genericService) {
      ServiceFactory.genericService = new GenericService();
    }
    return ServiceFactory.genericService;
  }
}

export default ServiceFactory;
