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

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract WhitelistUpgradeable is OwnableUpgradeable {
    mapping (address => bool) private _whitelist;
    bool private _disable;                      // default - false means whitelist feature is working on. if true no more use of whitelist

    event Whitelisted(address indexed _address, bool whitelist);
    event EnableWhitelist();
    event DisableWhitelist();

    modifier onlyWhitelisted {
        require(_disable || _whitelist[msg.sender], "Whitelist: caller is not on the whitelist");
        _;
    }

    function __WhitelistUpgradeable_init() internal initializer {
        __Ownable_init();
    }

    function isWhitelist(address _address) public view returns(bool) {
        return _whitelist[_address];
    }

    function setWhitelist(address _address, bool _on) external onlyOwner {
        _whitelist[_address] = _on;

        emit Whitelisted(_address, _on);
    }

    function disableWhitelist(bool disable) external onlyOwner {
        _disable = disable;
        if (disable) {
            emit DisableWhitelist();
        } else {
            emit EnableWhitelist();
        }
    }

    uint256[49] private __gap;
}