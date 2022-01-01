import 'package:api/home_screen.dart';
import 'package:api/news_model.dart';
import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget {
  final Article ArticleInfo;

  NewsDetailPage({required this.ArticleInfo});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(title: Text('News API Integration',),backgroundColor: Colors.pinkAccent,
        actions: [
          IconButton(onPressed: null, icon: Icon(Icons.add_alert,color: Colors.white,),),
          IconButton(onPressed: null, icon: Icon(Icons.account_circle_sharp,color: Colors.white),)

        ],
        ),

        body: Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.deepPurple.withOpacity(.45),
            borderRadius: BorderRadius.circular(15)
          ),
          height: MediaQuery.of(context).size.height*.95,
          width: MediaQuery.of(context).size.width*.95,
          //color: Colors.blue,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*.25,
                  width: MediaQuery.of(context).size.width*.95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                    image: DecorationImage(
                        image:NetworkImage(ArticleInfo.urlToImage),
                        fit: BoxFit.cover,
                        colorFilter: new ColorFilter.mode(Colors.white.withOpacity(.45), BlendMode.dstATop)
                    ),

                  ),
                  //color: Colors.red,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(ArticleInfo.title,style: TextStyle(fontSize: 35,fontWeight: FontWeight.w400),),
                ),
                Divider(thickness: 1.5,color: Colors.white,),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 15,top: 30),
                  child: Text('${ArticleInfo.author}' '...',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.black),),
                ),
                SizedBox(height: 30,),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 15),
                  child: Text('${ArticleInfo.publishedAt}' '...',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.black38),),
                ),
                SizedBox(height: 15,),
                Divider(thickness: 1.5,color: Colors.white),
                SizedBox(height: 15,),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 15),
                  child: Text('${ArticleInfo.content}' '...',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 15),
                  child: Text('${ArticleInfo.content}' '...',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 15),
                  child: Text('${ArticleInfo.content}' '...',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 15),
                  child: Text('${ArticleInfo.content}' '...',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                ),


                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.topLeft,

                  margin: EdgeInsets.only(left: 15),
                  child: Text(ArticleInfo.url,style: TextStyle(decoration:TextDecoration.underline,fontSize: 20,fontWeight: FontWeight.w300,color: Colors.red),),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.red,
            child: Center(child: Text('News API Integration'),),
          ),
          SizedBox(height: 200,),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              //Navigator.push(context, );
            },
            child: Card(
              child: Text('Home'),
              
            ),
          )
        ],
      ),
    );
  }
}

