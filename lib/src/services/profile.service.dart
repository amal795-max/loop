import 'package:loop/src/utils/app_urls.dart';

import '../data/models/user_info_model.dart';
import '../imports/imports.dart';
import '../utils/body_params.dart';

class ProfileService {
  ProfileService._(this._dioService);
  static final ProfileService instance = ProfileService._(DioService.instance);

  final DioService _dioService;

  FutureEither<UpdateProfileModel> updateProfile(UpdateProfileRequestModel request) async {
    final mapData = request.toJson();
    if (request.image != null) {
      final fileName = request.image!.path.split('/').last;
      mapData['image'] = await MultipartFile.fromFile(
        request.image!.path,
        filename: fileName,
      );
    }

    final formData = FormData.fromMap(mapData);

    final response = await _dioService.post(
      UrlPath.editInfo,
      data: formData,

    );
    return response.fold(
          (failure) => left(failure),
          (response) => right(UpdateProfileModel.fromJson(response.data)),
    );
  }

}