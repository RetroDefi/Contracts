// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

/**



██████╗░███████╗████████╗██████╗░░█████╗░  ██████╗░███████╗███████╗██╗
██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██╔══██╗  ██╔══██╗██╔════╝██╔════╝██║
██████╔╝█████╗░░░░░██║░░░██████╔╝██║░░██║  ██║░░██║█████╗░░█████╗░░██║
██╔══██╗██╔══╝░░░░░██║░░░██╔══██╗██║░░██║  ██║░░██║██╔══╝░░██╔══╝░░██║
██║░░██║███████╗░░░██║░░░██║░░██║╚█████╔╝  ██████╔╝███████╗██║░░░░░██║
╚═╝░░╚═╝╚══════╝░░░╚═╝░░░╚═╝░░╚═╝░╚════╝░  ╚═════╝░╚══════╝╚═╝░░░░░╚═╝


// R-Cube Protocol is a Deflationary and Dynamic supply Token that runs in cycles 
   Each cycle, the Burn Rate is increased in 1% increments for each 500,000 Tokens transacted
   After the Burn Rate cap is reached,it will reset to the initial rate, after cycle resets a rebase 
   will be called which rebases 25% of the Tokens burnt during the previous cycle

/*
 * Telegram: https://t.me/retrodefibsc
 * Website: https://retrodefi.net
 */


library PoolConstant {

    enum PoolTypes {
        QBertStake, // no perf fee
        QBertBit_deprecated, // deprecated
        CakeStake, BitToBit, BitToCake,
        QBert, // no perf fee
        QBertBNB
    }

    struct PoolInfoBSC {
        address pool;
        uint balance;
        uint principal;
        uint available;
        uint tvl;
        uint utilized;
        uint liquidity;
        uint pBASE;
        uint pQBert;
        uint depositedAt;
        uint feeDuration;
        uint feePercentage;
    }

    struct PoolInfoETH {
        address pool;
        uint collateralETH;
        uint collateralBSC;
        uint bnbDebt;
        uint leverage;
        uint tvl;
        uint updatedAt;
        uint depositedAt;
        uint feeDuration;
        uint feePercentage;
    }
}