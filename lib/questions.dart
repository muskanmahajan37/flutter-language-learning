import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            customBorder: CircleBorder(),
            child: Icon(Icons.arrow_back),
          ),
          title: Text("Questions"),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Color(0xFF242833),
            indicatorWeight: 1,
            tabs: <Widget>[
              Tab(text: "ASKED"),
              Tab(text: "ANSWERED"),
            ],
          ),
          actions: <Widget>[
            InkWell(
              customBorder: CircleBorder(),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Icon(Icons.add),
              ),
              onTap: () {},
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 58),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/images/no-question.png"),
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "No questions asked",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "You have not asked any questions to our community. "
                        "You can do so via “+” on the top right or via "
                        "the button we made for you right below this text.",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 38),
                  InkWell(
                    onTap: () {},
                    customBorder: StadiumBorder(),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 30),
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
                      child: Text(
                        "Ask a question",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
