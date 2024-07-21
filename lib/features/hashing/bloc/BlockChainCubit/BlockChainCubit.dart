import 'package:decentproof/features/metadata/enum/BlockChainEnum.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class BlockChainCubit extends HydratedCubit<BlockChain?> {
  BlockChainCubit() : super(null);

  void setBlockChain(BlockChain blockChain) {
    emit(blockChain);
  }

  @override
  BlockChain? fromJson(Map<String, dynamic> json) {
    if (BlockChain.values
        .any((element) => element.name == json["blockChain"])) {
      return BlockChain.values
          .firstWhere((element) => element.name == json["blockChain"]);
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(BlockChain? state) {
    return {"blockChain": state?.name};
  }
}
