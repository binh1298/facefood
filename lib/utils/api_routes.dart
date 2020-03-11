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

  createUserActionRoute(actions,userId, route) {
    return '/$actions/$userId/$route';
  }
  
  
}

final ApiRoutes apiRoutes = ApiRoutes();
