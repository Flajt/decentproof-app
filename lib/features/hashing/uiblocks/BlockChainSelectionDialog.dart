import 'package:decentproof/features/hashing/bloc/BlockChainCubit/BlockChainCubit.dart';
import 'package:decentproof/features/metadata/enum/BlockChainEnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlockChainSelectionDialog extends StatelessWidget {
  const BlockChainSelectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final BlockChainCubit blockChainCubit = context.read<BlockChainCubit>();
    return Dialog(
      child: SizedBox(
        width: size.width * .4,
        height: size.height * .4,
        child: Column(
          children: [
            Text("Title", style: Theme.of(context).textTheme.titleMedium),
            Text("", style: Theme.of(context).textTheme.bodyMedium),
            Radio.adaptive(
              value: BlockChain.BTC,
              groupValue: blockChainCubit.state,
              onChanged: (chain) => blockChainCubit.setBlockChain(chain!),
            ),
            Radio.adaptive(
                value: BlockChain.ETH,
                groupValue: blockChainCubit.state,
                onChanged: (chain) => blockChainCubit.setBlockChain(chain!)),
            ElevatedButton(
                onPressed: () {
                  if (blockChainCubit.state != null) {
                    Navigator.of(context).pop();
                  }
                },
                child: Text(""))
          ],
        ),
      ),
    );
  }
}
