import 'package:decentproof/features/hashing/bloc/BlockChainCubit/BlockChainCubit.dart';
import 'package:decentproof/features/metadata/enum/BlockChainEnum.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_icons/simple_icons.dart';

class BlockChainSelectionDialog extends StatelessWidget {
  const BlockChainSelectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Dialog(
      child: SizedBox(
        width: size.width * .45,
        height: size.height * .45,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<BlockChainCubit, BlockChain?>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("homePage.blockChainSelectionDialog.title".tr(),
                      style: Theme.of(context).textTheme.titleLarge),
                  Text("homePage.blockChainSelectionDialog.description".tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center),
                  RadioListTile.adaptive(
                      value: BlockChain.BTC,
                      groupValue: state,
                      onChanged: (chain) =>
                          context.read<BlockChainCubit>().setBlockChain(chain!),
                      title: const SizedBox(
                        width: 50,
                        child: Row(
                          children: [
                            Icon(Icons.currency_bitcoin),
                            Text("Bitcoin")
                          ],
                        ),
                      )),
                  RadioListTile.adaptive(
                    value: BlockChain.ETH,
                    groupValue: state,
                    onChanged: (chain) =>
                        context.read<BlockChainCubit>().setBlockChain(chain!),
                    title: const SizedBox(
                      width: 50,
                      child: Row(
                        children: [
                          Icon(SimpleIcons.ethereum),
                          Text("Ethereum")
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (state != null) {
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(
                          "homePage.blockChainSelectionDialog.submit".tr()))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
