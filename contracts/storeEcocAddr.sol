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
    
  
    modifier basicChecks(address _ethAdress, string _ecocAddress)
    {
        /* check if _ecocAdress starts with "E" */
        require(
            checkFirstChar(_ecocAddress) == 69 , 
            "Wrong ecoc address. Ecoc address doesn't starts with \"E\" "
        );
        /* check if _ecocAdress is exactly 34 bytes in length */
        require(
            bytes(_ecocAddress).length == 34 ,
            "Wrong ecoc address. Ecoc address must have a length of exactly 34 bytes."
        );
        /* check if _ethAdress is already in the array */
        bool addrExists = false ;
        for (uint c=0; c<ethToEcoc.length; c++) {
            if (ethToEcoc[c].ethAddress==_ethAdress) {
                addrExists = true;
                break ;
            }
        }
        require(
            !addrExists,
            "This ethereum address is already registered."
        );
        
        _;
    }

    function checkFirstChar(string _ecocAddress) internal pure returns (byte firstChar) { /* we expect UTF-8 only characters */
        bytes memory strBytes = bytes(_ecocAddress);
        firstChar=strBytes[0];
        return  firstChar;
    }
    
    function chooseEcoAddress(string _ecocAddr) public basicChecks(msg.sender, _ecocAddr) returns(uint registeredAddresses)  {
        /* do error checking for _addr, use modifier
        check length and if starts with "E"
        */
        EthToEcoc memory m;
        m.ethAddress = msg.sender;
        m.ecocAddress = _ecocAddr;
        ethToEcoc.push(m);
        return ethToEcoc.length;
    }
    
    function alreadyRegistered() public view returns (uint length) {
        return ethToEcoc.length;
    }
}
