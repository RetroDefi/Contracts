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

interface IVaultController {
    function minter() external view returns (address);
    function qbertChef() external view returns (address);
    function stakingToken() external view returns (address);
}