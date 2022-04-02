


import '../../models/notification_model.dart';

String? uId;

List<NotificationModel> notificationList =[];

String daysBetween(DateTime postDate) {
  if ((DateTime.now().difference(postDate).inHours / 24).round() == 0) {
    if (DateTime.now().difference(postDate).inHours == 0) {
      if (DateTime.now().difference(postDate).inMinutes == 0) {
        return 'now';
      } else {
        return '${DateTime.now().difference(postDate).inMinutes.toString()}m';
      }
    } else {
      return '${DateTime.now().difference(postDate).inHours.toString()}h';
    }
  } else {
    return (' ${(DateTime.now().difference(postDate).inHours / 24).round().toString()}d');
  }
}


List<String> archive =
[
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/1f5685d7-06c0-42a7-bb12-6d06310e0c8a.jpeg?alt=media&token=51def1b4-d186-489e-9a81-447aa879aeff',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/IMG-20220305-WA0032.jpg?alt=media&token=15884e23-8092-4d49-b2a2-f6cb9a740bdb',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/IMG-20220305-WA0028.jpg?alt=media&token=ea2d00df-ac7d-4a6d-b4ec-4ee4c66c0bd9',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/IMG-20220305-WA0027.jpg?alt=media&token=4a46dfcf-96ed-46e6-ad61-a7f054e71656',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/IMG-20220305-WA0026.jpg?alt=media&token=f41ec365-8f15-4354-a4d4-d856b40fcf2c',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/IMG-20220305-WA0025.jpg?alt=media&token=7a534996-f3d9-4616-bc82-96ccfdff459c',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/IMG-20220305-WA0024.jpg?alt=media&token=92f5d780-406a-4103-a4b3-0f407b915f57',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/IMG-20220305-WA0023.jpg?alt=media&token=ed16b3f0-6e3e-4ab8-b093-8b0f16d7f7d7',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/IMG-20220305-WA0034.jpg?alt=media&token=a894f9cb-b0ea-4f6f-806d-5c6131018b20',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/IMG-20220305-WA0020.jpg?alt=media&token=28c493c2-be29-4ea8-8596-997f178054cd',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/IMG-20220305-WA0021.jpg?alt=media&token=45e75563-161c-4810-b035-62475b0695af',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/IMG-20220305-WA0022.jpg?alt=media&token=7f90911a-7e22-4666-b925-499ffa253345',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/IMG-20220305-WA0031.jpg?alt=media&token=0259edb8-40cc-4b25-9c35-81f829406db9',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/8048cb43-4273-4987-9eaf-8f1c00e258f4.jpeg?alt=media&token=978bf877-4aa9-453f-b25f-36a4ee5476fe',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/003fdd6a-b403-4ea3-ad52-17094995d101.jpeg?alt=media&token=8e1ee986-a98d-42b9-ad63-41a6b80cfa9a',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/27314a2c-40ac-46b7-b75e-c19a373fe5b7.jpeg?alt=media&token=1af5ba95-01e8-4581-8471-567e024aec72',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/04ebbac5-e4a1-4226-81fb-4ae3381b4aeb.jpeg?alt=media&token=99d826f8-d732-44f7-aae4-d8fde6f30d5f',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/07a0c8d9-cbbd-4a65-8277-641cf5799a90.jpeg?alt=media&token=f155cf8b-9109-4aba-af4b-a63837e3badf',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/0e21fa9c-94fb-486f-abcf-69285934fdf1.jpeg?alt=media&token=02c330ec-e805-41a9-8631-804f0ca52958',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/13c5c814-6c57-450f-9279-9d3af8365143.jpeg?alt=media&token=05e54cdb-d2a6-4c45-9496-d93b0a2d91a1',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/23573cb8-89e3-498f-b9e0-07a84ef98e2a.jpeg?alt=media&token=c78cf1eb-85f0-42cc-9bff-c25336536fb0',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/2577e7d5-04a3-4026-ba0c-5f83ba4fc6ea.jpeg?alt=media&token=0dad7cf6-3df1-4a62-9af7-53ab4ce89c97',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/27cca4c7-6f4c-4b14-b086-b148580c7747.jpeg?alt=media&token=fcce460e-cca1-4253-bdb2-8e5a7f0e2b1d',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/2987c974-8c82-41b4-9a2d-32b1b2a81e87.jpeg?alt=media&token=c9303693-1df7-42f5-ae88-1cc630f29560',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/2f2d45e5-c7e0-4b6a-bae4-009b716da59e.jpeg?alt=media&token=2d3f0668-fca9-439f-afe7-d7ce3863c7e9',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/312288b0-8820-4913-b833-8deacd6ff5f7.jpeg?alt=media&token=8087dce6-48d8-47f4-b54c-452450f5ba72',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/332e30d6-0853-486f-8d17-9b0df0d7d00b.jpeg?alt=media&token=14873270-1188-47bf-b63a-271a1f491c94',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/3734dfd1-edbc-408f-9a93-2b5ba5d58eba.jpeg?alt=media&token=681548ee-87e3-4561-bf0c-b104debe4815',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/390d768d-5222-4f9c-a1d8-7a6fd03e343b.jpeg?alt=media&token=75a5738e-0ef3-4219-a4cc-3e1984acaba2',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/3cbae9f2-4636-4553-b2f3-d28589ad64c5.jpeg?alt=media&token=4669f339-2703-42ac-b81c-24fa4fd44982',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/45040faa-0a3b-4351-b567-d08a95cf0fb8.jpeg?alt=media&token=4643e688-c0ef-4fb5-abad-c84e5e92e5c2',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/51e0f583-2038-44ec-9eb4-5813b5b06033.jpeg?alt=media&token=d9f50da2-fbf2-4776-bd11-63ad1559b574',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/55023407-743f-4a29-991f-3a114abd587c.jpeg?alt=media&token=390dd4e9-4ce3-4357-b688-96e4cb308021',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/56b7c004-3230-47e7-9f53-1bd355aa4789.jpeg?alt=media&token=9ac4aa28-517f-4b5a-8269-22abfae62a19',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/62c4df43-9906-4cb9-b96c-b0a801630f7b.jpeg?alt=media&token=2139dda1-ffef-4bf2-b2de-55fe19abfca9',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/66e7f0fd-8f5b-49a9-bc9d-5cc8cef9937e.jpeg?alt=media&token=8bdd949b-abde-4385-8a14-25d1ec29bb79',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/6a562364-5529-4116-9d52-68bdbe5c9543.jpeg?alt=media&token=123b1568-1645-4abf-9395-a60e6f834f24',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/72f79016-11d5-410a-87d3-305699e33aad.jpeg?alt=media&token=e8fd1111-426f-467d-bb8a-24e69aad6cdc',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/7cff274c-78a6-406f-8170-7201a45a69ae.jpeg?alt=media&token=c5313b43-1de6-4092-952e-23eb58aec986',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/7fb50638-9e0e-411e-96d5-3a838049d5b1.jpeg?alt=media&token=c1dc426a-3a70-4840-87cc-beeeb8c37dd0',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/8833902f-8319-4a76-81da-dd0f0d76d15d.jpeg?alt=media&token=29e84ff5-7390-4063-9f0d-6a125c4c7ba9',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/89eded9e-a5a8-4f03-8a94-b9268d22537a.jpeg?alt=media&token=3cdcf2de-39fe-41b1-86ba-33d6186bd5c9',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/89eded9e-a5a8-4f03-8a94-b9268d22537a.jpeg?alt=media&token=3cdcf2de-39fe-41b1-86ba-33d6186bd5c9',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/8e69d15b-3d0f-464d-ba70-3e0fd630dd13.jpeg?alt=media&token=9f5d75d6-aa61-430e-9454-fc332d2ffcb7',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/8ea71de9-c921-4f25-81be-6b31704ebb96.jpeg?alt=media&token=51c64346-7a5d-49a1-9072-aa1d372aba3e',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/938b1d6d-4021-4529-8f18-af63a7bae743.jpeg?alt=media&token=96483f3b-a429-4295-97de-50f05db67447',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/95948700-4fdf-4374-9e23-7d15921828a5.jpeg?alt=media&token=2aab8584-818d-45e0-87b1-2ea7c96e332d',
  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/9cea13da-822f-4a46-bd9f-576257e312e6.jpeg?alt=media&token=25b0467d-585b-4d46-8e6f-624e28636de6',
];