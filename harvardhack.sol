// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Storage is ERC721{

    struct Person {
        string name; //name of the policy purchaser 
        uint256 SSN; //SSN of the policy purchaser
        uint256 age; // age of the policy purchaser
        uint256 premiumAmount; //policy premium paid out by the policy purchaser
        address policyHolderAddress; //address of the policyholder
        address beneficiaryHolderAddress; //address of the beneficiary
        uint256 riskFactorRating; //rating based on the health riskiness of the policy holder 


    }
    
    Person p ;
    uint256 tokenID;
    mapping (uint256=>string) public tokenToUserName;
    constructor(string memory _name,string memory _symbol, address memory _policyInsurerAddress, uint256 memory _policyPayout) ERC721(_name,_symbol, _policyInsurerAddress, _policyPayout){
        tokenID = 0;
    }

    function personConstructor(string _name, uint256 _SSN, uint256 _age, uint256 _premiumAmount, address _policyHolderAddress, address _beneficiaryHolderAddress, uint256 _riskFactorRating ) private {
        p.name = _name;
        p.SSN = _SSN; 
        p.age = _age;
        p.premiumAmount = _premiumAmount;
        p.policyHolderAddress = _policyHolderAddress;
        p.beneficiaryHolderAddress = _beneficiaryHolderAddress;
        p.riskFactorRating = _riskFactorRating;
        

    }

    //  _safeMint(address to, uint256 tokenId)
    function mintNFT(string memory userName) public {
        _safeMint(msg.sender,tokenID);
        tokenToUserName[tokenID] = userName;
        tokenID = tokenID+1;
    }

    function payPremium(uint256 _premiumAmount, address _policyInsurerAddress) public {
        if (tokenToUserName[tokenID].policyHolderAddress != msg.sender) {
            revert("invalid sender"); 
        }
        
    }

}