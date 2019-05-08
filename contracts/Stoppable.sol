pragma solidity ^0.5.0;

import "./Owned.sol";

contract Stoppable is Owned{
    bool public running;

    event LogRunSwitch(address sender, bool switchSetting);

    modifier onlyIfRunning {
        require (running);
        _;
    }
    constructor() public {
        running = true;
    }

    function changeRunSwitch(bool runSwitch) 
    public onlyOwner
    returns (bool)
    {
        running = runSwitch;
        emit LogRunSwitch(msg.sender,runSwitch);
        return true;

    }

}