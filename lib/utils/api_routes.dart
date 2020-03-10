class ApiRoutes {
  final String login = '/login';
  final String getUsers = '/users';
  final String createUsers = '/create-user';
  final String register = 'register';
  final String getGroups = '/groups';
  final String getUserProfile = '/show';
  final String followUser = 'follow';
  createAdminRoute(route) {
    return '/admin/$route';
  }

  createRootRoute(route) {
    return '/$route';
  }

  createUserActionRoute(userId, route) {
    return '/$userId/$route';
  }
  
}

final ApiRoutes apiRoutes = ApiRoutes();
