import 'package:flutter/cupertino.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'dart:html' as html;  // Import to access browser functionality
import '../api/repository/player_data_repository.dart';

class MetaMaskProvider extends ChangeNotifier {                          //here we will store our provider
  static const operatingChain = 1;                                       //First we will define operating chain

  String currentAddress = '';                                             //current address

  int currentChain = -1;                                                  //current chain

  bool get isEnabled => ethereum != null;                                 // check if web3 is enable

  bool get isInOperatingChain => currentChain == operatingChain;          //current chain which will allow you to chain in application

  bool get isConnected => isEnabled && currentAddress.isNotEmpty;         //current wallet is connected

  Future<void> connect() async {                                          //a function to connect to the wallet
    if (isEnabled) {                                                      //check if web3 is enabled
      final accs = await ethereum!.requestAccount(); //we request address from the account

      if (accs.isNotEmpty){
        PlayersDataRepository playerDR = PlayersDataRepository();
        await playerDR.storeWalletValue(accs.first);
        currentAddress = accs.first;
      } //assign current address to first address

      currentChain = await ethereum!.getChainId();                         //we will update the current chain

      notifyListeners();                                                   //notify our listener, which will be dapp
    }
  }

  clear() async {                                                                //clear address and chain
    currentAddress = '';
    currentChain = -1;
    PlayersDataRepository playerDR = PlayersDataRepository();
    await playerDR.storeWalletValue("");
    notifyListeners();                                                     //it will update listener
  }

  init() {                                                                 //initialize listener
    if (isEnabled) {

      ethereum!.onAccountsChanged((accounts) {//account change
        clear();
      });
      ethereum!.onChainChanged((accounts) {                                 //chain change
      });

      // if enabled then connect
      connect();
    }else{
      html.window.open('https://metamask.io/download.html', '_blank');
    }
  }

}
