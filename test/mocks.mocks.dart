// Mocks generated by Mockito 5.4.2 from annotations
// in decentproof/test/mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:typed_data' as _i28;

import 'package:basic_utils/basic_utils.dart' as _i6;
import 'package:decentproof/features/hashing/interfaces/IMediaPickerService.dart'
    as _i4;
import 'package:decentproof/features/hashing/logic/backend/HashSubmissionService.dart'
    as _i13;
import 'package:decentproof/features/hashing/logic/backend/ShowInExplorer.dart'
    as _i30;
import 'package:decentproof/features/hashing/logic/hasher/AudioHashingService.dart'
    as _i21;
import 'package:decentproof/features/hashing/logic/hasher/ImageHashingService.dart'
    as _i22;
import 'package:decentproof/features/hashing/logic/hasher/VideoHashingService.dart'
    as _i23;
import 'package:decentproof/features/hashing/logic/ImagePickerWrapper.dart'
    as _i29;
import 'package:decentproof/features/hashing/logic/ImageSavingService.dart'
    as _i18;
import 'package:decentproof/features/hashing/logic/VideoSavingService.dart'
    as _i17;
import 'package:decentproof/features/hashing/logic/water_mark/ImageWaterMarkService.dart'
    as _i19;
import 'package:decentproof/features/hashing/logic/water_mark/VideoWaterMarkService.dart'
    as _i20;
import 'package:decentproof/features/metadata/logic/LocationServiceWrapper.dart'
    as _i11;
import 'package:decentproof/features/metadata/logic/MetaDataPermissionService.dart'
    as _i12;
import 'package:decentproof/features/metadata/logic/metaDataServices/AudioMetaDataService.dart'
    as _i15;
import 'package:decentproof/features/metadata/logic/metaDataServices/ImageMetaDataService.dart'
    as _i14;
import 'package:decentproof/features/metadata/logic/metaDataServices/VideoMetaDataService.dart'
    as _i16;
import 'package:decentproof/features/metadata/models/LocationModel.dart' as _i2;
import 'package:decentproof/features/metadata/models/MetaDataModel.dart' as _i3;
import 'package:decentproof/features/verification/logic/FileSelectionService.dart'
    as _i25;
import 'package:decentproof/features/verification/logic/SignatureVerificationService.dart'
    as _i31;
import 'package:decentproof/features/verification/logic/VerificationService.dart'
    as _i24;
import 'package:decentproof/features/verification/models/FileDataMode.dart'
    as _i26;
import 'package:decentproof/features/verification/models/VerificationStatusModel.dart'
    as _i5;
import 'package:decentproof/shared/HashLogic.dart' as _i27;
import 'package:decentproof/shared/Integrety/ApiKeyRequestService.dart' as _i9;
import 'package:decentproof/shared/Integrety/AppCheck.dart' as _i7;
import 'package:decentproof/shared/Integrety/SecureStorageWrapper.dart' as _i10;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeLocationModel_0 extends _i1.SmartFake implements _i2.LocationModel {
  _FakeLocationModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMetaDataModel_1 extends _i1.SmartFake implements _i3.MetaDataModel {
  _FakeMetaDataModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIMediaPickerService_2 extends _i1.SmartFake
    implements _i4.IMediaPickerService {
  _FakeIMediaPickerService_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeVerificationStatusModel_3 extends _i1.SmartFake
    implements _i5.VerificationStatusModel {
  _FakeVerificationStatusModel_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeECPublicKey_4 extends _i1.SmartFake implements _i6.ECPublicKey {
  _FakeECPublicKey_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeECSignature_5 extends _i1.SmartFake implements _i6.ECSignature {
  _FakeECSignature_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AppCheck].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppCheck extends _i1.Mock implements _i7.AppCheck {
  @override
  _i8.Future<String> getIntegrityToken() => (super.noSuchMethod(
        Invocation.method(
          #getIntegrityToken,
          [],
        ),
        returnValue: _i8.Future<String>.value(''),
        returnValueForMissingStub: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
}

/// A class which mocks [ApiKeyRequestService].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiKeyRequestService extends _i1.Mock
    implements _i9.ApiKeyRequestService {
  @override
  String get checkKeyURL => (super.noSuchMethod(
        Invocation.getter(#checkKeyURL),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String get getKeyURL => (super.noSuchMethod(
        Invocation.getter(#getKeyURL),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i8.Future<bool> checkForNewApiKey(String? apiKey) => (super.noSuchMethod(
        Invocation.method(
          #checkForNewApiKey,
          [apiKey],
        ),
        returnValue: _i8.Future<bool>.value(false),
        returnValueForMissingStub: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);
  @override
  _i8.Future<String> getNewNewKey(String? token) => (super.noSuchMethod(
        Invocation.method(
          #getNewNewKey,
          [token],
        ),
        returnValue: _i8.Future<String>.value(''),
        returnValueForMissingStub: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
}

/// A class which mocks [SecureStorageService].
///
/// See the documentation for Mockito's code generation for more information.
class MockSecureStorageService extends _i1.Mock
    implements _i10.SecureStorageService {
  @override
  _i8.Future<void> saveApiKey(String? key) => (super.noSuchMethod(
        Invocation.method(
          #saveApiKey,
          [key],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<String?> retriveApiKey() => (super.noSuchMethod(
        Invocation.method(
          #retriveApiKey,
          [],
        ),
        returnValue: _i8.Future<String?>.value(),
        returnValueForMissingStub: _i8.Future<String?>.value(),
      ) as _i8.Future<String?>);
  @override
  _i8.Future<String?> retriveEmail() => (super.noSuchMethod(
        Invocation.method(
          #retriveEmail,
          [],
        ),
        returnValue: _i8.Future<String?>.value(),
        returnValueForMissingStub: _i8.Future<String?>.value(),
      ) as _i8.Future<String?>);
  @override
  _i8.Future<void> saveEmail(String? email) => (super.noSuchMethod(
        Invocation.method(
          #saveEmail,
          [email],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<String?> retriveSecret() => (super.noSuchMethod(
        Invocation.method(
          #retriveSecret,
          [],
        ),
        returnValue: _i8.Future<String?>.value(),
        returnValueForMissingStub: _i8.Future<String?>.value(),
      ) as _i8.Future<String?>);
  @override
  _i8.Future<void> saveSecret(String? secret) => (super.noSuchMethod(
        Invocation.method(
          #saveSecret,
          [secret],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [LocationServiceWrapper].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocationServiceWrapper extends _i1.Mock
    implements _i11.LocationServiceWrapper {
  @override
  _i8.Future<bool> getPermission() => (super.noSuchMethod(
        Invocation.method(
          #getPermission,
          [],
        ),
        returnValue: _i8.Future<bool>.value(false),
        returnValueForMissingStub: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);
  @override
  _i8.Future<bool> hasPermission() => (super.noSuchMethod(
        Invocation.method(
          #hasPermission,
          [],
        ),
        returnValue: _i8.Future<bool>.value(false),
        returnValueForMissingStub: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);
  @override
  _i8.Future<_i2.LocationModel> requestLocation() => (super.noSuchMethod(
        Invocation.method(
          #requestLocation,
          [],
        ),
        returnValue: _i8.Future<_i2.LocationModel>.value(_FakeLocationModel_0(
          this,
          Invocation.method(
            #requestLocation,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.LocationModel>.value(_FakeLocationModel_0(
          this,
          Invocation.method(
            #requestLocation,
            [],
          ),
        )),
      ) as _i8.Future<_i2.LocationModel>);
  @override
  _i8.Future<bool> serviceEnabled() => (super.noSuchMethod(
        Invocation.method(
          #serviceEnabled,
          [],
        ),
        returnValue: _i8.Future<bool>.value(false),
        returnValueForMissingStub: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);
}

/// A class which mocks [MetaDataPermissionService].
///
/// See the documentation for Mockito's code generation for more information.
class MockMetaDataPermissionService extends _i1.Mock
    implements _i12.MetaDataPermissionService {
  @override
  _i8.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<void> allowLocationEmbedding(bool? allow) => (super.noSuchMethod(
        Invocation.method(
          #allowLocationEmbedding,
          [allow],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<void> allowSecretEmbedding(bool? allow) => (super.noSuchMethod(
        Invocation.method(
          #allowSecretEmbedding,
          [allow],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  bool shouldEmbedLocation() => (super.noSuchMethod(
        Invocation.method(
          #shouldEmbedLocation,
          [],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  bool shouldEmbedSecret() => (super.noSuchMethod(
        Invocation.method(
          #shouldEmbedSecret,
          [],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
}

/// A class which mocks [HashSubmissionService].
///
/// See the documentation for Mockito's code generation for more information.
class MockHashSubmissionService extends _i1.Mock
    implements _i13.HashSubmissionService {
  @override
  String get url => (super.noSuchMethod(
        Invocation.getter(#url),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i8.Future<void> submitHash(
    String? hash,
    String? email,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #submitHash,
          [
            hash,
            email,
          ],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [ImageMetaDataService].
///
/// See the documentation for Mockito's code generation for more information.
class MockImageMetaDataService extends _i1.Mock
    implements _i14.ImageMetaDataService {
  @override
  _i8.Future<String> addLocation(
    _i2.LocationModel? locationModel,
    String? filePath,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addLocation,
          [
            locationModel,
            filePath,
          ],
        ),
        returnValue: _i8.Future<String>.value(''),
        returnValueForMissingStub: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<String> addLocationAndSecret(
    _i2.LocationModel? locationModel,
    String? secretHash,
    String? filePath,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addLocationAndSecret,
          [
            locationModel,
            secretHash,
            filePath,
          ],
        ),
        returnValue: _i8.Future<String>.value(''),
        returnValueForMissingStub: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<String> addSecret(
    String? secretHash,
    String? filePath,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addSecret,
          [
            secretHash,
            filePath,
          ],
        ),
        returnValue: _i8.Future<String>.value(''),
        returnValueForMissingStub: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<_i3.MetaDataModel> retriveMetaData(String? filePath) =>
      (super.noSuchMethod(
        Invocation.method(
          #retriveMetaData,
          [filePath],
        ),
        returnValue: _i8.Future<_i3.MetaDataModel>.value(_FakeMetaDataModel_1(
          this,
          Invocation.method(
            #retriveMetaData,
            [filePath],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i3.MetaDataModel>.value(_FakeMetaDataModel_1(
          this,
          Invocation.method(
            #retriveMetaData,
            [filePath],
          ),
        )),
      ) as _i8.Future<_i3.MetaDataModel>);
}

/// A class which mocks [AudioMetaDataService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAudioMetaDataService extends _i1.Mock
    implements _i15.AudioMetaDataService {
  @override
  _i8.Future<String> addLocation(
    _i2.LocationModel? locationModel,
    String? filePath,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addLocation,
          [
            locationModel,
            filePath,
          ],
        ),
        returnValue: _i8.Future<String>.value(''),
        returnValueForMissingStub: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<String> addLocationAndSecret(
    _i2.LocationModel? locationModel,
    String? secretHash,
    String? filePath,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addLocationAndSecret,
          [
            locationModel,
            secretHash,
            filePath,
          ],
        ),
        returnValue: _i8.Future<String>.value(''),
        returnValueForMissingStub: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<String> addSecret(
    String? secretHash,
    String? filePath,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addSecret,
          [
            secretHash,
            filePath,
          ],
        ),
        returnValue: _i8.Future<String>.value(''),
        returnValueForMissingStub: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<_i3.MetaDataModel> retriveMetaData(String? filePath) =>
      (super.noSuchMethod(
        Invocation.method(
          #retriveMetaData,
          [filePath],
        ),
        returnValue: _i8.Future<_i3.MetaDataModel>.value(_FakeMetaDataModel_1(
          this,
          Invocation.method(
            #retriveMetaData,
            [filePath],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i3.MetaDataModel>.value(_FakeMetaDataModel_1(
          this,
          Invocation.method(
            #retriveMetaData,
            [filePath],
          ),
        )),
      ) as _i8.Future<_i3.MetaDataModel>);
}

/// A class which mocks [VideoMetaDataService].
///
/// See the documentation for Mockito's code generation for more information.
class MockVideoMetaDataService extends _i1.Mock
    implements _i16.VideoMetaDataService {
  @override
  _i8.Future<String> addLocation(
    _i2.LocationModel? locationModel,
    String? filePath,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addLocation,
          [
            locationModel,
            filePath,
          ],
        ),
        returnValue: _i8.Future<String>.value(''),
        returnValueForMissingStub: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<String> addLocationAndSecret(
    _i2.LocationModel? locationModel,
    String? secretHash,
    String? filePath,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addLocationAndSecret,
          [
            locationModel,
            secretHash,
            filePath,
          ],
        ),
        returnValue: _i8.Future<String>.value(''),
        returnValueForMissingStub: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<String> addSecret(
    String? secretHash,
    String? filePath,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addSecret,
          [
            secretHash,
            filePath,
          ],
        ),
        returnValue: _i8.Future<String>.value(''),
        returnValueForMissingStub: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<_i3.MetaDataModel> retriveMetaData(String? filePath) =>
      (super.noSuchMethod(
        Invocation.method(
          #retriveMetaData,
          [filePath],
        ),
        returnValue: _i8.Future<_i3.MetaDataModel>.value(_FakeMetaDataModel_1(
          this,
          Invocation.method(
            #retriveMetaData,
            [filePath],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i3.MetaDataModel>.value(_FakeMetaDataModel_1(
          this,
          Invocation.method(
            #retriveMetaData,
            [filePath],
          ),
        )),
      ) as _i8.Future<_i3.MetaDataModel>);
}

/// A class which mocks [VideoSavingService].
///
/// See the documentation for Mockito's code generation for more information.
class MockVideoSavingService extends _i1.Mock
    implements _i17.VideoSavingService {
  @override
  _i8.Future<String> saveFile() => (super.noSuchMethod(
        Invocation.method(
          #saveFile,
          [],
        ),
        returnValue: _i8.Future<String>.value(''),
        returnValueForMissingStub: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
}

/// A class which mocks [ImageSavingService].
///
/// See the documentation for Mockito's code generation for more information.
class MockImageSavingService extends _i1.Mock
    implements _i18.ImageSavingService {
  @override
  _i4.IMediaPickerService get imagePickerWrapper => (super.noSuchMethod(
        Invocation.getter(#imagePickerWrapper),
        returnValue: _FakeIMediaPickerService_2(
          this,
          Invocation.getter(#imagePickerWrapper),
        ),
        returnValueForMissingStub: _FakeIMediaPickerService_2(
          this,
          Invocation.getter(#imagePickerWrapper),
        ),
      ) as _i4.IMediaPickerService);
  @override
  _i8.Future<String> saveFile() => (super.noSuchMethod(
        Invocation.method(
          #saveFile,
          [],
        ),
        returnValue: _i8.Future<String>.value(''),
        returnValueForMissingStub: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
}

/// A class which mocks [ImageWaterMarkService].
///
/// See the documentation for Mockito's code generation for more information.
class MockImageWaterMarkService extends _i1.Mock
    implements _i19.ImageWaterMarkService {
  @override
  _i8.Future<String> addWaterMark(String? filePath) => (super.noSuchMethod(
        Invocation.method(
          #addWaterMark,
          [filePath],
        ),
        returnValue: _i8.Future<String>.value(''),
        returnValueForMissingStub: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
}

/// A class which mocks [VideoWaterMarkService].
///
/// See the documentation for Mockito's code generation for more information.
class MockVideoWaterMarkService extends _i1.Mock
    implements _i20.VideoWaterMarkService {
  @override
  _i8.Future<String> addWaterMark(String? filePath) => (super.noSuchMethod(
        Invocation.method(
          #addWaterMark,
          [filePath],
        ),
        returnValue: _i8.Future<String>.value(''),
        returnValueForMissingStub: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
}

/// A class which mocks [AudioHashingService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAudioHashingService extends _i1.Mock
    implements _i21.AudioHashingService {
  @override
  _i8.Future<String> hash(String? path) => (super.noSuchMethod(
        Invocation.method(
          #hash,
          [path],
        ),
        returnValue: _i8.Future<String>.value(''),
        returnValueForMissingStub: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
}

/// A class which mocks [ImageHashingService].
///
/// See the documentation for Mockito's code generation for more information.
class MockImageHashingService extends _i1.Mock
    implements _i22.ImageHashingService {
  @override
  _i8.Future<String> hash(String? path) => (super.noSuchMethod(
        Invocation.method(
          #hash,
          [path],
        ),
        returnValue: _i8.Future<String>.value(''),
        returnValueForMissingStub: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
}

/// A class which mocks [VideoHashingService].
///
/// See the documentation for Mockito's code generation for more information.
class MockVideoHashingService extends _i1.Mock
    implements _i23.VideoHashingService {
  @override
  _i8.Future<String> hash(String? path) => (super.noSuchMethod(
        Invocation.method(
          #hash,
          [path],
        ),
        returnValue: _i8.Future<String>.value(''),
        returnValueForMissingStub: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
}

/// A class which mocks [VerificationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockVerificationService extends _i1.Mock
    implements _i24.VerificationService {
  @override
  String get url => (super.noSuchMethod(
        Invocation.getter(#url),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i8.Future<_i5.VerificationStatusModel> verify(String? hash) =>
      (super.noSuchMethod(
        Invocation.method(
          #verify,
          [hash],
        ),
        returnValue: _i8.Future<_i5.VerificationStatusModel>.value(
            _FakeVerificationStatusModel_3(
          this,
          Invocation.method(
            #verify,
            [hash],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i5.VerificationStatusModel>.value(
                _FakeVerificationStatusModel_3(
          this,
          Invocation.method(
            #verify,
            [hash],
          ),
        )),
      ) as _i8.Future<_i5.VerificationStatusModel>);
  @override
  _i8.Future<bool> verifySignature(
    String? hash,
    String? signature,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #verifySignature,
          [
            hash,
            signature,
          ],
        ),
        returnValue: _i8.Future<bool>.value(false),
        returnValueForMissingStub: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);
}

/// A class which mocks [FileSelectionService].
///
/// See the documentation for Mockito's code generation for more information.
class MockFileSelectionService extends _i1.Mock
    implements _i25.FileSelectionService {
  @override
  _i8.Future<_i26.FileDataModel?> selectFileAsStream() => (super.noSuchMethod(
        Invocation.method(
          #selectFileAsStream,
          [],
        ),
        returnValue: _i8.Future<_i26.FileDataModel?>.value(),
        returnValueForMissingStub: _i8.Future<_i26.FileDataModel?>.value(),
      ) as _i8.Future<_i26.FileDataModel?>);
}

/// A class which mocks [HashLogic].
///
/// See the documentation for Mockito's code generation for more information.
class MockHashLogic extends _i1.Mock implements _i27.HashLogic {
  @override
  _i8.Future<String> hashBytes(_i28.Uint8List? bytes) => (super.noSuchMethod(
        Invocation.method(
          #hashBytes,
          [bytes],
        ),
        returnValue: _i8.Future<String>.value(''),
        returnValueForMissingStub: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<String> hashBytesInChunks(_i28.Uint8List? bytes) =>
      (super.noSuchMethod(
        Invocation.method(
          #hashBytesInChunks,
          [bytes],
        ),
        returnValue: _i8.Future<String>.value(''),
        returnValueForMissingStub: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<String> hashBytesInChunksFromStream(
          _i8.Stream<List<int>>? byteStream) =>
      (super.noSuchMethod(
        Invocation.method(
          #hashBytesInChunksFromStream,
          [byteStream],
        ),
        returnValue: _i8.Future<String>.value(''),
        returnValueForMissingStub: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
}

/// A class which mocks [ImagePickerWrapper].
///
/// See the documentation for Mockito's code generation for more information.
class MockImagePickerWrapper extends _i1.Mock
    implements _i29.ImagePickerWrapper {
  @override
  _i8.Future<_i28.Uint8List> getImageAsBytes() => (super.noSuchMethod(
        Invocation.method(
          #getImageAsBytes,
          [],
        ),
        returnValue: _i8.Future<_i28.Uint8List>.value(_i28.Uint8List(0)),
        returnValueForMissingStub:
            _i8.Future<_i28.Uint8List>.value(_i28.Uint8List(0)),
      ) as _i8.Future<_i28.Uint8List>);
  @override
  _i8.Future<_i28.Uint8List> getVideoAsBytes() => (super.noSuchMethod(
        Invocation.method(
          #getVideoAsBytes,
          [],
        ),
        returnValue: _i8.Future<_i28.Uint8List>.value(_i28.Uint8List(0)),
        returnValueForMissingStub:
            _i8.Future<_i28.Uint8List>.value(_i28.Uint8List(0)),
      ) as _i8.Future<_i28.Uint8List>);
}

/// A class which mocks [ShowInExplorer].
///
/// See the documentation for Mockito's code generation for more information.
class MockShowInExplorer extends _i1.Mock implements _i30.ShowInExplorer {
  @override
  _i8.Future<String> show({
    required String? transaction,
    _i30.Network? network = _i30.Network.bitcoin,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #show,
          [],
          {
            #transaction: transaction,
            #network: network,
          },
        ),
        returnValue: _i8.Future<String>.value(''),
        returnValueForMissingStub: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
}

/// A class which mocks [SignatureVerificationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignatureVerificationService extends _i1.Mock
    implements _i31.SignatureVerificationService {
  @override
  _i6.ECPublicKey get pubKey => (super.noSuchMethod(
        Invocation.getter(#pubKey),
        returnValue: _FakeECPublicKey_4(
          this,
          Invocation.getter(#pubKey),
        ),
        returnValueForMissingStub: _FakeECPublicKey_4(
          this,
          Invocation.getter(#pubKey),
        ),
      ) as _i6.ECPublicKey);
  @override
  set pubKey(_i6.ECPublicKey? _pubKey) => super.noSuchMethod(
        Invocation.setter(
          #pubKey,
          _pubKey,
        ),
        returnValueForMissingStub: null,
      );
  @override
  String get pemPubKey => (super.noSuchMethod(
        Invocation.getter(#pemPubKey),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i6.ECSignature loadAndConvertSignature(String? sig) => (super.noSuchMethod(
        Invocation.method(
          #loadAndConvertSignature,
          [sig],
        ),
        returnValue: _FakeECSignature_5(
          this,
          Invocation.method(
            #loadAndConvertSignature,
            [sig],
          ),
        ),
        returnValueForMissingStub: _FakeECSignature_5(
          this,
          Invocation.method(
            #loadAndConvertSignature,
            [sig],
          ),
        ),
      ) as _i6.ECSignature);
  @override
  _i6.ECPublicKey loadAndPrepPubKey() => (super.noSuchMethod(
        Invocation.method(
          #loadAndPrepPubKey,
          [],
        ),
        returnValue: _FakeECPublicKey_4(
          this,
          Invocation.method(
            #loadAndPrepPubKey,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeECPublicKey_4(
          this,
          Invocation.method(
            #loadAndPrepPubKey,
            [],
          ),
        ),
      ) as _i6.ECPublicKey);
  @override
  bool verify(
    String? hash,
    String? sig,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #verify,
          [
            hash,
            sig,
          ],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
}
