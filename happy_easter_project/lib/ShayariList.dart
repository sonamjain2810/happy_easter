import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/material.dart';
import 'data/Shayari.dart';
import 'utils/SizeConfig.dart';
import 'ShayariDetailPage.dart';

class ShayariList extends StatefulWidget {
  @override
  _ShayariListState createState() => _ShayariListState();
}

class _ShayariListState extends State<ShayariList> {
  static final facebookAppEvents = FacebookAppEvents();
  var data = Shayari.shayari_data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Caption List",
          style: Theme.of(context).appBarTheme.textTheme.headline1,
        ),
      ),
      body: SafeArea(
        child: data != null
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Padding(
                      padding:
                          EdgeInsets.all(1.93 * SizeConfig.widthMultiplier),
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryVariant,
                                ),
                                borderRadius:
                                    // 40 / 8.96 = 4.46
                                    BorderRadius.all(Radius.circular(
                                        4.46 * SizeConfig.widthMultiplier))),
                            child: ListTile(
                              leading: Icon(
                                Icons.brightness_1,
                                color: Theme.of(context).primaryIconTheme.color,
                              ),
                              title: Text(
                                data[index],
                                maxLines: 2,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              trailing: Icon(Icons.arrow_forward_ios,
                                  color:
                                      Theme.of(context).primaryIconTheme.color),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  ShayariDetailPage(index)));

                      facebookAppEvents.logEvent(
                        name: "Shayari List",
                        parameters: {
                          'clicked_on_shayari_index': '$index',
                        },
                      );
                    },
                  );
                },
                itemCount: data.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
