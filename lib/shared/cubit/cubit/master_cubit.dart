import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/message_model.dart';
import '../../../models/notification_model.dart';
import '../../../models/user_model.dart';

import '../../components/constants.dart';
import '../../network/remote/dio_helper.dart';
import '../states/master_states.dart';

class MasterCubit extends Cubit<MasterStates> {
  MasterCubit() : super(MasterInitialState());

  static MasterCubit get(context) => BlocProvider.of(context);

  //*//User Data

  UserModel? user;

  Future<void> getUserData() async {
    emit(GetUserDataLoadingState());

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
      debugPrint(value.data().toString());
      user = UserModel.fromJson(value.data());
      emit(GetUserDataSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetUserDataErrorState());
    });
  }

  //*//get profile user

  UserModel? profileUser;

  Future<void> getProfileUser(String userID) async {
    emit(GetProfileUserInfoLoadingState());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .get()
        .then((value) {
      profileUser = UserModel.fromJson(value.data());

      emit(GetProfileUserInfoSuccessState());
    }).onError((error, stack) {
      emit(GetProfileUserInfoErrorState());
      debugPrint(stack.toString());
      debugPrint(error.toString());
    });
  }

  //*//Image Picker
  final ImagePicker _picker = ImagePicker();

  //profile image

  File? profileImage;

  Future<void> getProfileImage() async {
    if (profileImage != null) {
      profileImage = null;
    }
    await _picker.pickImage(source: ImageSource.gallery).then((value) {
      profileImage = File(value!.path);
      emit(ProfileImagePickedSuccessState());
    }).catchError((error) {
      emit(ProfileImagePickedErrorState());
    });
  }

  //*// Uploading New  Image

  //profile
  String profileImageUrl =
      'https://e7.pngegg.com/pngimages/753/432/png-clipart-user-profile-2018-in-sight-user-conference-expo-business-default-business-angle-service-thumbnail.png';

  void uploadNewProfileImage() {
    emit(UploadProfileImageLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        profileImageUrl = value;
        debugPrint(value.toString());
        updateProfilePhoto(value);
        emit(UploadProfileImageSuccessState());
      }).catchError((error) {
        debugPrint(error.toString());
        emit(UploadProfileImageErrorState());
      });
    }).catchError((error) {
      debugPrint(error.toString());
      emit(UploadProfileImageErrorState());
    });
  }

  //*//Update User Data

  void updateProfilePhoto(String newPhoto) {
    emit(EditProfileUpdatePhotoLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update({'image': newPhoto}).then((value) {
      emit(EditProfileUpdatePhotoSuccessState());
    }).catchError((error) {
      debugPrint('error in update $error');
      emit(EditProfileUpdatePhotoErrorState());
    });
  }

  void updateCoverPhoto(String newPhoto) {
    emit(EditProfileUpdatePhotoLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update({'coverImage': newPhoto}).then((value) {
      getUserData();
      emit(EditProfileUpdatePhotoSuccessState());
    }).catchError((error) {
      debugPrint('error in update $error');
      emit(EditProfileUpdatePhotoErrorState());
    });
  }

  void updateName(String newName) {
    emit(EditProfileUpdateNameLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update({'name': newName}).then((value) {
      emit(EditProfileUpdateNameSuccessState());
      getUserData();
    }).catchError((error) {
      emit(EditProfileUpdateNameErrorState());
    });
  }

// change Phone ..................................

  void updatePhone(String newPhone) {
    emit(EditProfileUpdatePhoneLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update({'phone': newPhone}).then((value) {
      emit(EditProfileUpdatePhoneSuccessState());
      getUserData();
    }).catchError((error) {
      emit(EditProfileUpdatePhoneErrorState());
    });
  }

//-------------------Update Bio ---------------------

  void updateBio(String newBio) {
    emit(EditProfileUpdateBioLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update({'bio': newBio}).then((value) {
      emit(EditProfileUpdateBioSuccessState());
      getUserData();
    }).catchError((error) {
      emit(EditProfileUpdateBioErrorState());
    });
  }

//-------------------Update University ---------------------

  void updateUniversity(String newUniversity) {
    emit(EditProfileUpdateUniversityLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update({'bio': newUniversity}).then((value) {
      emit(EditProfileUpdateUniversitySuccessState());
      getUserData();
    }).catchError((error) {
      emit(EditProfileUpdateUniversityErrorState());
    });
  }

//*// admin

  void sendMessageToUser({
    required String receiverID,
    required String text,
    required UserModel receiverUser,
  }) {
    MessageModel message = MessageModel(
      dateTime: DateTime.now().toString(),
      receiverId: receiverID,
      senderId: user!.uId,
      text: text,
    );

    ////////////// sender chat:
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('chats')
        .doc(receiverID)
        .collection('messages')
        .add(message.toMap())
        .then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(SendMessageErrorState());
    });

    ////////////// receiver chat:
    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverID)
        .collection('chats')
        .doc(uId)
        .collection('messages')
        .add(message.toMap())
        .then((value) {
      DioHelper.postData(
        senderUser: user!,
        receiverToken: receiverUser.uToken.toString(),
        dateTime: DateTime.now().toString(),
      ).then(
        (value) => saveNotifications(
          NotificationModel(
            senderName: user!.name,
            senderImage: user!.image,
            dateTime: DateTime.now().toString(),
          ),
        ),
      );
      emit(SendMessageSuccessState());
    }).catchError(
      (error) {
        debugPrint(error.toString());
        emit(SendMessageErrorState());
      },
    );
  }

// get Messages .........

  List<MessageModel> messagesWithUser = [];

  void getMessagesFromUser({required String receiverID}) {
    emit(GetMessageLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('chats')
        .doc(receiverID)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messagesWithUser.clear();
      for (var element in event.docs) {
        messagesWithUser.add(MessageModel.fromJson(element.data()));
      }
      emit(GetMessageSuccessState());
    });
  }

  //*// Get Users Model

  List<UserModel> chatUsers = [];

  Future<void> getChatUsers() async {
    emit(GetChatUsersInfoLoadingState());

    FirebaseFirestore.instance.collection('users').snapshots().listen((value) {
      chatUsers.clear();
      for (var element in value.docs) {
        if (element.id != user!.uId.toString()) {
          chatUsers.add(UserModel.fromJson(element.data()));
        }
      }

      emit(GetChatUsersInfoSuccessState());
    }).onError((error) {
      debugPrint(error.toString());
      emit(GetChatUsersInfoErrorState());
    });
  }

  void sendMessageToAdmin({
    required String text,
  }) {
    MessageModel message = MessageModel(
      receiverId: 'WT9QhbcxU5aZFe9R9KEpVOI62Jq2',
      dateTime: DateTime.now().toString(),
      senderId: user!.uId,
      text: text,
    );

    ////////////// sender chat:

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('chats')
        .doc('WT9QhbcxU5aZFe9R9KEpVOI62Jq2')
        .collection('messages')
        .add(message.toMap())
        .then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(SendMessageErrorState());
    });

    ////////////// receiver chat:

    FirebaseFirestore.instance
        .collection('users')
        .doc('WT9QhbcxU5aZFe9R9KEpVOI62Jq2')
        .collection('chats')
        .doc(uId)
        .collection('messages')
        .add(message.toMap())
        .then((value) {
      DioHelper.postData(
        senderUser: user!,
        receiverToken:
            'eWIbGBMiQQyDkkfCEUVtLQ:APA91bE5_lrUf3krBj_eEBewYpEUTHYof43_SDo5teCFktn4x2acg6C2aasJ9USt6wzf7BGSuCypcRyMoCojGoJeQAlv7qigQJhRgXk1T3bOJA4PeITUluFURCWWxrLV7MYuz3x_GItn',
        dateTime: DateTime.now().toString(),
      ).then(
        (value) => saveNotifications(
          NotificationModel(
            senderName: user!.name,
            senderImage: user!.image,
            dateTime: DateTime.now().toString(),
          ),
        ),
      );
      emit(SendMessageSuccessState());
    }).catchError(
      (error) {
        debugPrint(error.toString());
        emit(SendMessageErrorState());
      },
    );
  }

// get Messages .........

  List<MessageModel> messagesWithAdmin = [];

  void getMessagesFromAdmin() {
    emit(GetMessageLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('chats')
        .doc('WT9QhbcxU5aZFe9R9KEpVOI62Jq2')
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messagesWithAdmin.clear();
      for (var element in event.docs) {
        messagesWithAdmin.add(MessageModel.fromJson(element.data()));
      }
      emit(GetMessageSuccessState());
    });
  }

  // save Notifications.......
  void saveNotifications(NotificationModel notification) {
    FirebaseFirestore.instance
        .collection('notifications')
        .add(notification.toMap());
  }

  //get notifications.........
  Future<void> getNotifications() async {
    notificationList.clear();
    FirebaseFirestore.instance
        .collection('notifications')
        .orderBy('dateTime', descending: true)
        .snapshots()
        .listen((event) {
      for (var element in event.docs) {
        notificationList.add(NotificationModel.fromJson(element.data()));
      }
    });
  }

  Future<void> openBrowserUrl({required String url}) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: true,
      ).then((value) {
        emit(LaunchSuccessState());
      });
    }
  }
}
