####################################################################################
 # Licensed to the Apache Software Foundation (ASF) under one or more
 # contributor license agreements.  See the NOTICE file distributed with
 # this work for additional information regarding copyright ownership.
 # The ASF licenses this file to You under the Apache License, Version 2.0
 # (the "License"); you may not use this file except in compliance with
 # the License.  You may obtain a copy of the License at
 #
 #    http://www.apache.org/licenses/LICENSE-2.0
 #
 # Unless required by applicable law or agreed to in writing, software
 # distributed under the License is distributed on an "AS IS" BASIS,
 # WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 # See the License for the specific language governing permissions and
 # limitations under the License.
####################################################################################
 
difficulty=4
transaction="This text goes permanently and immutable into the blockchain"
nonce=0


prefix=`for i in $(seq $difficulty); do echo -n '0'; done`
while true; do 
    string=$transaction",nonce="$nonce
    hash=`echo $string|openssl dgst -sha256|openssl dgst -sha256|awk -F" " '{print $2}'`
    echo $string",hash="$hash
    hashpart=`echo $hash |cut -c 1-$difficulty`
    if [ $hashpart == $prefix ]; then
        echo "hash found:"$hash
        break
    fi
    let "nonce=nonce+1"
done
