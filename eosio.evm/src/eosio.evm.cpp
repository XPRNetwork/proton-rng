#include <eosio.evm/eosio.evm.hpp>
namespace eosio_evm
{

void evm::create (
  const eosio::name& account,
  const std::string& data
) {
  // Check that account is authorized
  require_auth(account);

  // Encode using RLP(account.value, data)
  auto accounts_byaccount = _accounts.get_index<eosio::name("byaccount")>();
  auto existing_account = accounts_byaccount.find(account.value);
  eosio::check(existing_account == accounts_byaccount.end(), "an EVM account is already linked to this EOS account.");

  // Encode using RLP, Hash and get right-most 160 bits (Address)
  const auto rlp_encoding = rlp::encode(account.value, data);
  eosio::checksum160 address_160 = toChecksum160( keccak_256(rlp_encoding) );

  // Create user account
  auto address_256        = pad160(address_160);
  auto accounts_byaddress = _accounts.get_index<eosio::name("byaddress")>();
  auto existing_address   = accounts_byaddress.find(address_256);
  eosio::check(existing_address == accounts_byaddress.end(), "an EVM account with this address already exists.");
  _accounts.emplace(account, [&](auto& a) {
    a.index   = _accounts.available_primary_key();
    a.address = address_160;
    a.nonce   = 1;
    a.account = account;
    a.balance = eosio::asset(0, TOKEN_SYMBOL);
  });

  // Print out the address
  eosio::print(address_160);
}

void evm::raw(
  const std::vector<int8_t>& tx,
  const std::optional<eosio::checksum160>& sender
) {
  // Create transaction
  auto transaction = EthereumTransaction(tx);
  // transaction.printhex();

  // Index by address
  auto accounts_byaddress = _accounts.get_index<eosio::name("byaddress")>();
  decltype(accounts_byaddress.begin()) caller;

  // The “R” and “S” values of the transaction are 0 (EOS SPECIAL)
  if (transaction.is_zero())
  {
    // Ensure sender exists
    eosio::check(sender.has_value(), "Invalid Transaction: no signature in transaction and no sender address was provided.");
    caller = accounts_byaddress.find(pad160(*sender));
    eosio::check(caller != accounts_byaddress.end(), "Invalid Transaction: sender address does not exist (without signature).");

    // Ensure EOSIO account is associated
    eosio::check(caller->get_account_value() != 0, "Invalid Transaction: no EOSIO account is associated with the address 0x s" + intx::hex(caller->get_address()));

    // Check authorization of associated EOSIO account
    eosio::require_auth(caller->account);

    // Set transaction sender
    transaction.sender = *sender;
  }
  // The “R” and “S” values of the transaction are NOT 0
  else
  {
    // EC RECOVERY
    eosio::checksum256 sender_256 = pad160(transaction.get_sender());

    // Ensure signer exists
    caller = accounts_byaddress.find(sender_256);
    eosio::check(caller != accounts_byaddress.end(), "Invalid Transaction: sender address does not exist (with signature).");
  }

  // Check account nonce
  eosio::check(caller->get_nonce() == transaction.nonce, "Invalid Transaction: incorrect nonce, received " + to_string(transaction.nonce) + " expected " + std::to_string(caller->get_nonce()));
  accounts_byaddress.modify(caller, eosio::same_payer, [&](auto& a) {
    a.nonce += 1;
  });

  // Check balance
  eosio::check(caller->get_balance() >= transaction.value, "Invalid Transaction: Sender balance too low for value specified");

  /**
   * Savepoint: Anything from this point on could be reverted
   *
   * CANT USE eosio::check()
   */

  // Execute transaction
  Processor(transaction, this).process_transaction(*caller);
}

/**
 * Will always assert, replicates Ethereum Call functionality
 */
void evm::call(
  const std::vector<int8_t>& tx,
  const std::optional<eosio::checksum160>& sender
) {
  auto transaction = EthereumTransaction(tx);

  // Find caller
  auto accounts_byaddress = _accounts.get_index<eosio::name("byaddress")>();
  auto caller = Account();

  if (sender) {
    auto account = accounts_byaddress.find(pad160(*sender));
    if (account == accounts_byaddress.end()) {
      caller = *account;
    }
  }

  // Create processor and find result
  auto processor = Processor(transaction, this);
  auto result = processor.initialize_call(caller);

  // Print Receipt
  eosio::print(bin2hex(result.output));

  // IMPORTANT, DO NOT REMOVE
  eosio::check(false, "");
}

} // namepsace eosio_evm