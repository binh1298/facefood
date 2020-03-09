
class CardUserDetailInfo extends StatelessWidget {
  final String username;
  final String totalFollowersCount;
  final String totalFollowingCount;

  const CardUserDetailInfo({
    Key key,
    this.username,
    this.totalFollowersCount,
    this.totalFollowingCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          width: MediaQuery.of(context).size.width / 6,
          height: MediaQuery.of(context).size.width / 6,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            child: Icon(
              Icons.person,
              size: MediaQuery.of(context).size.width / 8,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 100,
            child: Column(
              children: <Widget>[
                Container(
                  height: 32,
                  child: Text(
                    'Reanu Keeves',
                    style: textStyleHeading,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: UserDetailInfo(
                            title: 'Followers',
                            number: 1,
                          ),
                        ),
                        Expanded(
                          child: UserDetailInfo(
                            title: 'Likes',
                            number: 13,
                          ),
                        ),
                        Expanded(
                          child: UserDetailInfo(
                            title: 'Following',
                            number: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}