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
    
    modifier basicChecks(string _ecocAddress, address _ethAdress)
    {
        require(
            true, // check if _ecocAdress starts with "E"
            "Wrong ecoc address. Ecoc address doesn't starts with \"E\""
        );
        require(
            true, // check if _ecocAdress has 34 bytes length
            "Wrong ecoc address. Ecoc address must have a length of 34 bytes."
        );
        require(
            true,// check if _ethAdress is already in the array
            "Wrong ecoc address. This ethereum address is already registered."
        );
        
        _;
    }

    function chooseEcoAddress(string _addr) public basicChecks(_addr, msg.sender) returns(uint registeredAddresses)  {
        /* do error checking for _addr, use modifier
        check length and if starts with "E"
        */
        EthToEcoc memory m;
        m.ethAddress = msg.sender;
        m.ecocAddress = _addr;
        ethToEcoc.push(m);
        return ethToEcoc.length;
    }
    
    function alreadyRegistered() public view returns (uint length) {
        return ethToEcoc.length;
    }
}
