// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/** 
 * @title userInfo
 * @dev Implements voting process along with vote delegation
 */
contract userInfo {
    uint256 policyInsurerAddress; //address of the insurer 
    uint256 policyPayout; //pay out amount of the policy


    struct Person {
        string name; //name of the policy purchaser 
        uint256 SSN; //SSN of the policy purchaser
        uint8 age; // age of the policy purchaser
        uint256 premiumAmount; //policy premium paid out by the policy purchaser
        uint256 policyHolderAddress; //address of the policyholder
        uint256 beneficiaryHolderAddress; //address of the beneficiary
        uint8 riskFactorRating; //rating based on the health riskiness of the policy holder 


    }
    Person p ;

    constructor(uint256 memory _policyInsurerAddress, uint256 memory _policyPayout) {
        
        policyInsurerAddress = 0;
        policyPayout = 0;

    }

    function personConstructor(string _name, unit _date) private {
        p.name = _name;
        p.date = _date;
    }
}