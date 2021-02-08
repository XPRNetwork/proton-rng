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

#include <rng/rng.hpp>
#include <boost/multiprecision/cpp_int.hpp>

using BN = boost::multiprecision::number<boost::multiprecision::cpp_int_backend<>>;

namespace proton {

void rng::verify_rsa_sha256_sig(
    string message,
    string signature,
    string exponent,
    string modulus
) {
    checksum256 msg_sha256 = eosio::sha256(message.data(), message.size());
    string msg_sha256_string = bin2hex(msg_sha256.extract_as_byte_array());

    auto pkcs1_encoding = "3031300d060960864801650304020105000420"s + msg_sha256_string;

    auto emLen = modulus.size() / 2;
    auto tLen = pkcs1_encoding.size() / 2;
    check(emLen >= tLen + 11, "length mismatch");

    pkcs1_encoding = "0001"s + string(2* (emLen - tLen - 3), 'f') + "00"s + pkcs1_encoding;

    const BN signature_int { "0x"s + signature };
    const BN exponent_int  { "0x"s + exponent };
    const BN modulus_int   { "0x"s + modulus };

    const BN decoded = boost::multiprecision::powm(signature_int, exponent_int, modulus_int);
    check(BN{"0x"s + pkcs1_encoding} == decoded, "Could not verify signature.");
}

} // end namespace proton