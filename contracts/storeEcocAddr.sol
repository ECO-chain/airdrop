pragma solidity ^0.4.25;

contract storeEcocAddr {

    struct EthToEcoc {
        address ethAddress;
        string  ecocAddress;
    }
    
    address public owner;
    EthToEcoc[] public ethToEcoc;

    
    constructor() public {
        owner = msg.sender;
    }
  /*
    function chooseEcoAddress (string _addr) public{
   
        return myStructs.length;
    // do error checking for addr, use modifier
        ethToEcoc[0].ethAddress=msg.sender; 
        ethToEcoc[0].ecocAddress=_addr;
    }*/ 
    
    function chooseEcoAddress(string _addr) public returns(uint registeredAddresses) 
    {
        /* do error checking for _addr, use modifier
        check length and if starts with "E"
        */
        EthToEcoc memory m;
        m.ethAddress = msg.sender;
        m.ecocAddress = _addr;
        ethToEcoc.push(m);
        return ethToEcoc.length;
    }
}
