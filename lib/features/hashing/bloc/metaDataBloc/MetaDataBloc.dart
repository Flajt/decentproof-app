import 'package:decentproof/features/hashing/bloc/metaDataBloc/MetaDataEvents.dart';
import 'package:decentproof/features/hashing/bloc/metaDataBloc/MetaDataStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MetaDataBloc extends Bloc<MetaDataEvents, MetaDataState> {
  MetaDataBloc() : super(InitalMetdataBlocState()) {
    on<ApplyMetaDataToAudio>((event, emit) {});
    on<ApplyMetaDataToImage>((event, emit) {});
    on<ApplyMetaDataToVideo>((event, emit) {});
  }
}
