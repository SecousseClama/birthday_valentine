// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:dart_appwrite/dart_appwrite.dart';


var getdoc;
void getdocgift(day) { // Init SDK
  Client client = Client();
  Databases databases = Databases(client, databaseId: 'Valentine');

  client
    .setEndpoint('https://appwrite.secousse.ovh/v1') // Your API Endpoint
    .setProject('Valentine') // Your project ID
    .setKey('6cb811cd11bd6c461c194c5a1b28b015ebba5840c01e79e2360bdae0d40540172605f485aede918ef29a05899794c37ff4feab1bbacaced98c5b4e8981da5e041bdf82a473bfc3b8ea8372a196c6ef605df1a05cd6abb2c722129f636b22c681130a76a7e8cdc58c5912afc07b0e56bb36810937c8dff9d43e67685fea196111') // Your secret API key
  ;

  getdoc = databases.getDocument(
    collectionId: '62eaec23119a8897c557',
    documentId: day.toString(),
  );

  getdoc
    .then((response) {
    }).catchError((error) {
  });
}