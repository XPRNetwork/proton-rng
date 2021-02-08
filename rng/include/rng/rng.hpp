// MIT License
// 
// Copyright (c) 2021 Proton
// Copyright (c) 2019 worldwide-asset-exchange
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#pragma once

// Standard.
#include <optional>
#include <vector>

#include <eosio/eosio.hpp>
#include <eosio/asset.hpp>
#include <eosio/crypto.hpp>
#include <eosio/transaction.hpp>

using namespace std;
using namespace eosio;

namespace proton {
  CONTRACT rng : public contract {
  public:
    using contract::contract;

    rng( name receiver, name code, datastream<const char*> ds )
      : contract(receiver, code, ds),
        config_table(receiver, receiver.value),
        jobs_table(receiver, receiver.value),
        signvals_table(receiver, receiver.value),
        sigpubkey_table(receiver, receiver.value) {};

    /**
     * Pauses/Resumes the smart contract
     */
    ACTION pause(bool paused);
    using pause_action = eosio::action_wrapper<"pause"_n, &rng::pause>;

    /**
     * Ask for a new random value
     * 
     * @param assoc_id User custom id to be used in 'receiverand' callback to 
     *                 identify the request.
     * @param signing_value Value used to sign the random value
     * @param caller Smart contract acount that implement 'reveiverand' callback
     */
    ACTION requestrand(uint64_t assoc_id, uint64_t signing_value, const eosio::name& caller);
    using requestrand_action = eosio::action_wrapper<"requestrand"_n, &rng::requestrand>;

    /**
     * Used by the oracle to set the generated random value
     */
    ACTION setrand(uint64_t job_id, const std::string& random_value);
    using setrand_action = eosio::action_wrapper<"setrand"_n, &rng::setrand>;

    /**
     * Removes jobs from the jobs table. The Oracle calls on it passing a list 
     * of dangling jobs.
     * 
     * @param job_ids A vector of jobs IDs to be removed.
     */
    ACTION killjobs(const std::vector<uint64_t>& job_ids);
    using killjobs_action = eosio::action_wrapper<"killjobs"_n, &rng::killjobs>;

    /**
     * Sets the public key used by the oracle to sign tx ids. Public keys are
     * stored in their raw RSA exponent and modulus form as hexadecimal integers
     * represented by strings of hex characters.
     * 
     * openssl rsa -in TestData/wax.4096.public.pem -pubin -text -noout
     * 
     * @param exponent The public key exponent
     * @param modulus The public key modulus
     */
    ACTION setsigpubkey(const std::string& exponent, const std::string& modulus);
    using setsigpubkey_action = eosio::action_wrapper<"setsigpubkey"_n, &rng::setsigpubkey>;

  private:
    TABLE config_a {
      uint64_t name;
      int64_t  value;

      auto primary_key() const { return name; }
    };
    using config_table_type = eosio::multi_index<"config.a"_n, config_a>;

    TABLE jobs_a {
      uint64_t    id;
      uint64_t    assoc_id;
      uint64_t    signing_value;
      eosio::name caller;

      auto primary_key() const { return id; }
    };
    using jobs_table_type = eosio::multi_index<"jobs.a"_n, jobs_a>;

    TABLE signvals_a {
      uint64_t signing_value;

      auto primary_key() const { return signing_value; }
    };
    using signvals_table_type = eosio::multi_index<"signvals.a"_n, signvals_a>;

    TABLE sigpubkey_a {
      uint64_t    id;
      std::string exponent;
      std::string modulus;

      auto primary_key() const { return id; }
    };
    using sigpubkey_table_type = eosio::multi_index<"sigpubkey.a"_n, sigpubkey_a>;

    config_table_type    config_table;
    jobs_table_type      jobs_table;
    signvals_table_type  signvals_table;
    sigpubkey_table_type sigpubkey_table;

    static constexpr uint64_t paused_row = "paused"_n.value;

    // Helpers
    bool is_paused() const;
    void set_config(uint64_t name, int64_t value);
    int64_t get_config(uint64_t name, int64_t default_value) const;
    uint64_t generate_next_index();
    void verify_rsa_sha256_sig(
      string message,
      string signature,
      string exponent,
      string modulus
    );

    template<unsigned N, typename T>
    static inline string bin2hex(const array<T, N>& bin)
    {
      string res;
      const char hex[] = "0123456789abcdef";
      for(auto byte : bin) {
        res += hex[byte >> 4];
        res += hex[byte & 0xf];
      }

      return res;
    };
  };
}; // end namespace proton