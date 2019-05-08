pragma solidity ^0.5.0;

import "./Stoppable.sol";

contract Splitter is Stoppable{
    
    mapping(address => uint256) public balances;
    
    function split(address split1, address split2) public onlyIfRunning payable returns (bool) {
        require(msg.sender != address(0));
        require(msg.value > 0);
        require(split1 != address(0));
        require(split2 != address(0));
        require(msg.value%2 == 0);
        balances[split1] += msg.value/2;
        balances[split2] += msg.value/2;
        return true;
        
    }
    
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
    
    function withdraw() public onlyIfRunning {
       // require(balances[msg.sender] > amount);
        uint256 amtToSend = balances[msg.sender];
        balances[msg.sender] -= amtToSend;
        msg.sender.transfer(amtToSend);
    }
    
}