import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/bloc/login_bloc.dart';
import 'package:movieapp/model/movie_model.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  bool isShow = false;
  TextEditingController searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
          title: Text('Warning',style: Theme.of(context).textTheme.bodyText1,),
          content: Text('Do you really want to exit',style: Theme.of(context).textTheme.bodyText1,),
          actions: [
            FlatButton(
              child: Text('Yes', style: Theme.of(context).textTheme.headline3,),
              onPressed: () => Navigator.pop(c, true),
                //onPressed: () => SystemChannels.platform.invokeMethod('SystemNavigator.pop')
            ),
            FlatButton(
              child: Text('No',style: Theme.of(context).textTheme.headline3,),
              onPressed: () => Navigator.pop(c, false),
            ),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              //loads search bar
              _buildSearchBar(),
              Expanded(//loads github user list
                  child:  StreamBuilder(
                      stream: movieBloc.items,
                      builder: (context, AsyncSnapshot<MovieResponse> snapshot) {
                        if (snapshot.hasData) {
                          return _buildListView(snapshot.data);
                        } else if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        }
                        return isShow ? Center(child: CircularProgressIndicator()) : Center(child: Text(''));
                      })
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildSearchBar() {
    return new Container(
      color: Theme.of(context).accentColor,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: new Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: new ListTile(
            leading: new Icon(Icons.search),
            title: new TextField(
              controller: searchController,
              decoration: new InputDecoration(
                  hintText: 'Search', border: InputBorder.none),
              onChanged: (value) {
                if (value != "") {
                  //fetch github users as per search value
                  setState(() {
                    isShow = true;
                  });
                  movieBloc.fetchUserItems(value);

                }
              },
            ),
            trailing: new IconButton(
              icon: new Icon(Icons.cancel), onPressed: () {
              searchController.clear();
              onSearchTextChanged('');
              movieBloc.fetchUserItems('');
            },),
          ),
        ),
      ),
    );
  }
  Widget _buildListView(MovieResponse data){
    return  CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(10),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: data.items.map((value) {
              return Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.cyan[100],
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.network(value.poster,width: MediaQuery.of(context).size.width,),
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text("${value.title}",style: Theme.of(context).textTheme.bodyText1),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text("Year: ${value.year}",style: Theme.of(context).textTheme.bodyText2,textAlign: TextAlign.center),
                    ),

                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
  onSearchTextChanged(String text) async {
    if (searchController.text.isEmpty) {
      setState(() {});
      return;
    }

  }
}
