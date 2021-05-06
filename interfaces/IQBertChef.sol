// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;
pragma experimental ABIEncoderV2;

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

interface IQBertChef {

    struct UserInfo {
        uint balance;
        uint pending;
        uint rewardPaid;
    }

    struct VaultInfo {
        address token;
        uint allocPoint;       // How many allocation points assigned to this pool. QBERTs to distribute per block.
        uint lastRewardBlock;  // Last block number that QBERTs distribution occurs.
        uint accQBertPerShare; // Accumulated QBERTs per share, times 1e12. See below.
    }

    function qbertPerBlock() external view returns (uint);
    function totalAllocPoint() external view returns (uint);

    function vaultInfoOf(address vault) external view returns (VaultInfo memory);
    function vaultUserInfoOf(address vault, address user) external view returns (UserInfo memory);
    function pendingQBert(address vault, address user) external view returns (uint);

    function notifyDeposited(address user, uint amount) external;
    function notifyWithdrawn(address user, uint amount) external;
    function safeQBertTransfer(address user) external returns (uint);
}