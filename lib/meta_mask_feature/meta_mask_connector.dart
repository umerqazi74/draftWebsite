import 'package:draft_website/api/repository/create_team_repository.dart';
import 'package:draft_website/api/repository/player_data_repository.dart';
import 'package:draft_website/core/consts.dart';
import 'package:draft_website/screens/drawer_screen/drawer_tabs/draft/draft_screen.dart';
import 'package:draft_website/screens/drawer_screen/drawer_tabs/teams/teams_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'meta_mask_provider.dart';

class MetaMaskConnector extends StatefulWidget {
  final String featureToOpen;
  const MetaMaskConnector({super.key, required this.featureToOpen});

  @override
  State<MetaMaskConnector> createState() => _MetaMaskConnectorState();
}

class _MetaMaskConnectorState extends State<MetaMaskConnector> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(                                                  //Change the provider
      create: (context) => MetaMaskProvider()..init(),                              //create an instant
      builder: (context, child) {
        return Scaffold(
          backgroundColor: whiteColor,
          body: Stack(
            children: [
              Center(
                child: Consumer<MetaMaskProvider>(
                  builder: (context, provider, child) {
                    late final String text;                                               //check the state and display it

                    if (provider.isConnected && provider.isInOperatingChain) {
                      text = 'Connected';//connected
                        print(provider.currentAddress);

                      if(widget.featureToOpen == "myTeam"){
                      return const TeamsScreen ();
                      // return CreateTeamPage ();
                    }if(widget.featureToOpen == "myPlayers"){
                        return  MyPlayersScreen ();
                      }


                    } else if (provider.isConnected &&
                        !provider.isInOperatingChain) {
                      text =
                      'Wrong chain. Please connect to ${MetaMaskProvider.operatingChain}';            //wrong chain, what chain it should be connected to
                    } else if (provider.isEnabled) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Click to connect...'),
                          const SizedBox(height: 8),
                          CupertinoButton(
                            onPressed: () =>
                                context.read<MetaMaskProvider>().connect(),                               //call metamask on click
                            color: Colors.white,
                            padding: const EdgeInsets.all(0),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                border: Border.all(color: Colors.grey.shade200)
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.network(
                                    'https://i0.wp.com/kindalame.com/wp-content/uploads/2021/05/metamask-fox-wordmark-horizontal.png?fit=1549%2C480&ssl=1',
                                    width: 300,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      text = 'Please install MetaMask';                           //please use web3 supported browser
                    }

                    return ShaderMask(                                                          // a little bit of styling for text
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Colors.purple, Colors.blue, Colors.red],
                      ).createShader(bounds),
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    );
                  },
                ),
              ),
              Positioned.fill(
                child: IgnorePointer(
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTicLAkhCzpJeu9OV-4GOO-BOon5aPGsj_wy9ETkR4g-BdAc8U2-TooYoiMcPcmcT48H7Y&usqp=CAU',
                    fit: BoxFit.cover,
                    opacity: const AlwaysStoppedAnimation(0.025),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
