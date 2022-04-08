import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web3_connect/src/wallet_connect.dart';

class Web3Connect {
  Web3Connect();
  String account = "";
  late WalletConnectEthereumCredentials credentials;
  late WalletConnect connector;
  String rpcUrl = 'http://localhost:7545';
  late SessionStatus? session;
  int chainId = 4; //default rinkeby

  enterRpcUrl(String rpcUrl) {
    this.rpcUrl = rpcUrl;
  }

  enterChainId(int chainId) {
    this.chainId = chainId;
  }

  connect() async {
    await _walletConnect();
  }

  disconnect() async {
    await connector.killSession();
  }

  _walletConnect() async {
    connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
        name: 'WalletConnect',
        description: 'WalletConnect Developer App',
        url: 'https://walletconnect.org',
        icons: [
          'https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
        ],
      ),
    );
    // Subscribe to events
    connector.on('connect', (session) => print(session));
    connector.on('session_update', (payload) => print(payload));
    connector.on('disconnect', (session) => print(session));

    //Create a new session
    //await launch uri lets you choose which wallet you want to connect to
    if (!connector.connected) {
      session = await connector.createSession(
          chainId: chainId, onDisplayUri: (uri) async => await launch(uri));
    }
    account = session!.accounts[0];
    if (account != "") {
      //final client = Web3Client(rpcUrl, Client());
      EthereumWalletConnectProvider provider =
          EthereumWalletConnectProvider(connector);
      credentials = WalletConnectEthereumCredentials(provider: provider);
      //yourContract = YourContract(address: contractAddr, client: client);
    }
  }
}
