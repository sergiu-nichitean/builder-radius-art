import { clusterApiUrl, Transaction, SystemProgram, Connection } from "@solana/web3.js";
import { WalletAdapterNetwork } from "@solana/wallet-adapter-base";
import {
  PhantomWalletAdapter,
  SolflareWalletAdapter
} from "@solana/wallet-adapter-wallets";
import bs58 from 'bs58';
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connectWallet() {
    const provider = eval('new ' + this.data.get('wallet') + 'WalletAdapter()');
    provider.connect().then(() => {
      const walletAddress = provider.publicKey.toString();
      const message = new TextEncoder().encode(`Sign this message to authenticate: ${Math.random()}`);
      provider.signMessage(message, "utf8").then((signedMessage) => {
        $.post('/users/wallet_auth/callback', {
          wallet_address: walletAddress,
          message: bs58.encode(message),
          signature: bs58.encode(signedMessage)
        }, function(data){
          if (data.success == true) {
            window.location.href = '/';
          } else {
            $('body > .container').prepend('<div class="row mt-4"><div class="col-sm-12"><div class="alert alert-danger">Authentication failed.</div></div></div>');
          }
        });
      });
    });
  }

  async buyCredits() {
    const creditsToBuy = $('#payment_credits').val();
    // TODO: get real time exchange rate from https://public.jupiterapi.com/quote?inputMint=EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v&outputMint=So11111111111111111111111111111111111111112&amount=100000
    const creditsInLamports = Math.ceil(70260.50 * creditsToBuy);

    const connection = new Connection('https://solana-mainnet.g.alchemy.com/v2/y4kWHXUykXn5CL2b_9Az0nCzvoeB4ScI');
    const latestBlockhash = await connection.getLatestBlockhash();

    const provider = eval('new ' + this.data.get('wallet') + 'WalletAdapter()');
    provider.connect().then(async () => {
      showLoader();

      const transaction = new Transaction().add(
        SystemProgram.transfer({
          fromPubkey: provider.publicKey,
          toPubkey: '9M3TXfSCY87CDTppVti5St7LnoFt7GrmXQFFTQjBk9q8',
          lamports: creditsInLamports,
        })
      );

      try {
        transaction.feePayer = provider.publicKey;
        transaction.recentBlockhash = await latestBlockhash.blockhash;

        const signature = await provider.sendTransaction(transaction, connection);
        const transactionResult = await connection.confirmTransaction(signature, "processed");

        $.post('/payments/create_crypto', { credits: creditsToBuy }, function(payment_data) {
          if(payment_data.success) {
            window.location = '/';
          } else {
            paymentError(update_data.error);
            hideLoaderAndClose();
          }
        });
      } catch(error) {
        paymentError(error.message);
        hideLoaderAndClose();
      }
    });

    function showLoader() {
      $('#wallet_modal .spinner-border').show();
      $('#wallet_modal .list-group').hide();
      $('#wallet_modal .modal-body').addClass('text-center');
    }

    function hideLoaderAndClose() {
      $('#wallet_modal .btn-close').click();
      $('#wallet_modal .spinner-border').hide();
      $('#wallet_modal .modal-body').removeClass('text-center');
      $('#wallet_modal .list-group').show();
    }
  }
}
