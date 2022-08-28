import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WalletView extends HookConsumerWidget {
  const WalletView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverFixedExtentList(
                    itemExtent: 100,
                    delegate: SliverChildListDelegate(
                      [
                        const Padding(
                          padding: EdgeInsets.only(),
                          // padding: const EdgeInsets.only(
                          //   left: kPaddingM,
                          //   right: kPaddingM,
                          //   bottom: kPaddingBottom,
                          // ),
                          // child: AccountTile(
                          //   index: 0,
                          //   action: 'create account',
                          //   icon: Center(child: plusSvg),
                          //   accountName: 'Create New Account',
                          // ),
                        ),
                      ],
                    ),
                  ),
                  SliverFixedExtentList(
                    itemExtent: 100,
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return const Padding(
                          padding: EdgeInsets.only(),
                          // padding: const EdgeInsets.only(
                          //   left: kPaddingM,
                          //   right: kPaddingM,
                          //   bottom: kPaddingBottom,
                          // ),
                          // child: AccountTile(
                          //   index: index,
                          //   action: 'view account',
                          //   icon: getIcon(
                          //     icon: accounts[index].icon!,
                          //     linked: accounts[index].linkedAccount!,
                          //   ),
                          //   accountName: accounts[index].accountName!,
                          //   nickname: accounts[index].nickname!,
                          //   accountBalance: accounts[index].accountBalance!,
                          //   publicKey: accounts[index].publicKey!,
                          // ),
                        );
                      },
                      // childCount: accounts.length,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
