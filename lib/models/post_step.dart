import 'dart:convert';

class PostStep {
  final String imgUrl, description;

  PostStep({
    this.imgUrl,
    this.description,
  });
  factory PostStep.fromJson(dynamic json) {
    return PostStep(
      imgUrl: json['imgUrl'] as String,
      description: json['description'] as String,
    );
  }
}

//fake data
Future<List<PostStep>> fetchListPostStep(String userId) async{
  PostStep step1 = PostStep(
    description:
        'Season salmon filets generously with salt and pepper. Quarter mushrooms',
    imgUrl:
        'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2F4.bp.blogspot.com%2F-weCr72uU__4%2FUDx4HtgMkYI%2FAAAAAAAAAls%2FUr8rBMPTjFY%2Fs1600%2Fpho-vietnam.jpg&f=1&nofb=1',
  );
  PostStep step2 = PostStep(
    description: 'Heat vegetable oil in a large frying pan over medium heat.',
    imgUrl:
        'https://images.kitchenstories.io/wagtailOriginalImages/R1960-photo-step-002/R1960-photo-step-002-large-landscape-150.jpg',
  );
  PostStep step3 = PostStep(
    description:
        'Add mixed mushrooms and sliced garlic to the same pan, and cook until mushrooms are nicely browned.',
    imgUrl:
        'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2F4.bp.blogspot.com%2F-weCr72uU__4%2FUDx4HtgMkYI%2FAAAAAAAAAls%2FUr8rBMPTjFY%2Fs1600%2Fpho-vietnam.jpg&f=1&nofb=1',
  );
  PostStep step4 = PostStep(
    description:
        'Serve salmon filets on a bed of warm creamed spinach and mushrooms, and a lemon wedge. DONE!',
    imgUrl:
        'https://images.kitchenstories.io/wagtailOriginalImages/R1960-photo-step-005/R1960-photo-step-005-large-landscape-150.jpg',
  );

  List<PostStep> list = List();
  list.add(step1);
  list.add(step2);
  list.add(step3);
  list.add(step4);
  return list;
}
