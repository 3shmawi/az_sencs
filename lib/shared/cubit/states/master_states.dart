abstract class MasterStates {}

class MasterInitialState extends MasterStates {}



//Get UserData

class GetUserDataLoadingState extends MasterStates {}

class GetUserDataSuccessState extends MasterStates {}

class GetUserDataErrorState extends MasterStates {}

//Get Profile User Info

class GetProfileUserInfoLoadingState extends MasterStates {}

class GetProfileUserInfoSuccessState extends MasterStates {}

class GetProfileUserInfoErrorState extends MasterStates {}



//PickedImage

//profile
class ProfileImagePickedSuccessState extends MasterStates {}

class ProfileImagePickedErrorState extends MasterStates {}



//Uploading Profile Image

class UploadProfileImageLoadingState extends MasterStates {}

class UploadProfileImageSuccessState extends MasterStates {}

class UploadProfileImageErrorState extends MasterStates {}


//Update UserData

class UpdateUserDataLoadingState extends MasterStates {}

class UpdateUserDataErrorState extends MasterStates {}



//Users And Messages

class GetChatUsersInfoLoadingState extends MasterStates {}

class GetChatUsersInfoSuccessState extends MasterStates {}

class GetChatUsersInfoErrorState extends MasterStates {}

class SendMessageSuccessState extends MasterStates {}

class SendMessageErrorState extends MasterStates {}

class GetMessageLoadingState extends MasterStates {}

class GetMessageSuccessState extends MasterStates {}







//*//update user data

class EditProfileUpdatePhotoLoadingState extends MasterStates {}

class EditProfileUpdatePhotoSuccessState extends MasterStates {}

class EditProfileUpdatePhotoErrorState extends MasterStates {}

//*******

class EditProfileUpdatePhotosListSuccessState extends MasterStates {}

class EditProfileUpdatePhotosListErrorState extends MasterStates {}

//********

class EditProfileUpdateNameLoadingState extends MasterStates {}

class EditProfileUpdateNameSuccessState extends MasterStates {}

class EditProfileUpdateNameErrorState extends MasterStates {}

//************

class EditProfileUpdatePhoneLoadingState extends MasterStates {}

class EditProfileUpdatePhoneSuccessState extends MasterStates {}

class EditProfileUpdatePhoneErrorState extends MasterStates {}

//**********

class EditProfileUpdateBioLoadingState extends MasterStates {}

class EditProfileUpdateBioSuccessState extends MasterStates {}

class EditProfileUpdateBioErrorState extends MasterStates {}

//**********

class EditProfileUpdateUniversityLoadingState extends MasterStates {}

class EditProfileUpdateUniversitySuccessState extends MasterStates {}

class EditProfileUpdateUniversityErrorState extends MasterStates {}


//**************launch url
class LaunchSuccessState extends MasterStates {}
