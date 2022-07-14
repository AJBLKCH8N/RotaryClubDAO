//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract rotaryclubtokens is ERC1155 {
    address public governance;
    uint256 public tokenCount;
    
    modifier onlyGovernance() {
        require(msg.sender == governance, "only governance can call this");
        
        _;
    }

    constructor(address governance_) public ERC1155("") {
        governance = governance_;
        tokenCount = 0;
    }
    
    function addNewAirline(uint256 initialSupply) external onlyGovernance {
        tokenCount++;
        uint256 rotaryTokenClassId = airlineCount;

        _mint(msg.sender, rotaryTokenClassId, initialSupply, "");        
    }
}
