import 'dart:convert';

import 'package:flutter/services.dart';

import 'blog.dart';

class BlogService {
  Future<List<Blog>> readJsonData() async {
    try {
      final jsonData = await rootBundle.loadString('assets/data/data.json');
      final List<dynamic> jsonList = json.decode(jsonData) as List<dynamic>;

      return jsonList
          .map((e) => Blog.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (error) {
      print('Error reading JSON data: $error');
      return []; // Return an empty list or handle the error as needed
    }
  }
}
