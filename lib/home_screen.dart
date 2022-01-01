import 'package:api/api_manager.dart';
import 'package:api/news_detail_page_screen.dart';
import 'package:api/news_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<NewsModel>? _newsModel;
  @override
  void initState() {
    //this state is created firstly so data we have to call the functions that is needed for the app to make it errorfree
    _newsModel = ApiManager().getdata();//receiving the data from the api_manager dart file by directly calling the class
    // TODO: implement initState
    //everything has to be done before super.initState()
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text('News API Integration',),backgroundColor: Colors.pinkAccent,
        actions: [
          IconButton(onPressed: null, icon: Icon(Icons.add_alert,color: Colors.white,),),
          IconButton(onPressed: null, icon: Icon(Icons.account_circle_sharp,color: Colors.white),)

        ],
      ),


      body: FutureBuilder<NewsModel>(
        future: _newsModel,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.articles.length,//adding the exclamatory mark because the data can be nullable so length is not fixed
              itemBuilder: (context,index){
                var article = snapshot.data!.articles[index];
              return Container(
                height: MediaQuery.of(context).size.height*.20,
                width:  MediaQuery.of(context).size.width*.80,
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                padding: EdgeInsets.symmetric(vertical: 15),

                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade300,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: ListTile(
                  title: Text(article.title,style: TextStyle(fontSize: 25,color: Colors.white),),
                  subtitle: Text(article.author,style: TextStyle(fontSize: 18,color: Colors.white.withOpacity(.45)),),
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (snapshot)=>NewsDetailPage(ArticleInfo: article)));
                  },
                ),
              );
            },);
          }
          else{
            return Center(child: CircularProgressIndicator());
          }

        },

      ),
    );
  }
}
