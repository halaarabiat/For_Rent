import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent/models/post_model.dart';
import 'package:rent/models/user_model.dart';

class CurrentSession {
  static final CurrentSession _shared = CurrentSession._private();

  factory CurrentSession() => _shared;

  CurrentSession._private();

  UserModel? user;

  void updateFavPosts(PostFormModel post) async {
    try {
      DocumentReference documentReference =
          FirebaseFirestore.instance.collection("post").doc(post.documentId);
      if (post.isFav) {
        post.usersFavs!.add(user!.userid ?? '');
      } else if (!post.isFav && post.usersFavs!.contains(user!.userid ?? '')) {
        post.usersFavs!.remove(user!.userid ?? '');
      }
      await documentReference.update(post.toMap());
    } catch (e) {
      print(e);
    }
  }
}
