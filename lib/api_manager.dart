import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'news_model.dart';
class ApiManager{
  Future<NewsModel> getdata()async{
    var client = http.Client();
    var newsModel = null;
    try{
    var url = Uri.parse('https://newsapi.org/v2/everything?domains=wsj.com&apiKey=8a2af2eb24fe43b591e567798fdf441c');
    var response = await client.get(url);//getting the response from the api
    if (response.statusCode==200){
      var jsonString = response.body;//making json file from the web
      var jsonMap= json.decode(jsonString);//converting the json to map
      newsModel = NewsModel.fromJson(jsonMap);

    }
    }catch(Exception){
      return newsModel;//if error then will send null to the function
    }
    return newsModel;//if resoponse is found then the converted map is loaded into the getdata future function
    
  }
}