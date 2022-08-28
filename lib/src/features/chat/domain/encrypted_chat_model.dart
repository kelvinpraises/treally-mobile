import 'encrypted_messages.dart';

class EncryptedChat {
  EncryptedChat({
    required this.ownerUniversalProfile,
    required this.recipientUniversalProfile,
    this.encryptedMessage,
  });

  String ownerUniversalProfile;
  String recipientUniversalProfile;
  List<EncryptedMessage>? encryptedMessage;
}
