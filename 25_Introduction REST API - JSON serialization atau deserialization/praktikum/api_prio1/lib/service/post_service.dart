import 'package:api_prio1/model/post_model/detail_post_model.dart';
import 'package:dio/dio.dart';

class PostService{

  //Get Post
  Future<List<DetailPostResponse>> getkontak() async {
    final response = await Dio().get(
        "https://jsonplaceholder.typicode.com/posts");
    print(response.data);

    List<DetailPostResponse> post = (response.data)
        .map(
          (e) => DetailPostResponse(
            id: e["id"],
            title: e["title"],
            body: e["body"],
            userId: e["userId"],
          ),
        )
        .toList();
    return post;
  }

  //Detail Post
  Future<DetailPostResponse> getDetailPost(
  )async {
    final response = await Dio().get(
      "https://jsonplaceholder.typicode.com/posts/1"
    );
    return DetailPostResponse.fromJson(response.data);
  }
  
}

