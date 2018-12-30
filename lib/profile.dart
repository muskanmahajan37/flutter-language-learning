import 'package:flutter/material.dart';
import 'package:flutter_language_learning/widgets/progress_bar.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget _buildAppbar() {
    return AppBar(
      leading: InkWell(
        customBorder: CircleBorder(),
        child: Icon(Icons.edit),
      ),
      title: Text("Profile"),
      centerTitle: true,
      elevation: 0,
      actions: <Widget>[
        InkWell(
          customBorder: CircleBorder(),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Icon(Icons.settings),
          ),
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildUserInfo() {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      leading: Stack(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/avatar-2.png"),
            radius: 36,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 11,
              child: Container(
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.all(4),
                child: Center(
                  child: Icon(
                    Icons.camera_alt,
                    size: 10,
                    color: Colors.white,
                  ),
                ),
                decoration: ShapeDecoration(
                  color: Colors.cyan,
                  shape: CircleBorder(),
                ),
              ),
            ),
          )
        ],
      ),
      title: Text("Alison Cooper"),
      subtitle: Text("Beginner"),
    );
  }

  Widget _buildAds() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text("Unlimited lessons, learn offline, no ads and..."),
          ),
          SizedBox(width: 26),
          InkWell(
            onTap: () {},
            customBorder: StadiumBorder(),
            child: Container(
              decoration: ShapeDecoration(
                shape: StadiumBorder(),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFF78B5FA),
                    Color(0xFF9586FD),
                  ],
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                margin: EdgeInsets.all(2),
                decoration: ShapeDecoration(
                  shape: StadiumBorder(),
                  color: Colors.white,
                ),
                child: Text(
                  "Learn more",
                  style: TextStyle(
                      color: Color(0xFF5F87ED), fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.black12),
          bottom: BorderSide(color: Colors.black12),
        ),
      ),
      child: TabBar(
        indicatorColor: Color(0xFF242833),
        indicatorWeight: 1,
        labelColor: Colors.black,
        labelStyle: TextStyle(fontSize: 12),
        tabs: <Widget>[
          Tab(text: "FRENCH"),
          Tab(text: "SPANISH"),
          Tab(text: "ITALIAN"),
          Tab(text: "GERMAN"),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    return Column(
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/images/lang-french.png"),
          ),
          title: Text("25% fluent in total"),
          subtitle: ProgressBar(
            percent: 0.25,
            height: 3,
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          leading: CircleAvatar(
            backgroundColor: Color(0x207DA2FF),
            child: Text(
              "1",
              style: TextStyle(
                color: Color(0xFF5F87ED),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text("50% of Level 1 completed"),
          subtitle: ProgressBar(
            percent: 0.5,
            height: 3,
          ),
        ),
        ListTile(
          leading: Image.asset("assets/images/lesson.png"),
          title: Text("25 lessons completed"),
        ),
        ListTile(
          leading: Image.asset("assets/images/achievment.png"),
          title: Text("8 achievments completed"),
        ),
        ListTile(
          leading: Image.asset("assets/images/question.png"),
          title: Text("12 questions answered"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: _buildAppbar(),
        body: Column(
          children: <Widget>[
            _buildUserInfo(),
            _buildAds(),
            _buildTabs(),
            _buildTabContent()
          ],
        ),
      ),
    );
  }
}
